# MediHero Implementation TODO

Tracks implementation status for `medihero.yaml`. Verdicts based on grepped/confirmed
traits across `mods/ow` and `mods/ra`. ✅ = ready to implement, ⚠️ = needs design
decision or cross-file work, ❌ = no mechanism found, needs new work.

## Open Design Questions (tackle first)

- [ ] **Acid element** (Mage T5 A1, Elemental Master) — no Acid weapon/warhead exists
      anywhere in `mediweap.yaml`. Needs a new element (warhead + visuals + condition)
      built from scratch, mirroring how `Ice`/`Ice2` (IceWyvernShot) are structured.
      Rest of Elemental Master (rotation via `GrantRandomPeriodicCondition`, unlocking/
      empowering already-unlocked elements, Ice itself) is otherwise confirmed-ready —
      Acid is the only blocker on this ability.
- [ ] **Chain Lightning bounce** (Mage T2 A2) — `Bounces`/`BounceCount`/`BounceRangeModifier`
      exist but only as projectile-terrain-bounce; confirm whether they can retarget to a
      *new enemy* or if "chaining between enemies" needs a different mechanism
      (e.g. multiple `Armament`s with short `Range` + `GrantConditionOnAttack` chaining).
- [ ] **Teleportation Atunement damage resistance** (Shared T5) — "safe chronoshift" half
      is solved (`Chronoshiftable: ExplodeInstead: false RequiresCondition: <tier5>`).
      Still need a way to grant a temporary `DamageMultiplier` while/after being
      chronoshifted — no "on-teleported" condition trigger found yet.
- [ ] **Bladestorm self-AOE** (Assassin T5 B4) — multi-warhead `SpreadDamage` around the
      *target* is confirmed; need to confirm whether a weapon can target/center on the
      *attacker* (self) for a repeatable in-combat cluster attack.
- [ ] **Font of Knowledge exp-share** (Mage T5 A3) — self glass-cannon half is easy;
      granting `GainsExperienceMultiplier`-style buff to *nearby allies* via
      `ProximityExternalCondition` is unconfirmed — check if exp traits can be
      externally granted at all.

## Cross-File / Mod-Wide Additions (not hero-only)

- [ ] **Cult Only on-kill aura** (Shared T3) — add a `RequiresCondition`-gated
      `FireWarheadsOnDeath@cultmark` to a shared base template in `defaults.yaml`
      (so it applies broadly), paired with hero attack applying `GrantExternalCondition:
      cultmarked` to targets.
- [ ] **Vengeance** (Swordsman T3 B3) — add `FireWarheadsOnDeath@vengeance` (buff warhead,
      `ValidRelationships: Ally`) to medi's own infantry/vehicle roster so nearby allies
      get a temporary `ReloadDelayMultiplier` buff when a friendly dies.
- [ ] **Holy Only / Worker Rights** (Shared T3) — `ProximityExternalCondition` from hero
      grants a condition; need matching `SpeedMultiplier RequiresCondition` added to
      harvester/worker actor definitions to react to it.
- [ ] **Warlord** (Swordsman T5 A2) — reuse `propaganda` condition mechanism
      (`ProximityExternalCondition@propaganda` + `^propagandaboost`/`^propagandaboostinfantry`
      from `defaults.yaml`). Confirm which medi units inherit `^propagandaboost` so the
      aura actually has units to buff.
- [ ] **Trimmed Rune (cheaper rebuild)** (Shared T3) — confirm whether hero's `Valued: Cost`
      can be conditionally discounted (no `Valued@... RequiresCondition` precedent found
      yet); may need a different approach (e.g. partial cost refund on death).
- [ ] **Infantry/Creature Focus cost reduction** (Shared T2) — decide what "reduce costs"
      targets: hero's own queue vs. player-wide production via `ProvidesPrerequisite` +
      existing `ProductionCostMultiplier`/`ProductionTimeMultiplier` upgrade pattern.
- [ ] **The Vision** (Mage T3 B3) — self vision boost is trivial; sharing/boosting vision
      on *other* units needs further research (`RevealsShroudMultiplier` not found).
- [ ] **Locust Plague** (Mage T5 A2) — compose from `GrantExternalConditionPower`
      (`disabled` condition) + existing `PauseOnCondition: disabled` on production
      buildings; not a single pre-built power.
- [ ] **Alchemy Experiment** (Shared T3, Mages Only) — `TransmuteConvertWizard`/
      `TransmuteConvertHoly` weapons exist (`DestroyResource`+`CreateResource` warheads,
      medi_str.yaml ~2668-2686) but are only used via `FireWarheadsOnDeath` on the
      structure-spawned "Transmute Probe" 7x7 grid system. Reusing them for "hero attacks
      an ore tile directly" needs the Armament's `ValidTargets`/targeting to accept
      resource tiles — not confirmed.

## Confirmed Ready (implement directly, traits/patterns cited)

### Tier 2
- [ ] Assassin A1 Throwing Knives — `FreeActor` + `KillsSelf: RemoveInstead: true` +
      `ProvidesPrerequisite` (masterchief weapon-swap pattern)
- [ ] Assassin A2 Flowing Strikes — `GrantConditionOnAttack` (`IsCyclic`) + `FirepowerMultiplier`
- [ ] Assassin A3 Parry — `JamsMissiles`
- [ ] Swordsman A1 Alert — `GrantConditionOnHealthPercentage` (MinHP 100/MaxHP 101) + `DamageMultiplier`
- [ ] Swordsman A2 Charge Attack — `AttackLeap` + `PauseOnCondition` (TankBuster pattern)
- [ ] Swordsman A3 Warriors Drive — `ConvertsDamageToHealth`
- [ ] Shared Mana Stones / Power Leveling — `Power: Amount`, `GainsExperienceMultiplier`
- [ ] Mage A1 Fireball — `SpreadDamage`
- [ ] Mage A3 Mana Conduit — `Power: Amount` scaled per `^HeroTier`

### Tier 3
- [ ] Shared Bloodlust — `ConvertsDamageToHealth`
- [ ] Assassin B1 Hidden Camp — `ChangesHealth RequiresCondition` on cloak condition
- [ ] Assassin B2 Ninja Training — `SpeedMultiplier`
- [ ] Assassin B3 Explosive Knives — `Versus` Light/Heavy increase
- [ ] Swordsman B1 Inspiration / B2 Protection — `ProximityExternalCondition` + multiplier
- [ ] Mage B1 Mage Armor — `DamageMultiplier`
- [ ] Mage B2 Mend Wounds — heal-Armament pattern (`Cursor: heal`, `TargetRelationships: Ally`)

### Tier 4
- [ ] Shared Arcane Shields — `Shielded@name`
- [ ] Shared Glass Cannon / Sustained Warrior — multiplier stack / `ConvertsDamageToHealth`
- [ ] Assassin A1 Gas mines — `Minelayer` + poison warhead
- [ ] Assassin A2 Enchanted Blades — `Versus` Light/Heavy 100
- [ ] Assassin A3 Cyanide Pills — `GivesExperienceMultiplier ... Modifier: 0`
- [ ] Swordsman A1 Berserker — `GrantConditionOnHealth` + reload/firepower multipliers
- [ ] Swordsman A2 Beast Blood — `AttackWander RequiresCondition`
- [ ] Swordsman A3 Unstable Existence — `GrantRandomPeriodicCondition`
- [ ] Mage A1 True Flame / A2 High Voltage — `Versus` 100 across armor types
- [ ] Mage A3 Rune Burst — `GrantConditionOnAttack` (`RequiredShotsPerInstance`+`IsCyclic`) for empowerment half

### Tier 5
- [ ] Shared Second Wind — `GrantConditionOnHealth` + `ChangesHealth` + `GrantPermanently` one-shot
- [ ] Shared Teleportation Atunement (safe half) — `Chronoshiftable: ExplodeInstead: false RequiresCondition`
- [ ] Assassin A1 True Stealth — `Cloak` + `UncloakOn: Attack`
- [ ] Assassin A2 Shadow Step — `PortableChrono`
- [ ] Assassin A3 True Death — poison DoT via `GrantExternalCondition` + `ChangesHealth` (long `Duration`)
- [ ] Assassin B1 Inquisition — `GrantConditionOnAttack` + `FreeActor` (Witchking pattern)
- [ ] Assassin B2 Reaper Seal — `HealthPercentageDamage` warhead
- [ ] Assassin B3 AntiMage — `Versus: { Shield: 300 }` (precedent: superweapons.yaml)
- [ ] Swordsman A1 Final Stand — `GrantConditionOnHealth` + `DamageMultiplier`
- [ ] Swordsman A3 Juggernaut — `ReloadDelayMultiplier` + AOE/damage increase
- [ ] Swordsman B1 Martyr — `FireWarheadsOnDeath` + heal warhead (Ally)
- [ ] Swordsman B2 Black Knight — `ConvertsDamageToHealth`
- [ ] Swordsman B3 Mageblade — `Versus` 100 all armor types
- [ ] Swordsman B4 Dragon Armor — `DamageMultiplier`
- [ ] Mage A2 Meteor Swarm — `MeteorStormFireball`/`MeteorStormMeteor`
- [ ] Mage A2 Earthquake — `powerproxy.earthquake` (`SpawnActorPower`), scaled down
- [ ] Mage A2 Plasma Strike — multi-warhead damage + EMP (`GrantExternalCondition: disabled`)

### Tier 5 — Mage B1-B4 (filled in file, not empty)

- [ ] Mage B1 Holy: Blessed Magic — ✅ confirmed: add a heal `Warhead` (`ValidRelationships: Ally`,
      negative `Damage`) alongside the damage warhead on the mage's attack weapon, same
      multi-warhead pattern as `MartyrHeal` (mediweap.yaml:81-97)
- [ ] Mage B2 Cult: Cursed Magic — ✅ confirmed: add `GrantExternalCondition: MediCurseCondition`
      (real pre-existing debuff: -30% firepower, -5% speed, +10% damage taken, -10% range —
      defaults.yaml:4222-4233) + `GrantExternalCondition: corrode` warheads to attack
- [ ] Mage B3 Mage: True Magic — ✅ confirmed: pure `Versus` value tuning (100 -> 150 across
      armor types once "already 100%"); precedent for values up to 300 exists (Shield: 300,
      superweapons.yaml)
- [ ] Mage B4 Destruction Magic — ⚠️ "increases range" confirmed via `RangeMultiplier`
      (real trait, defaults.yaml:4231-4232, zerg_inf.yaml:376); "doubles radius of spells"
      (AOE `Spread`) has no confirmed multiplier trait — `AreaOfEffect`/`SpreadMultiplier`
      return zero matches anywhere in mods/ow
