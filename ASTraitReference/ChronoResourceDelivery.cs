#region Copyright & License Information
/*
 * Copyright 2015- OpenRA.Mods.AS Developers (see AUTHORS)
 * This file is a part of a third-party plugin for OpenRA, which is
 * free software. It is made available to you under the terms of the
 * GNU General Public License as published by the Free Software
 * Foundation. For more information, see COPYING.
 */
#endregion

using OpenRA.Mods.Common.Effects;
using OpenRA.Mods.Common.Traits;
using OpenRA.Traits;

namespace OpenRA.Mods.AS.Traits
{
	[Desc("When returning to a refinery to deliver resources, this actor will teleport if possible.")]
	public class ChronoResourceDeliveryInfo : ConditionalTraitInfo, Requires<HarvesterInfo>
	{
		[Desc("The number of ticks between each check to see if we can teleport to the refinery.")]
		public readonly int CheckTeleportDelay = 10;

		[Desc("Image used for the teleport effects. Defaults to the actor's type.")]
		public readonly string Image = null;

		[Desc("Sequence used for the effect played where the harvester jumped from.")]
		[SequenceReference(nameof(Image), allowNullImage: true)]
		public readonly string WarpInSequence = null;

		[Desc("Sequence used for the effect played where the harvester jumped to.")]
		[SequenceReference(nameof(Image), allowNullImage: true)]
		public readonly string WarpOutSequence = null;

		[Desc("Palette to render the warp in/out sprites in.")]
		[PaletteReference]
		public readonly string Palette = "effect";

		[Desc("Sound played where the harvester jumped from.")]
		public readonly string WarpInSound = null;

		[Desc("Sound where the harvester jumped to.")]
		public readonly string WarpOutSound = null;

		[Desc("Does the sound play under shroud or fog.")]
		public readonly bool AudibleThroughFog = true;

		[Desc("Volume the WarpInSound and WarpOutSound played at.")]
		public readonly float SoundVolume = 1;

//		[Desc("Should parasites be teleported along?")]
//		public readonly bool ExposeInfectors = true;

		[GrantedConditionReference]
		[Desc("The condition to grant during teleport.")]
		public readonly string Condition = null;

		public override object Create(ActorInitializer init) { return new ChronoResourceDelivery(this); }
	}

	public class ChronoResourceDelivery : ConditionalTrait<ChronoResourceDeliveryInfo>, INotifyHarvesterAction, ITick
	{
		CPos? destination = null;
		int ticksTillCheck = 0;
		WAngle dockFacing;
		IFacing facing;
		int token = Actor.InvalidConditionToken;

		public ChronoResourceDelivery(ChronoResourceDeliveryInfo info)
			: base(info) { }

		protected override void Created(Actor self)
		{
			facing = self.TraitOrDefault<IFacing>();

			base.Created(self);
		}

		void ITick.Tick(Actor self)
		{
			if (IsTraitDisabled || destination == null)
				return;

			if (ticksTillCheck <= 0)
			{
				ticksTillCheck = Info.CheckTeleportDelay;

				TeleportIfPossible(self);
			}
			else
				ticksTillCheck--;
		}

		public void MovingToResources(Actor self, CPos targetCell)
		{
			Reset(self);
		}

		public void MovingToRefinery(Actor self, Actor refineryActor)
		{
			var iao = refineryActor.Trait<IAcceptResources>();
			var location = self.World.Map.CellContaining(iao.DeliveryPosition);
		

			if (destination != null && destination.Value != location)
				ticksTillCheck = 0;

			dockFacing = refineryActor.Trait<IAcceptResources>().DeliveryAngle;

			destination = location;
		}

		public void MovementCancelled(Actor self)
		{
			Reset(self);
		}

		public void Harvested(Actor self, string resource) { }
		public void Docked() { }
		public void Undocked() { }

		void TeleportIfPossible(Actor self)
		{
			// We're already here; no need to interfere.
			if (self.Location == destination.Value)
			{
				Reset(self);
				return;
			}

			if (token == Actor.InvalidConditionToken && !string.IsNullOrWhiteSpace(Info.Condition))
				token = self.GrantCondition(Info.Condition);

			var pos = self.Trait<IPositionable>();
			if (pos.CanEnterCell(destination.Value))
			{
				var image = Info.Image ?? self.Info.Name;

				var sourcepos = self.CenterPosition;

				if (Info.WarpInSequence != null)
					self.World.AddFrameEndTask(w => w.Add(new SpriteEffect(sourcepos, w, image, Info.WarpInSequence, Info.Palette)));

				if (Info.WarpInSound != null && (Info.AudibleThroughFog || !self.World.FogObscures(sourcepos)))
					Game.Sound.Play(SoundType.World, Info.WarpInSound, self.CenterPosition, Info.SoundVolume);

//				if (Info.ExposeInfectors)
//					foreach (var i in self.TraitsImplementing<IRemoveInfector>())
//						i.RemoveInfector(self, false);

				self.World.AddFrameEndTask(w =>
				{
					self.Trait<IPositionable>().SetPosition(self, destination.Value);
					self.Generation++;

					var destinationpos = self.CenterPosition;

					if (facing != null)
						facing.Facing = dockFacing;

					if (Info.WarpOutSequence != null)
						w.Add(new SpriteEffect(destinationpos, w, image, Info.WarpOutSequence, Info.Palette));

					if (Info.WarpOutSound != null && (Info.AudibleThroughFog || !self.World.FogObscures(sourcepos)))
						Game.Sound.Play(SoundType.World, Info.WarpOutSound, self.CenterPosition, Info.SoundVolume);

					Reset(self);
				});
			}
		}

		void Reset(Actor self)
		{
			ticksTillCheck = 0;
			destination = null;

			self.World.AddFrameEndTask(w =>
			{
				if (token != Actor.InvalidConditionToken)
					token = self.RevokeCondition(token);
			});
		}
	}
}
