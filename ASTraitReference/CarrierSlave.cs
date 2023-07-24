#region Copyright & License Information
/*
 * Copyright 2015- OpenRA.Mods.AS Developers (see AUTHORS)
 * This file is a part of a third-party plugin for OpenRA, which is
 * free software. It is made available to you under the terms of the
 * GNU General Public License as published by the Free Software
 * Foundation. For more information, see COPYING.
 */
#endregion

using OpenRA.Mods.Common.Activities;
using OpenRA.Traits;

namespace OpenRA.Mods.AS.Traits
{
	[Desc("Can be slaved to a spawner.")]
	public class CarrierSlaveInfo : BaseSpawnerSlaveInfo
	{
		[Desc("Move this close to the spawner, before entering it.")]
		public readonly WDist LandingDistance = new WDist(5 * 1024);

		public override object Create(ActorInitializer init) { return new CarrierSlave(this); }
	}

	public class CarrierSlave : BaseSpawnerSlave, INotifyIdle
	{
		public readonly CarrierSlaveInfo Info;

		CarrierMaster spawnerMaster;

		public CarrierSlave(CarrierSlaveInfo info)
			: base(info)
		{
			Info = info;
		}

		public void EnterSpawner(Actor self)
		{
			// Hopefully, self will be disposed shortly afterwards by SpawnerSlaveDisposal policy.
			if (Master == null || Master.IsDead)
				return;

			// Proceed with enter, if already at it.
			if (self.CurrentActivity is EnterCarrierMaster)
				return;

			// Cancel whatever else self was doing and return.
			self.QueueActivity(false, new EnterCarrierMaster(self, Master, spawnerMaster));
		}

		public override void LinkMaster(Actor self, Actor master, BaseSpawnerMaster spawnerMaster)
		{
			base.LinkMaster(self, master, spawnerMaster);
			this.spawnerMaster = spawnerMaster as CarrierMaster;
		}

		void INotifyIdle.TickIdle(Actor self)
		{
			EnterSpawner(self);
		}

		public override void Stop(Actor self)
		{
			base.Stop(self);
			EnterSpawner(self);
		}
	}
}
