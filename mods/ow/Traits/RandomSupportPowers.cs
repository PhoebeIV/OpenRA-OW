// RandomSupportPowers.cs

// These traits let support powers fire at a random location instead of wherever the player clicked. 
// We can use them in YAML the same way you'd use the normal power -- just change the trait name to the Random version.
// e.g. NukePower: becomes RandomNukePower:

// we get four ways to pick where the power lands, set via TargetMode:
// NearTarget   -- random spot within MaxRadius of where the player clicked
// RandomMap    -- completely random anywhere on the playable map
// MapCenter    -- always fires at the dead center of the map
// CenterOffset -- map center shifted by however many cells you set in CenterOffset

// These all now work with both manual and autofire on a timer

// Issues:
// ---------------------------------------------------
// The engine locks up NukePower and IonCannonPower from what i can find.
// For those 2 i just tried to rebuild them using the same visual effects the originals use so we won't notice a difference in-game.

// Airstrike, Paratroopers, and DropPods are easier because they have a
// method we can call directly with a position, so we just pass in the
// random cell and they handle the rest.

// SpawnActorPower doesn't have that method, so instead we jankily swap out its target right before it fires. 

using System.Collections.Generic;
using System.Linq;					  // lets shit function without breaking.
using OpenRA.Graphics;                // IRenderable, WorldRenderer
using OpenRA.Orders;                  // IOrderGenerator
using OpenRA.Mods.Cnc.Effects;        // gives IonCannon effects
using OpenRA.Mods.Cnc.Traits;         // AirstrikePower, ParatroopersPower, DropPodsPower
using OpenRA.Mods.Common.Effects;     // gives NukeLaunch effect
using OpenRA.Mods.Common.Graphics;    // RangeCircleAnnotationRenderable for the targeting circle
using OpenRA.Mods.Common.Traits;      // SupportPower, SpawnActorPower, NukePowerInfo
using OpenRA.Mods.RA.Traits;          // DropPodsPowerOW is found in here
using OpenRA.Primitives;              // Color
using OpenRA.Traits;

namespace OpenRA.Mods.OW.Traits
{
	// These are the four options for TargetMode: in YAML.
	public enum RandomTargetMode
	{
		// Pick a random cell somewhere within MaxRadius cells of where the player clicked.
		// Set MaxRadius: 0 to make it pick anywhere on the whole map instead.
		NearTarget,

		// Ignore the player's click and pick somewhere random on the whole map.
		// makes the intention a bit clearer when you look at the YAML over using neartarget 0.
		RandomMap,

		// Always fires at the exact center cell of the playable map. can be used for clusters or something idk just wanted it
		MapCenter,

		// Fires at the map center shifted by a fixed number of cells.
		// Set CenterOffset: 10,0 to put it 10 cells east of center, for example.
		// The result gets filtered so it can't go off the edge of the map. i hope, were gonna break this i know it
		CenterOffset,
	}

	// This is the "helper" that all the Random Power traits use to figure out which cell to actually fire at.
	static class RandomTargetHelper
	{
		// SpawnActorPower stores its target in a hidden private field that we can't normally access. 
		// We find it here when the game first loads so we can swap it out later when the power fires. 
		// (i figured this out playing with a AI generated examples looking for ways to hook into things before making my own.)
		// The ?? part is a fallback name for the same field
		// different builds of the engine might store it under a slightly different name. just so it doesnt break later
		static readonly System.Reflection.FieldInfo OrderTargetField =
			typeof(Order).GetField("target",
				System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance)
			?? typeof(Order).GetField("<Target>k__BackingField",
				System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

		// Works out which cell to target based on the TargetMode setting.

		// we always use world.SharedRandom for any random picks here, never System.Random. 
		// SharedRandom is the game's built-in random number generator that all players share, 
		// so in a multiplayer game everyone gets the same result and the game doesn't go out of sync.

		// We also try to stay inside world.Map.Bounds (the playable area).
		// world.Map.AllCells includes margin cells outside the playable area so it cant just pick from that list directly or shit breaks
		public static CPos Resolve(World world, Order order, RandomTargetMode mode, WDist maxRadius, CVec centerOffset)
		{
			var bounds = world.Map.Bounds;

			switch (mode)
			{
				case RandomTargetMode.MapCenter:
				case RandomTargetMode.CenterOffset:
				{
					// Find the middle of the playable area based on its bounds rectangle.
					// For CenterOffset, Clamp() makes sure the shifted point doesn't end up outside the map if you give it a big offset.
					var center = new CPos(bounds.Left + bounds.Width / 2, bounds.Top + bounds.Height / 2);
					return mode == RandomTargetMode.CenterOffset
						? world.Map.Clamp(center + centerOffset)
						: center;
				}

				case RandomTargetMode.RandomMap:
					// Pick a random column and row within the playable area.
					// Doing it this way is also faster than filtering AllCells, gets laggy as shit on large maps otherwise.
					return new CPos(
						bounds.Left + world.SharedRandom.Next(bounds.Width),
						bounds.Top + world.SharedRandom.Next(bounds.Height));

				default: // NearTarget
				{
					// MaxRadius: 0 is treated the same as RandomMap just pick anywhere.
					if (maxRadius == WDist.Zero)
						return new CPos(
							bounds.Left + world.SharedRandom.Next(bounds.Width),
							bounds.Top + world.SharedRandom.Next(bounds.Height));

					// Find every cell that is (a) inside the playable map and (b) within the radius circle
					// then pick one at random.
					var origin = order.Target.CenterPosition;
					var candidates = world.Map.AllCells
						.Where(c => bounds.Contains(c.X, c.Y) &&
						            (world.Map.CenterOfCell(c) - origin).Length <= maxRadius.Length)
						.ToList();

					// If the circle had no valid cells in it (can lank out if we clicked right on the map edge),
					// just fire at the click location so the power still does something instead of wasting off map.
					return candidates.Count > 0
						? candidates[world.SharedRandom.Next(candidates.Count)]
						: world.Map.CellContaining(origin);
				}
			}
		}

		// Handles clicking the power icon in the UI.
		// For RandomMap/MapCenter/CenterOffset there's no point making the player click a target
		// since we're going to ignore it anyway -- so we just fire immediately.
		// For NearTarget we show a custom targeting cursor that also draws the radius circle
		// so the player can see where the random spread could land.
		public static void HandleSelectTarget(World world, Actor self, string order, SupportPowerManager manager,
			SupportPowerInfo baseInfo, RandomTargetMode mode, WDist maxRadius)
		{
			if (mode == RandomTargetMode.NearTarget)
			{
				// Play the "select target" speech then hand off to our custom order generator
				// which will show the cursor and the radius circle until the player clicks.
				Game.Sound.PlayNotification(world.Map.Rules, self.Owner, "Speech",
					baseInfo.SelectTargetSpeechNotification, self.Owner.Faction.InternalName);
				world.OrderGenerator = new SelectNearTargetPowerTarget(order, manager, baseInfo.Cursor, maxRadius);
			}
			else
			{
				// No targeting UI needed -- fire right away using the building's own cell as a
				// dummy target. The Activate() override picks the real random cell anyway.
				var dummyCell = world.Map.CellContaining(self.CenterPosition);
				var dummyTarget = Target.FromCell(world, dummyCell);
				world.IssueOrder(new Order(order, manager.Self, dummyTarget, dummyTarget, false));
			}
		}

		// This is the jank swap used by SpawnActorPower.
		// It replaces the target stored with our random cell,
		// so when SpawnActorPower reads it a moment later it thinks that's where the player aimed.
		// If the hidden field couldn't be found (shouldn't happen, but just in case)
		// we write a warning to the debug log and let the power fire at the original target rather than crashing so we can keep playing.
		public static void Patch(World world, Order order, RandomTargetMode mode, WDist maxRadius, CVec centerOffset)
		{
			if (OrderTargetField == null)
			{
				Log.Write("debug", "RandomSupportPowers: couldn't find the target field on Order -- SpawnActorPower will fire at the original target.");
				return;
			}

			var cell = Resolve(world, order, mode, maxRadius, centerOffset);
			OrderTargetField.SetValue(order, Target.FromCell(world, cell));
		}
	}

	// Custom targeting cursor for NearTarget mode.
	// Shows the normal power cursor AND a circle showing the random scatter radius.
	// Fires when the player left-clicks, cancels on right-click.
	class SelectNearTargetPowerTarget : IOrderGenerator
	{
		readonly string order;
		readonly SupportPowerManager manager;
		readonly string cursor;
		readonly WDist radius;
		CPos currentCell; // updated every frame in GetCursor so we know where to draw the circle

		public SelectNearTargetPowerTarget(string order, SupportPowerManager manager, string cursor, WDist radius)
		{
			this.order = order;
			this.manager = manager;
			this.cursor = cursor;
			this.radius = radius;
		}

		public MouseButton ActionButton => MouseButton.Left;

		public IEnumerable<Order> Order(World world, CPos cell, int2 worldPixel, MouseInput mi)
		{
			// Right-click cancels targeting
			if (mi.Button == MouseButton.Right)
			{
				world.CancelInputMode();
				yield break;
			}

			// Left-click fires the power at the clicked cell (Activate() will then
			// pick the actual random cell within the radius -- this just sets the center)
			if (mi.Button == MouseButton.Left && mi.Event == MouseInputEvent.Down)
			{
				world.CancelInputMode();
				var target = Target.FromCell(world, cell);
				yield return new Order(order, manager.Self, target, target, false);
			}
		}

		public void Tick(World world) { }

		// No world-space renderables needed
		public IEnumerable<IRenderable> Render(WorldRenderer wr, World world)
			=> Enumerable.Empty<IRenderable>();

		public IEnumerable<IRenderable> RenderAboveShroud(WorldRenderer wr, World world)
			=> Enumerable.Empty<IRenderable>();

		// Draw the radius circle as an annotation so it sits on top of everything
		public IEnumerable<IRenderable> RenderAnnotations(WorldRenderer wr, World world)
		{
			var center = world.Map.CenterOfCell(currentCell);
			yield return new RangeCircleAnnotationRenderable(
				center,
				radius,
				0,
				Color.FromArgb(128, Color.Yellow),   // semi-transparent yellow fill line
				1f,
				Color.FromArgb(96, Color.Black),     // dark border to make it readable
				3f);
		}

		// GetCursor is called every frame -- we piggyback on it to track the current cell
		// so RenderAnnotations knows where to draw the circle
		public string GetCursor(World world, CPos cell, int2 worldPixel, MouseInput mi)
		{
			currentCell = cell;
			return world.Map.Contains(cell) ? cursor : "default";
		}

		public void Deactivate() { }
		public bool HandleKeyPress(KeyInput e) => false;
		public void SelectionChanged(World world, IEnumerable<Actor> selected) { }
	}

	// ==========================================================================
	// NUKE POWER
	// ==========================================================================
	// NukePower is locked inside the engine so idk how to extend it directly.
	// What i tried instead is to use NukePowerInfo, which gives us all the normal YAML fields (MissileWeapon, MissileImage, FlightDelay, etc.) 
	// without having to declare them all again ourselves. 
	// (another janky way i watched AI fix this issue for something else when asking it for a example to learn from so i stole the idea)

	// Then in Activate() we fire the missile effect manually, which is the same thing the original NukePower does internally.
	
	// In the YAML: use RandomNukePower: the same way you'd use NukePower:
	// Add TargetMode, MaxRadius, or CenterOffset on top.
	// ==========================================================================

	public class RandomNukePowerInfo : NukePowerInfo
	{
		[Desc("How to pick the target cell.")]
		public readonly RandomTargetMode TargetMode = RandomTargetMode.NearTarget;

		[Desc("How far from the player's click to randomize in NearTarget mode. 0 means the whole map.")]
		public readonly WDist MaxRadius = WDist.Zero;

		[Desc("How far to shift the target from map center in CenterOffset mode. Format is X,Y in cells, e.g. 5,-3.")]
		public readonly CVec CenterOffset = CVec.Zero;

		// This tells the engine to make a RandomNukePower instead of a regular
		// NukePower when this actor is created in the game.
		public override object Create(ActorInitializer init) => new RandomNukePower(init.Self, this);
	}

	// We extend SupportPower (not NukePower, since that was being a bitch) 
	// so we get the charge timer, prereqs, and PlayLaunchSounds() avaliable to use
	public class RandomNukePower : SupportPower
	{
		readonly RandomNukePowerInfo info;

		public RandomNukePower(Actor self, RandomNukePowerInfo info)
			: base(self, info) { this.info = info; }

		public override void SelectTarget(Actor self, string order, SupportPowerManager manager)
			=> RandomTargetHelper.HandleSelectTarget(self.World, self, order, manager, info, info.TargetMode, info.MaxRadius);

		public override void Activate(Actor self, Order order, SupportPowerManager manager)
		{
			PlayLaunchSounds();

			var world = self.World;

			// Get the random cell, then convert it to a world position (an exact point in space rather than a grid square) since NukeLaunch needs that.
			var targetCell = RandomTargetHelper.Resolve(world, order, info.TargetMode, info.MaxRadius, info.CenterOffset);
			var targetPos = world.Map.CenterOfCell(targetCell);

			// The missile launches from the top of the building.
			// SpawnOffset is set in YAML (e.g. "1c0,427,0") to position it correctly.
			var launchPos = self.CenterPosition + info.SpawnOffset;

			// If the missile uses a player-colored palette, we add that
			var palette = info.IsPlayerPalette ? info.MissilePalette + self.Owner.InternalName : info.MissilePalette;

			// Weapon names needs lowercase.
			var weapon = world.Map.Rules.Weapons[info.MissileWeapon.ToLowerInvariant()];

			// AddFrameEndTask delays the actual launch until after the current game tick finishes. 
			// OpenRA requires this for anything that creates new objects in the world or shit crashes.
			world.AddFrameEndTask(w => w.Add(new NukeLaunch(
				self.Owner,
				info.MissileImage,
				weapon,
				palette,
				info.MissileUp,
				info.MissileDown,
				launchPos,
				targetPos,
				info.DetonationAltitude,
				info.RemoveMissileOnDetonation,
				info.FlightVelocity,
				info.MissileDelay,
				info.FlightDelay,
				info.SkipAscent,
				info.TrailImage,
				info.TrailSequences,
				info.TrailPalette,
				info.TrailUsePlayerPalette,
				info.TrailDelay,
				info.TrailInterval)));
		}
	}

	// ==========================================================================
	// ION CANNON POWER
	// ==========================================================================
	// IonCannonPower AND IonCannonPowerInfo are both same issues as Nuke

	// In YAML: use RandomIonCannonPower: and set the fields listed here.
	// we don't get the fields from the engine's IonCannonPower automatically
	// since we can't inherit them everything is listed below.
	// ==========================================================================

	public class RandomIonCannonPowerInfo : SupportPowerInfo
	{
		// The weapon that actually deals damage at the target. Has to exist in the mod's weapon rules.
		[Desc("The weapon to fire at the target. Must be in the weapons ruleset.")]
		public readonly string Weapon = null;

		// How many ticks to wait between showing the beam and setting off the weapon.
		[Desc("Ticks between the beam appearing and the weapon going off.")]
		public readonly int WeaponDelay = 0;

		// The name of the sprite image that has the beam animation in it (e.g. 'explosion').
		[Desc("Name of the image that contains the beam effect animation.")]
		public readonly string Effect = null;

		// Which animation sequence to play
		[Desc("Which sequence inside Effect to play.")]
		public readonly string EffectSequence = "idle";

		// Which palette to use when drawing the effect sprite.
		[Desc("Palette for the effect sprite.")]
		public readonly string EffectPalette = "effect";

		// A sound to play at the target location when the power fires.
		// Leave blank if you don't want one.
		[Desc("Sound to play at the target position when the power fires. Leave blank for no sound.")]
		public readonly string OnFireSound = null;

		[Desc("How to pick the target cell.")]
		public readonly RandomTargetMode TargetMode = RandomTargetMode.NearTarget;

		[Desc("How far from the player's click to randomize in NearTarget mode. 0 means the whole map.")]
		public readonly WDist MaxRadius = WDist.Zero;

		[Desc("How far to shift the target from map center in CenterOffset mode. Format is X,Y in cells.")]
		public readonly CVec CenterOffset = CVec.Zero;

		public override object Create(ActorInitializer init) => new RandomIonCannonPower(init.Self, this);
	}

	public class RandomIonCannonPower : SupportPower
	{
		readonly RandomIonCannonPowerInfo info;

		public RandomIonCannonPower(Actor self, RandomIonCannonPowerInfo info)
			: base(self, info) { this.info = info; }

		public override void SelectTarget(Actor self, string order, SupportPowerManager manager)
			=> RandomTargetHelper.HandleSelectTarget(self.World, self, order, manager, info, info.TargetMode, info.MaxRadius);

		public override void Activate(Actor self, Order order, SupportPowerManager manager)
		{
			PlayLaunchSounds();

			var world = self.World;
			var targetCell = RandomTargetHelper.Resolve(world, order, info.TargetMode, info.MaxRadius, info.CenterOffset);
			var targetPos = world.Map.CenterOfCell(targetCell);

			// The IonCannon effect draws a beam from above down to the target.
			// We put the "source" point directly above the target at a very high altitude,
			// is a way to draw it so the beam appears to come straight down from the sky.
			// (10240 * 8 is 80 map cells worth of altitude (asked a bot for this info XD) may need to boost this if it shows jank on larger maps.)
			var launchPos = new WPos(targetPos.X, targetPos.Y, targetPos.Z + 10240 * 8);
			var weapon = world.Map.Rules.Weapons[info.Weapon.ToLowerInvariant()];

			if (info.OnFireSound != null)
				Game.Sound.Play(SoundType.World, info.OnFireSound, targetPos);

			// The IonCannon effect takes its target as a reference, meaning it needs a named variable
			// we can't pass the value inline. If we did, the value could get cleaned up before were finished reading it.
			var target = Target.FromPos(targetPos);
			var ionCannon = new IonCannon(
				self.Owner, weapon, world, launchPos, ref target,
				info.Effect, info.EffectSequence, info.EffectPalette, info.WeaponDelay);

			world.AddFrameEndTask(w => w.Add(ionCannon));
		}
	}

	// ==========================================================================
	// AIRSTRIKE POWER
	// ==========================================================================
	// AirstrikePower is public so we can use it normally. It has a method
	// called SendAirstrike() that takes a world position directly, so we just
	// pass it our random cell and it handles everything from there.
	//
	// In YAML: use RandomAirstrikePower: the same as AirstrikePower:
	// ==========================================================================

	public class RandomAirstrikePowerInfo : AirstrikePowerInfo
	{
		[Desc("How to pick the target cell.")]
		public readonly RandomTargetMode TargetMode = RandomTargetMode.NearTarget;

		[Desc("How far from the player's click to randomize in NearTarget mode. 0 means the whole map.")]
		public readonly WDist MaxRadius = WDist.Zero;

		[Desc("How far to shift the target from map center in CenterOffset mode. Format is X,Y in cells.")]
		public readonly CVec CenterOffset = CVec.Zero;

		// Only matters if UseDirectionalTarget is true. When true, the aircraft will come from a random direction instead of following the player's
		// drag direction. Useful if you want unpredictable approaches or if the power fires automatically and there's no drag input to read.
		[Desc("Randomize the direction the aircraft approaches from. Only works when UseDirectionalTarget is true.")]
		public readonly bool RandomizeApproach = false;

		public override object Create(ActorInitializer init) => new RandomAirstrikePower(init.Self, this);
	}

	public class RandomAirstrikePower : AirstrikePower
	{
		readonly RandomAirstrikePowerInfo info;

		public RandomAirstrikePower(Actor self, RandomAirstrikePowerInfo info)
			: base(self, info) { this.info = info; }

		public override void SelectTarget(Actor self, string order, SupportPowerManager manager)
			=> RandomTargetHelper.HandleSelectTarget(self.World, self, order, manager, info, info.TargetMode, info.MaxRadius);

		public override void Activate(Actor self, Order order, SupportPowerManager manager)
		{
			PlayLaunchSounds();

			var cell = RandomTargetHelper.Resolve(self.World, order, info.TargetMode, info.MaxRadius, info.CenterOffset);

			// SendAirstrike needs a world position (a point in space), not a cell.
			var targetWPos = self.World.Map.CenterOfCell(cell);

			// The facing angle goes from 0 to 1023 (full circle).
			// null means the game picks a default approach from the map edge.
			// order.ExtraLocation.X is where the directional target widget stored the direction the player dragged when they aimed the power.
			WAngle? facing = null;
			if (info.UseDirectionalTarget)
				facing = info.RandomizeApproach
					? new WAngle(self.World.SharedRandom.Next(1024))
					: new WAngle(order.ExtraLocation.X);

			SendAirstrike(self, targetWPos, facing);
		}
	}

	// ==========================================================================
	// PARATROOPERS POWER
	// ==========================================================================
	// Same idea as Airstrike it's public and has a SendParatroopers() method
	// that takes a position directly, so we just pass our random cell.
	//
	// In YAML: use RandomParatroopersPower: the same as ParatroopersPower:
	// ==========================================================================

	public class RandomParatroopersPowerInfo : ParatroopersPowerInfo
	{
		[Desc("How to pick the drop zone cell.")]
		public readonly RandomTargetMode TargetMode = RandomTargetMode.NearTarget;

		[Desc("How far from the player's click to randomize in NearTarget mode. 0 means the whole map.")]
		public readonly WDist MaxRadius = WDist.Zero;

		[Desc("How far to shift the target from map center in CenterOffset mode. Format is X,Y in cells.")]
		public readonly CVec CenterOffset = CVec.Zero;

		// Same as the Airstrike version randomizes which direction the carrier
		// plane comes from when UseDirectionalTarget is on.
		[Desc("Randomize the carrier plane's approach direction. Only works when UseDirectionalTarget is true.")]
		public readonly bool RandomizeApproach = false;

		public override object Create(ActorInitializer init) => new RandomParatroopersPower(init.Self, this);
	}

	public class RandomParatroopersPower : ParatroopersPower
	{
		readonly RandomParatroopersPowerInfo info;

		public RandomParatroopersPower(Actor self, RandomParatroopersPowerInfo info)
			: base(self, info) { this.info = info; }

		public override void SelectTarget(Actor self, string order, SupportPowerManager manager)
			=> RandomTargetHelper.HandleSelectTarget(self.World, self, order, manager, info, info.TargetMode, info.MaxRadius);

		public override void Activate(Actor self, Order order, SupportPowerManager manager)
		{
			PlayLaunchSounds();

			var cell = RandomTargetHelper.Resolve(self.World, order, info.TargetMode, info.MaxRadius, info.CenterOffset);
			var targetWPos = self.World.Map.CenterOfCell(cell);

			WAngle? facing = null;
			if (info.UseDirectionalTarget)
				facing = info.RandomizeApproach
					? new WAngle(self.World.SharedRandom.Next(1024))
					: new WAngle(order.ExtraLocation.X);

			SendParatroopers(self, targetWPos, facing);
		}
	}

	// ==========================================================================
	// SPAWN ACTOR POWER
	// ==========================================================================
	// SpawnActorPower is public so we can extend it, but unlike Airstrike and Paratroopers
	// it doesn't have a "spawn at this specific cell" method.
	// Instead it reads the target from the order that was passed in.
	// So before we hand off, we quietly replace that target with our random cell. The base class never knows we changed it.
	//
	// In YAML: use RandomSpawnActorPower: the same as SpawnActorPower:
	// ==========================================================================

	public class RandomSpawnActorPowerInfo : SpawnActorPowerInfo
	{
		[Desc("How to pick the spawn cell.")]
		public readonly RandomTargetMode TargetMode = RandomTargetMode.NearTarget;

		[Desc("How far from the player's click to randomize in NearTarget mode. 0 means the whole map.")]
		public readonly WDist MaxRadius = WDist.Zero;

		[Desc("How far to shift the target from map center in CenterOffset mode. Format is X,Y in cells.")]
		public readonly CVec CenterOffset = CVec.Zero;

		public override object Create(ActorInitializer init) => new RandomSpawnActorPower(init.Self, this);
	}

	public class RandomSpawnActorPower : SpawnActorPower
	{
		readonly RandomSpawnActorPowerInfo info;

		public RandomSpawnActorPower(Actor self, RandomSpawnActorPowerInfo info)
			: base(self, info) { this.info = info; }

		public override void SelectTarget(Actor self, string order, SupportPowerManager manager)
			=> RandomTargetHelper.HandleSelectTarget(self.World, self, order, manager, info, info.TargetMode, info.MaxRadius);

		public override void Activate(Actor self, Order order, SupportPowerManager manager)
		{
			// Swap the target to our random cell, then let the base class
			// handle everything else
			RandomTargetHelper.Patch(self.World, order, info.TargetMode, info.MaxRadius, info.CenterOffset);
			base.Activate(self, order, manager);
		}
	}

	// ==========================================================================
	// DROP PODS POWER
	// ==========================================================================
	// DropPodsPower is public and has a SendDropPods() method, so this works
	// the same way as Airstrike and Paratroopers.
	
	// SendDropPods() has a third parameter called onSuccess which is a callback that runs after the pods land. 
	// Passing null for it crashes the game so we just pass an empty function since we don't need to do anything after landing.
	
	// In YAML: use RandomDropPodsPower: the same as DropPodsPower:
	// There are no restrictions on what UnitTypes you use here.
	// ==========================================================================

	public class RandomDropPodsPowerInfo : DropPodsPowerInfo
	{
		[Desc("How to pick the drop zone cell.")]
		public readonly RandomTargetMode TargetMode = RandomTargetMode.NearTarget;

		[Desc("How far from the player's click to randomize in NearTarget mode. 0 means the whole map.")]
		public readonly WDist MaxRadius = WDist.Zero;

		[Desc("How far to shift the target from map center in CenterOffset mode. Format is X,Y in cells.")]
		public readonly CVec CenterOffset = CVec.Zero;

		public override object Create(ActorInitializer init) => new RandomDropPodsPower(init.Self, this);
	}

	public class RandomDropPodsPower : DropPodsPower
	{
		readonly RandomDropPodsPowerInfo info;

		public RandomDropPodsPower(Actor self, RandomDropPodsPowerInfo info)
			: base(self, info) { this.info = info; }

		public override void SelectTarget(Actor self, string order, SupportPowerManager manager)
			=> RandomTargetHelper.HandleSelectTarget(self.World, self, order, manager, info, info.TargetMode, info.MaxRadius);

		public override void Activate(Actor self, Order order, SupportPowerManager manager)
		{
			PlayLaunchSounds();
			var cell = RandomTargetHelper.Resolve(self.World, order, info.TargetMode, info.MaxRadius, info.CenterOffset);

			// The empty () => { } is the "do nothing after landing" callback.
			// We have to pass something here null will crash the game. idk what else to put here so just filled it
			SendDropPods(self, cell, () => { });
		}
	}

	// ==========================================================================
	// DROP PODS POWER OW (custom variant) was just trying to match what we had on mod already
	// ==========================================================================
	// It works the same way as the regular one above.
	
	// DropPodsPowerOW requires every actor in UnitTypes to have the Aircraft trait. 
	// The pods fly in from orbit, so they need to be aircraft actors. 
	// If you put a ground unit like a tank in UnitTypes the game will crash when the building is placed. 
	// Use the regular RandomDropPodsPower if you want to drop ground units.
	
	// In YAML: use RandomDropPodsPowerOW: the same as DropPodsPowerOW:
	// ==========================================================================

	public class RandomDropPodsPowerOWInfo : DropPodsPowerOWInfo
	{
		[Desc("How to pick the drop zone cell.")]
		public readonly RandomTargetMode TargetMode = RandomTargetMode.NearTarget;

		[Desc("How far from the player's click to randomize in NearTarget mode. 0 means the whole map.")]
		public readonly WDist MaxRadius = WDist.Zero;

		[Desc("How far to shift the target from map center in CenterOffset mode. Format is X,Y in cells.")]
		public readonly CVec CenterOffset = CVec.Zero;

		public override object Create(ActorInitializer init) => new RandomDropPodsPowerOW(init.Self, this);
	}

	public class RandomDropPodsPowerOW : DropPodsPowerOW
	{
		readonly RandomDropPodsPowerOWInfo info;

		public RandomDropPodsPowerOW(Actor self, RandomDropPodsPowerOWInfo info)
			: base(self, info) { this.info = info; }

		public override void SelectTarget(Actor self, string order, SupportPowerManager manager)
			=> RandomTargetHelper.HandleSelectTarget(self.World, self, order, manager, info, info.TargetMode, info.MaxRadius);

		public override void Activate(Actor self, Order order, SupportPowerManager manager)
		{
			PlayLaunchSounds();
			var cell = RandomTargetHelper.Resolve(self.World, order, info.TargetMode, info.MaxRadius, info.CenterOffset);
			SendDropPods(self, cell, () => { });
		}
	}

	// ==========================================================================
	// DELAYED POWER TRIGGER (fuck this shit was jank to make work)
	// ==========================================================================
	// This is a separate trait you add to any building alongside a support power
	// to make it fire automatically after a set or random delay  no player
	// input needed at all.
	
	// HOW TO USE IT:
	// 1. Add a support power trait to your building (any power works, not just
	//    the Random* ones above).
	// 2. Give that power a unique OrderName.
	// 3. Add DelayedPowerTrigger: to the same building and set PowerOrderName
	//    to match that OrderName exactly.
	// 4. Set DelayMin and DelayMax for how long to wait (in game ticks).
	//    Set them to the same value for a fixed delay, or different values
	//    for a random delay picked somewhere in that range.
	// 5. Set Repeat: true if you want it to keep firing over and over,
	//    or Repeat: false to fire just once.
	
	// If the power isn't charged yet when the delay runs out, the trigger
	// just waits until it is ready  it won't skip a shot.
	//
	// WHY IS THIS A SEPARATE TRAIT?
	// Keeping it separate means you can attach it to any support power without
	// touching the power's own code. You can even put two of them on one
	// building to auto-trigger two different powers on different timers.

	// No idea what this will do with some outliers but if it breaks we just avoid doing that..
	// ==========================================================================

	public class DelayedPowerTriggerInfo : TraitInfo
	{
		// This has to exactly match the OrderName: field of the power you want to trigger. 
		// That's how the game finds which power to fire.
		[Desc("The OrderName of the support power on this actor to fire automatically. Must match exactly.")]
		public readonly string PowerOrderName = null;

		// The wait time in game ticks. One second of real time is roughly 25 ticks.
		// Set DelayMin and DelayMax to the same number for a fixed wait
		// or to different numbers to pick a random time in between.
		[Desc("Minimum ticks to wait before firing. Set the same as DelayMax for a fixed delay.")]
		public readonly int DelayMin = 500;

		[Desc("Maximum ticks to wait before firing. The actual delay is picked randomly between DelayMin and DelayMax.")]
		public readonly int DelayMax = 500;

		// Set to true to fire repeatedly (picks a fresh random delay after each shot).
		// Set to false to fire once and stop.
		[Desc("If true, fires again after each shot with a new random delay. If false, fires once and stops.")]
		public readonly bool Repeat = true;

		public override object Create(ActorInitializer init) => new DelayedPowerTrigger(init.Self, this);
	}

	public class DelayedPowerTrigger : ITick
	{
		readonly DelayedPowerTriggerInfo info;
		int remainingDelay;

		// Once the delay runs out we flip this to true and start waiting for the power to be ready. 
		// Keeping these two phases separate means we
		// don't accidentally reset the delay if the power happens to be on cooldown.
		bool delayElapsed;

		public DelayedPowerTrigger(Actor self, DelayedPowerTriggerInfo info)
		{
			this.info = info;

			// Pick the first delay right away when the building is created.
			remainingDelay = PickDelay(self.World);
		}

		// Picks a random wait time between DelayMin and DelayMax (inclusive).
		// Uses world.SharedRandom so multiplayer stays in sync.
		int PickDelay(World world) =>
			info.DelayMin >= info.DelayMax
				? info.DelayMin
				: info.DelayMin + world.SharedRandom.Next(info.DelayMax - info.DelayMin + 1);

		void ITick.Tick(Actor self)
		{
			// Phase 1: count down the delay tick by tick.
			if (!delayElapsed)
			{
				if (--remainingDelay > 0)
					return;

				// Delay is up switch to waiting for the power to be ready.
				delayElapsed = true;
			}

			// Phase 2: delay has finished. Now wait for the power to finish charging.
			// SupportPowerManager is on the player actor (not the building itself).
			var spm = self.Owner.PlayerActor.TraitOrDefault<SupportPowerManager>();
			if (spm == null)
				return;

			// Look up the power by the OrderName we were given.
			// If it doesn't exist (e.g. a typo in PowerOrderName) nothing happens.
			if (!spm.Powers.TryGetValue(info.PowerOrderName, out var instance))
				return;

			// Not charged yet  keep waiting, don't reset the delay.
			if (!instance.Ready)
				return;

			// The power is ready fire it. 
			// We pass the building's own cell as the target, since the Random*Power variants ignore it anyway and replace it with a random cell in their own Activate().
			// For regular powers the target actually matters, so firing at the building's own position is at least a stops a crash and could have some fun effects.
			var dummyCell = self.World.Map.CellContaining(self.CenterPosition);
			var dummyTarget = Target.FromCell(self.World, dummyCell);
			self.World.IssueOrder(new Order(
				info.PowerOrderName,
				self.Owner.PlayerActor,
				dummyTarget, dummyTarget,
				false));

			if (info.Repeat)
			{
				// Pick a new random delay for the next shot.
				remainingDelay = PickDelay(self.World);
				delayElapsed = false;
			}
			// If Repeat is false, delayElapsed stays true and the power has been
			// spent (or won't be Ready again), so this Tick does nothing from now on.
		}
	}
}
