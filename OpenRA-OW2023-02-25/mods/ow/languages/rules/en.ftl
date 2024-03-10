## ai_str.yaml
actor-foundry-bot-name = Automation Facility
actor-gfoundry-bot-name = Automation Facility - Hole Edition
actor-psupor-bot-name = Robotics Support Bay
actor-barr-boss-name = Boss Barracks
actor-weap-boss-name = Boss Factory

actor-atek-bot =
   .description = Provides technologies.
   .name = Boss Tech Center

actor-pbox-boss-name = Death Box
actor-gfix-hole2-name = GLA Hole (Service Depot)

meta-prefabbuilding =
   .description = For AI use.
   .name = Prefab

actor-prefab-a =
   .description = For AI use: 
    Power Plant and a Barracks, 4x3.
   .name = Prefab: A

actor-prefab-b =
   .description = For AI use: 
    Power Plant and a Barracks, 5x3
   .name = Prefab: B

## ai_veh.yaml
actor-apc-ai1-description = AI prefilled APC.
actor-stnk-ai1-description = AI prefilled Raider.
actor-rtnk-ai1-description = AI prefilled Reaper.
actor-amapc-ai1-description = AI prefilled Amphibious APC.

## allies_inf.yaml
actor-mech-description = Repairs nearby vehicles and restores
    husks to working condition by capturing them.
    Speed: 50
      Unarmed
actor-e7-description = Elite commando infantry. Armed with
    dual pistols and C4.
    Speed: 71
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
      Special Ability: Destroy Building with C4
actor-e7-aeiou-description = Paradrop a commando to join the battle.
actor-spy-england-description = Infiltrates enemy structures for intel or
    sabotage. Exact effect depends on the
    building infiltrated.
    Loses disguise when attacking.
    Cloaked. Can detect spies.
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
      Special Ability: Disguised

actor-e7-e =
   .description = [EPIC]
    Elite commando infantry. Armed with
    sniper, C4, and a cloak.
    Speed: 80
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
      Special Ability: Destroy Building with C4
    Maximum 1 can be trained.
   .name = Assassin Tanya

actor-e7-g =
   .description = [EPIC]
    Elite commando infantry. Armed with
    gauss rifle, C4, and a chronosuit.
    Speed: 71
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
      Special Ability: Destroy Building with C4
    Maximum 1 can be trained.
   .name = Chrono-Tanya

## allies_str.yaml
actor-allies-training1 =
   .name = Sensory Training
   .description = Increases vision and attack range of all units.

actor-allies-training2 =
   .name = Advanced Training
   .description = All units will now be trained as rank 1.

actor-atek-description = Provides Allied advanced technologies.

actor-bio-a =
   .name = Weather Machine
   .description = Can generate a deadly lightning storm.
    Requires power to operate.
    Maximum 1 can be built.
      Special Ability: Lighting Storm

## allies_veh.yaml
actor-1tnk-description = Fast tank, good for scouting.
    Speed: 118
      Strong vs Light armor
      Weak vs Infantry, Tanks, Aircraft
actor-2tnk-description = Allied Main Battle Tank.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
actor-jeep-description = Fast scout & anti-infantry vehicle.
    Can carry one infantry.
    Speed: 170
      Strong vs Infantry
      Weak vs Vehicles, Aircraft

actor-aeiou =
   .description = Allied Enhanced Importance Omni Unit.
    Powerful, sturdy support unit. 
    Speed: 35  
    Special Abilitys: 
      - Chronoshift 
      - Gap Generator 
      - Global heal and repair 
      - Cloak Detection 
      - Reinforcements
      - Radar Jamming
      - Missile Jamming
   .name = AEIOU

## avali_air.yaml
actor-avfrigate =
   .description = Avali gunship armed
    with air-to-air missiles and 
     30mm burst lasers.
    Speed: 160
      Strong vs Infantry, Aircraft
      Weak vs Vehicles, Buildings
   .name = Illuminate Frigate

actor-avbomber =
   .description = Armored bomber with plasma explosives. 
    Speed: 160
      Strong vs Ground units, structures
      Weak vs Aircraft
   .name = Illuminate Bomber

actor-avcarrier =
   .description = Capital ship that repairs and 
    rearms nearby friendly aircraft and vehicles.
     Detects cloaked units. 
    Speed: 50
      Unarmed.
   .name = Illuminate Warpship Carrier

actor-avinter-name = Repair Drone

## avali_inf.yaml
actor-avinf1 =
   .description = General-purpose infantry.
    Can gain Pack Tactics with a group of
     15 or more. 
      Strong vs Infantry, light vehicles
      Weak vs Armored vehicles, Aircraft
   .name = Light Infantry

actor-avinf2 =
   .description = Infiltrates and captures
    enemy structures.
      Unarmed
   .name = Engineer

actor-avinf3 =
   .description = Squad leader, boosts nearby troops'
    speed and firepower.
     Melee. Speed: 80
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Pack Leader

actor-avinf4 =
   .description = Anti-tank/anti-aircraft infantry.
    Can gain Pack Tactics with a group of
     15 or more. 
      Strong vs Tanks, Aircraft
      Weak vs Infantry, light vehicles
   .name = Heavy Infantry

## avali_str.yaml
actor-avfact-name = Construction Command Ship

actor-avpowr1 =
   .description = Provides power for other structures.
    
    10% boost in warm environments.
   .name = Geothermic Generator

actor-avpowr2 =
   .description = Provides double the power of
    a standard Geothermic Generator.
    
    10% boost in warm environments.
   .name = Advanced Geothermic Generator

actor-avpowr3 =
   .description = Provides huge power, but very unstable.
    	Explodes violently. 
    
    10% boost in warm environments.
   .name = Uranium-Assisted Geothermic Generator

actor-avproc-name = Assimilator

actor-avtent =
   .description = Prepares avalis for fighting.
   .name = Congregation Tent

actor-avweap-name = Armor Factory

actor-avradar =
   .description = Provides an overview
    of the battlefield.
    Requires power to operate.
   .name = Communications Center

actor-avpad =
   .description = Produces and reloads
    aircraft.
   .name = Helipad

actor-avtech =
   .description = Provides Avali Illuminate advanced technologies.
      Special Ability: GPS Satellite
   .name = Illuminate Tech Center

actor-avfrost =
   .description = Generates snow. 
      Unarmed
   .name = Frost Generator

actor-avpbox =
   .name = Pillbox
   .description = Static defense with a fireport for
    a garrisoned soldier.
    Can detect cloaked units.
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft

actor-avtowr =
   .name = Anti-Air Tower
   .description = Anti-Air base defense.
    Requires power to operate.
      Strong vs Aircraft
      Weak vs Ground units

actor-avgun =
   .description = Anti-Armor base defense.
    Can detect cloaked units.
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Turret

## avali_veh.yaml
actor-avmcv =
   .description = Deploys to provide construction.
    Speed: 71
      Unarmed
   .name = Mobile Command Ship

actor-avharv-name = Miner Mech

actor-avdrone =
   .description = Fast scout & anti-infantry vehicle.
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Drone
   .name2 = EMP Drone
   .description2 = EMP suicide drone. Will disable 
      electronics for 7 seconds.
      Strong vs Vehicles, Structures

actor-av1tnk =
   .description = Illuminate Main Battle Tank.
    Can hover over water.
    Speed: 82
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Predator Tank

actor-avarty =
   .name = Impaler Mech
   .deployed = Impaler Mech (deployed)
   .description = Mobile Artillery Mech.
    Needs to deploy in order to attack.
    Speed: 64
      Strong vs Ground units
      Weak vs Aircraft
   .botdescription = Auto-deploys. AI Use only.

## china_air.yaml
actor-chinamig =
   .description = The MiG is armed with two napalm missiles that could be used effectively against ground targets.
   .name = MiG

actor-chinanukemig =
   .description = The MiG is armed with two nuclear missiles that could be used effectively against ground targets.
   .name = Tactical Nuke MiG

actor-chinahelixgatling =
   .description = The Helix helicopter provided China with a highly flexible airborne platform. Armed with a gatling gun & napalm bombs.
   .name = Helix (Gatling Cannon)

actor-chinahelixspeaker =
   .description = The Helix helicopter provided China with a highly flexible airborne platform. Armed with a propaganda tower & napalm bombs.
   .name = Helix (Speaker Tower)

actor-chinanukehelixgatling =
   .description = The Helix helicopter provided China with a highly flexible airborne platform. Armed with a gatling gun & nuclear bombs.
   .name = Nuke Helix (Gatling Cannon)

actor-chinanukehelixspeaker =
   .description = The Helix helicopter provided China with a highly flexible airborne platform. Armed with a propaganda tower & nuclear bombs.
   .name = Nuke Helix (Speaker Tower)

## china_inf.yaml
actor-chinaredguard =
   .description = China Red Guard, equipped with Bolt-action rifle.
    Speed: 62
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Red Guard
   .hordebonus--name = Red Guard (Nationalism)

actor-chinatankhunter =
   .description = Armed with a rocket launcher that could reduce armor to scraps in seconds.
   .name = Tank Hunter
   .hordebonus--name = Tank Hunter (Nationalism)

actor-chinaminigunner =
   .description = Mini-Gunners are elite Red Guards equipped with hand-held miniguns.
   .name = Minigunner
   .hordebonus--name = Minigunner (Nationalism)

actor-chinahacker =
   .description = hacking the internet dry
   .name = Hacker

actor-chinasuperhacker =
   .description = hacking the internet dry
   .name = Super Hacker

actor-chinablacklotus =
   .description = The Black Lotus unit was formed from a need to attack the enemy on a different field than just combat. Each is extremely proficient with any IT, to the point that they can subvert enemy buildings and disable vehicles.
   .name = Black Lotus

actor-chinanukeneer =
   .description = The Nukeneer can use their bulky mortar to lob low-yield tactical nuclear warheads over significant distances.
   .name = Nukaneer
   .hordebonus--name = Nukaneer (Nationalism)

actor-chinadragonbreathers =
   .description = Armed with a close range shotgun with Dragonbreath rounds.
   .name = Dragonbreather
   .hordebonus--name = Dragonbreather (Nationalism)

actor-chinamortar =
   .description = The mortar team can use their bulky mortar to lob artillery over significant distances.
   .name = Mortar
   .hordebonus--name = Mortar (Nationalism)

## china_shp.yaml
actor-chinainfernoship =
   .description = Very slow long-range ship.
      Strong vs Buildings, Infantry
      Weak vs Vehicles
   .name = Inferno Carrier

actor-chinadreadnought =
   .description = Anti-armor warship.
    Can detect submarines.
    Speed:85
      Strong vs Naval units, Tanks
      Weak vs Infantry
   .name = Dreadnought

actor-chinaemperorbattlecruiser =
   .description = Long range battleship.
    Provides propaganda bonus
    Strong vs Buildings, Ground Units
    Weak vs Aircraft
   .name = Emperor Battlecruiser

actor-chinaemperornuclearcruiser =
   .description = Long range nuclear battleship.
    Provides propaganda bonus.
    Explodes violently.
    Strong vs Buildings, Ground Units
    Weak vs Aircraft
   .name = Emperor Nuclear Battlecruiser

## china_str.yaml
actor-chinanuclearreactor =
   .description = Provides power for other structures.
    Can be deployed to Overcharge Power at the cost of structure integrity.
   .name = Nuclear Reactor

actor-chinasupplycenter =
   .description = Refines Ore and Gems
    into credits.
   .name = Supply Center
   .infiltrateforcash-infiltrated-text-notification = Credits stolen.

actor-chinabarracks =
   .description = Trains infantry.
   .name = Barracks

actor-chinawarfactory =
   .description = Produces vehicles.
   .name = War Factory

actor-chinapropagandacenter =
   .description = Propaganda Center, provides upgrades.
   .name = Propaganda Center
   .airstrikepower-spyplane-select-target-text-notification = Select target.
   .airstrikepower-spyplane-end-charge-text-notification = Spy plane ready.

actor-chinaartillerypower-name = bomblol
actor-china-bomber-name = Stealth Bomber

actor-chinaairfield =
   .description = Produces and reloads aircraft.
      Special Ability: Spy Plane.
   .name = PRC Airfield

actor-chinainternetcenter =
   .description = internet cafe to play LEAGUE OF LEGENDS and sell the accounts for FAT STACKS
   .name = Internet Cafe (Currently playing League of Legends)

actor-chinanuclearsilo =
   .name = Nuclear Missile Silo
   .description = Provides a Nuke.

actor-chinagatlinggun =
   .description = Anti-Infantry and Air base defense.
    Can detect cloaked units.
      Strong vs Infantry, Aircraft
      Weak vs Vehicles
   .name = Gatling Cannon

actor-chinaspeakertower =
   .name = Speaker Tower
   .description = Provides a 10% attack speed buff to nearby units. Can be upgraded to provide 20%

actor-chinabunker =
   .name = Bunker
   .description = Static defense with a fireport for
    a garrisoned soldiers.

actor-chinafortifiedbunker =
   .name = Fortified Bunker
   .description = Static defense with a fireport for
    a garrisoned soldier.
    Can detect cloaked units.
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft

actor-chinanukecannonai =
   .description = fuckyou
   .name = Nuke Cannon

actor-chinashipyard =
   .description = Produces and repairs
    ships and transports.
   .name = China Naval Yard
   .repairsunits-start-repairing-text-notification = Repairing.
   .repairsunits-finish-repairing-text-notification = Unit repaired.

actor-chinasupernuclearsilo =
   .name = Super Nuclear Missile Silo
   .description = Provides a Super Nuke.

actor-chinaadvnuclearreactor-name = Advanced Nuclear Reactor

actor-chinabreederreactor =
   .description = Provides incredible power, but very unstable.
    Explodes violently.
   .name = Breeder Reactor

## china_upg.yaml
actor-upgrade-tankgeneral =
   .name = Ta Hun Kwai
   .description = Recruit General Ta Hun Kwai to join your forces.
    Unlocks advanced tank units and abilities.

actor-upgrade-nukegeneral =
   .name = Tsing Shi Tao
   .description = Recruit General Tsing Shi Tao to join your forces.
    Unlocks advanced nuclear weaponry and abilities.

actor-upgrade-infantrygeneral =
   .name = Shin Fai
   .description = Recruit General Shin Fai to join your forces.
    Unlocks advanced infantry units and abilities.

actor-upgrade-patriotism =
   .name = Patriotism
   .description = Upgrade the horde bonus even further to provide an additional 25% attack speed boost.

actor-upgrade-nationalism =
   .name = Nationalism
   .description = Improves horde bonus to give 25% attack speed.

actor-upgrade-propaganda =
   .name = Subliminal Messaging
   .description = Subliminal messaging techniques increase the effect of broadcast propaganda from their speaker towers by 10%.

actor-upgrade-infantrytraininglvl1 =
   .name = Infantry Training
   .description = Train your infantry units, newly recruited infantry are Rank 1.

actor-upgrade-vehicletraininglvl1 =
   .name = Vehicle Training
   .description = Train your vehicle units, newly produced vehicles are Rank 1.

actor-upgrade-infantrytraininglvl2 =
   .name = Elite Infantry Training
   .description = Train your infantry units, newly recruited infantry are Rank 2.

actor-upgrade-vehicletraininglvl2 =
   .name = Elite Vehicle Training
   .description = Train your vehicle units, newly produced vehicles are Rank 2.

actor-upgrade-artillerytraininglvl1 =
   .name = Artillery Training
   .description = Train your artillery units, newly produced Inferno Cannons & Nuke Cannons are Rank 1.

actor-upgrade-uraniumtanks =
   .name = Nuclear Engines
   .description = Upgrade your Battlemaster, Hopper & Overlord tanks with more powerful engines increasing movement speed. Vehicles will now violently explode.

actor-upgrade-uraniumshells =
   .name = Uranium Shells
   .description = Upgrade your Battlemaster, Hopper & Overlord tanks with more powerful attacks. Attacks will now leave radiation.

actor-upgrade-isotopes =
   .name = Isotopes Stability
   .description = Isotope stability prevents the collateral damage from harming friendly units with radiation.

actor-upgrade-autoloader =
   .name = Autoloader
   .description = Increases firerate of Battlemasters & Hopper Tanks by 20%.

actor-upgrade-firstaidkits =
   .name = First Aid Kits
   .description = Allows infantry to heal in between battles if they have been critically injured.

## china_veh.yaml
actor-chinabattlemaster =
   .description = China main battle tank.
    Equipped with an 125 mm 2A46 smoothbore gun.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Battlemaster Tank
   .hordebonus--name = Battlemaster Tank (Nationalism)

actor-chinadragontank =
   .description = The Dragon tank is a specialized flamethrower tank.
    Equipped with an Flamethrower.
    Speed: 85
      Strong vs Infantry
      Weak vs Vehicles
   .name = Dragon Tank

actor-chinagatlingtank =
   .description = Mobile unit with mounted Gatling gun.
      Strong vs Infantry, Aircraft
      Weak vs Tanks
   .name = Gatling Tank

actor-chinalisteningoutpost =
   .description = The Listening Outpost can be deployed on the front lines, detecting unit movements over a wide radius, including stealth units.
   .name = Listening Outpost

actor-chinaattackoutpost =
   .description = Like the Listening Outpost, it can detect all types of enemy units over a wide radius.
    Equipped with a propaganda tower.
   .name = Attack Outpost

actor-chinatroopcarrier =
   .description = The Troop Crawler is a fairly fast but unarmed APC that is not designed to come into contact with heavy armor.
   .name = Troop Crawler

actor-chinaassaulttroopcarrier =
   .description = Like the regular Troop Crawler, it is a reasonably fast wheeled APC.
    Already coming with eight red guard on board upon rolling out of the War Factory, with stealth detection.
      Strong vs Infantry, Buildings
      Weak vs Tanks
   .name = Assault Troop Crawler

actor-chinaecm =
   .description = A multi-frequency jammer effectively disrupts guided missile and rocket attacks, which can cause them to miss their targets.
    Equipped with an ECM Laser that disables vehicles.
      Strong vs Tanks, Defences
      Weak vs Infantry, Aircraft
   .name = ECM Tank

actor-chinainfernocannon =
   .description = Inferno Cannons are self-propelled howitzers, firing napalm shells that explode and burn on impact, doing great damage to softer targets.
      Strong vs Infantry, Buildings
      Weak vs Tanks, Aircraft
   .name = Inferno Artillery

actor-chinanukecannon =
   .name = Nuke Cannon
   .deployed--name = Nuke Cannon (deployed)
   .description = The Nuke Cannon consists of a large howitzer-like weapon mounted on a tracked vehicle, with a cabin for the crew located at the front, similar to a regular truck.
      Strong vs Everything
      Weak vs Aircraft

actor-chinaoverlord-name = Overlord Tank

actor-chinaoverlordspeaker =
   .description = Large and slow, the Overlord tank is a battlefield force to be reckoned with. Equipped with a propaganda tower.
      Strong vs Tanks, Buildings
      Weak vs Aircraft, Infantry
   .name = Overlord Tank (Speaker Tower)

actor-chinaoverlordgatling =
   .description = Large and slow, the Overlord tank is a battlefield force to be reckoned with. Equipped with a Gatling Gun.
      Strong vs Everything
   .name = Overlord Tank (Gatling Cannon)

actor-chinaemperor =
   .description = The Emperor Overlord Tank is an improved model of the Overlord tank. Equipped with both Gatling gun and Propaganda Tower. Limit of 2.
      Strong vs Everything
   .name = Emperor Overlord Tank

actor-chinaemperortankgeneral-description = The Emperor Overlord Tank is an improved model of the Overlord tank. Equipped with both Gatling gun and Propaganda Tower. Limit of 5.
      Strong vs Everything

actor-chinahoppertank =
   .description = China support battletank. Good for building horde bonus.
    Equipped with an 125 mm 2A46 smoothbore gun.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Hopper Tank
   .hordebonus--name = Hopper Tank (Nationalism)

actor-chinashenlong =
   .description = [EPIC]
    The Shenlong Emperor Tank is the most advanced overlord tank ever created.
      Strong vs Everything
   .name = Shenlong Emperor Tank

actor-chinafortress =
   .description = [EPIC]
    The Suan Ni Mobile Battle Fortress is a highly advanced troop carrier.
   .name = Suan Ni Mobile Battle Fortress

actor-chinazhurong =
   .description = [EPIC]
    The Zhu Rong Tank wields a fragmentation cannon.
      Strong vs Infantry, Vehicles, Buildings
      Weak vs Aircraft
   .name = Zhu Rong

## civ_inf.yaml
actor-c1-c =
   .description = Citizen of your city.
      Weak vs Everything
   .name = Civilian

actor-c2-c =
   .description = Citizen of your city.
      Weak vs Everything
   .name = Civilian

actor-c3-c =
   .description = Citizen of your city.
      Weak vs Everything
   .name = Civilian

actor-c4-c =
   .description = Citizen of your city.
      Weak vs Everything
   .name = Civilian

actor-c5-c =
   .description = Citizen of your city.
      Weak vs Everything
   .name = Civilian

actor-c6-c =
   .description = Citizen of your city.
      Weak vs Everything
   .name = Civilian

actor-police =
   .description = Potects your city and enforces the law.
      Weak vs Vehicles, Aircraft
   .name = Police Officer

actor-dog-c =
   .description = K-9 police unit.
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Police Dog

actor-cstructw =
   .description = Repairs and maintains
    city structures.
      Unarmed
   .name = Construction Worker

actor-pmedi =
   .description = Heals nearby infantry.
      Unarmed
   .name = Paramedic

actor-scientist =
   .description = Collects and studies Tiberium.
      Not damaged by Tiberium.
   .name = Scientist

actor-leader =
   .description = Leader of the people.
      Weak vs Everything
   .name = Leader

## civ_str.yaml
actor-fcom-c =
   .description = Trains police officers and dogs.
   .name = Police Station

actor-hosp-c =
   .description = Keeps your city healthy.
   .name = Hospital

actor-v01-c =
   .description = Produces structures.
   .name = Church

actor-v02-c =
   .description = Provides civilians a place to live in the city.
   .name = Double Long House

actor-v03-c =
   .description = Provides civilians a place to live in the city.
   .name = Double House

actor-v04-c =
   .description = Provides civilians a place to live in the city.
   .name = Big House

actor-v05-c =
   .description = Provides civilians a place to live in the city.
   .name = Shed House

actor-v06-c =
   .description = Provides civilians a place to live in the city.
   .name = Farm House

actor-v07-c =
   .description = Provides civilians a place to live in the city.
   .name = Fence House

actor-v08-c =
   .description = Provides civilians a place to live in the city.
   .name = Box House

actor-v09-c =
   .description = Provides civilians a place to live in the city.
   .name = Tiny House

actor-v10-c =
   .description = Provides civilians a place to live in the city.
   .name = Simple House

actor-v11-c =
   .description = Provides civilians a place to live in the city.
   .name = Small House

actor-rushouse-c =
   .description = Provides civilians a place to live in the city.
   .name = Rush House

actor-asianhut-c =
   .description = Provides civilians a place to live in the city.
   .name = Asian House

actor-v13-c =
   .description = Provides the city with lolz.
   .name = Pile of Fun

actor-v12-c =
   .description = Provides the city with lolz.
   .name = Bigger Pile of Fun

actor-v14-c =
   .description = Provides the city with food.
   .name = Corn Field

actor-v15-c =
   .description = Provides the city with food.
   .name = Grain Field

actor-v16-c =
   .description = Provides the city with food.
   .name = Gourd Field

actor-v17-c =
   .description = Provides the city with food.
   .name = Potato Field

actor-v18-c =
   .description = Provides the city with food.
   .name = Cabbage Field

actor-rice-c =
   .description = Provides the city with food.
   .name = Rice Field

actor-v19-c =
   .description = Provides steady income to the city.
   .name = Oil Derrick

actor-oilb-c =
   .description = Provides a larger steady income to the city.
   .name = Oil Refinery

actor-barl-c =
   .description = Provides resource storage.
   .name = Resource Barrel

actor-brl3-c =
   .description = Provides resource storage.
   .name = Resource Barrels

actor-bio-c =
   .description = Enhance the health of the city's citizens
    and research dangerous materials.
   .name = Biological Lab

actor-weap-c =
   .description = Produces vehicles and supplies.
   .name = Shipping Center

actor-lhus-c =
   .description = Provides a view of the surroundings. 
    Can detect cloaked units.
   .name = Lighthouse

actor-windmill-c =
   .description = Provides power to the city.
   .name = Windmill

actor-utilpol1-c =
   .description = Provides power to the city.
   .name = L/R Utility Pole

actor-utilpol2-c =
   .description = Provides power to the city.
   .name = U/D Utility Pole

actor-ctek =
   .description = Provides your city with advancement opportunities.
   .name = City Hall

actor-cflarf =
   .description = Allows your city to develop aircraft.
   .name = Aerospace Center

actor-airport =
   .description = Allows your city to develop aircraft.
   .name = Airport

actor-civflag =
   .description = A landmark that inspires your city.
   .name = Flag

actor-autogara =
   .description = Repairs and maintains vehicles in your city.
   .name = Auto Garage

actor-actek =
   .description = Provides the capability to build advanced projects.
   .name = Advanced Communications Center

actor-radio-c =
   .description = Provides access to GPS Satellite.
    Also provides radar.
   .name = Radio Telescope

actor-satcntr =
   .description = Provides GPS launch capability.
   .name = Satellite Launch Center

## civ_veh.yaml
actor-mcvc =
   .description = Deploys into another Church.
      Unarmed
   .name = Mobile Church Vehicle

## civilian.yaml
actor-c10-dr-name = Dr. Fowl

## corehero.yaml
meta-heroexp-gainsexperience-hero-level-up-text-notification = Unit promoted.

meta-hero =
   .gainsexperience-level-up-text-notification = Hero gained a level.
   .tooltipdescription-0-description = Level 0
   .tooltipdescription-1-description = Level 1
   .tooltipdescription-2-description = Level 2
   .tooltipdescription-3-description = Level 3
   .tooltipdescription-4-description = Level 4
   .tooltipdescription-5-description = Level 5

meta-herotier1-tooltipdescription-tier1-description = Tier 1
meta-herotier2-tooltipdescription-tier1-description = Tier 2
meta-herotier3-tooltipdescription-tier1-description = Tier 3
meta-herotier4-tooltipdescription-tier1-description = Tier 4
meta-herotier5-tooltipdescription-tier1-description = Tier 5

## crates.yaml
actor-moneycratesupplydrop-name = Supply Drop Money Crate

actor-crate-fuckyou =
   .name = Crate
   .generic-name = Crate

actor-grave-name = Haunted Mausoleum

actor-zombie =
   .name = Zombie
   .description = Slow undead. Attacks in close combat.

actor-dukenukem-name = Duke Nukem
actor-judgedredd-name = Judge Dredd
actor-fakecrate-name = Crate
actor-amogus-name = Sussy Baka
actor-colonydrop-name = why the fuck are you mousing over this, you have more important things to do if this is coming down
actor-powerproxy-colonydrop-droppodspower-colonydrop-select-target-text-notification = Select target.
actor-powerproxy-roadroller-droppodspower-roadroller-select-target-text-notification = Select target.
actor-roadroller-name = KONO DIO DA!
actor-roadroller-dropped-name = Road Roller
actor-roadroller-leave-name = Road Roller
actor-oblid-cr-name = Obelisk of Creeps
actor-johncena-name = John Cena (you cant see me)
actor-jarofdirt-name = Captain Jack Sparrow

## defaults.yaml
meta-flyingbuilding =
   .actorlostnotification-text-notification = Structure lost.
   .generic-name = Structure
   .capturenotification-text-notification = Structure captured.

meta-viceroid-name = Visceroid

meta-road =
   .description = Expands city limits.
   .name = Road

meta-tibtree-name = Blossom Tree
meta-infectabletree-infected--name = Tree (infected)

## fed_air.yaml
actor-vanguard =
   .description = VTOL aircraft armed
    with multi-purpose missiles.
    Speed: 149
      Strong vs Tanks, Aircraft
      Weak vs Infantry
   .name = Vanguard Gunship

actor-lance =
   .description = Ground and air support fighter.
    Speed: 186
      Strong vs Ground and Air
      Weak vs Anti-Air
   .name = O-19 Lance

actor-lance-husk-name = O-19 Lance

actor-nhwk =
   .description = Precision strike stealth bomber.
    Speed: 186
      Strong vs Heavy Armor
      Weak vs Anti-Air
   .name = F-117C Nighthawk

actor-nhwk-husk-name = F-117C Nighthawk

actor-paladin =
   .description = Strong attack plane with countermeasures.
    Speed: 223
      Strong vs Ground and Air
      Weak vs Anti-Air
   .name = S-91 Paladin

actor-paladin-husk-name = S-91 Paladin

actor-c17-f =
   .description = Nuclear Ground-Attack Plane.
    Speed: 120
      Strong vs Buildings, Light Vehicles
      Weak vs Anti-Air
   .name = C-17 Bomber

actor-c17-husk2-name = C-17 Bomber

actor-spectre =
   .description = Nuclear Ground-Attack Plane.
    Speed: 120
      Strong vs Ground Targets
      Weak vs Anti-Air
   .name = AC-130 Spectre Gunship

actor-spectre-husk-name = AC-130 Spectre Gunship

## fed_inf.yaml
actor-fe1 =
   .description = Infantry in training.
      Strong vs Nothing
      Weak vs Everything
   .name = Initiate

actor-fe2 =
   .description = Assault infantry.
      Strong vs Infantry
      Weak vs Vehicles
   .name = Strike Knight

actor-fe3 =
   .description = Infantry armed with grenades. 
      Strong vs Buildings, Infantry
      Weak vs Vehicles
   .name = Grenade Knight

actor-fe4 =
   .description = Anti-tank infantry with grenades.
      Strong vs Tanks
      Weak vs Infantry
   .name = Heavy Knight

actor-fe6 =
   .description = Infiltrates and captures
    enemy structures.
      Unarmed
   .name = Tech Knight

actor-fe7 =
   .description = Elite stealth infantry, armed with 
    a sniper rifle.
      Strong vs Infantry
      Weak vs Vehicles
   .name = Hunter Knight

actor-fmedi =
   .description = Heals nearby infantry.
      Unarmed
   .name = Medic Knight

actor-fshok =
   .description = Infantry with tesla coils
     Strong vs Infantry, Vehicles
     Weak vs Air, long-range
   .name = Shock Knight

actor-frmbo =
   .description = Elite commando unit.
      Strong vs heavy armor, Buildings
      Weak vs Aircraft
   .name = Justicar

actor-fmech =
   .description = Fixes nearby vehicles and 
    doesn't afraid of anything.
      Unarmed
   .name = Repair Knight

## fed_shp.yaml
actor-eyeship =
   .description = Light scout ship.
    Can detect submarines.
    Speed: 128
      Weak vs Everything
      Unarmed.
   .name = Scout Cruiser

actor-dd-f-name = Silver Destroyer

actor-cruisemis =
   .description = Very slow long-range ship. 
    Speed: 42
      Strong vs Buildings
      Weak vs Ships, Submarines
   .name = Cruise Missile Frigate

actor-dd-r =
   .description = Anti-armor warship.
    Can detect submarines.
    Speed:85
      Strong vs Naval units, Heavy armor
      Weak vs Infantry, Tanks
   .name = Railgun Destroyer

actor-silverlining =
   .description = Order captial ship.
    Speed: 42
      Deflects incoming missiles.
      Can detect cloaked units. 
      Strong vs Buildings and Aircraft
      Weak vs Ships, Submarines
   .name = Silver Lining

## fed_str.yaml
actor-fedupgrades =
   .shields = Energy Shields
   .shieldsdesc = Provides Federation forces with shields.
   .nanites = Nanites
   .nanitedesc = Enables self-healing on Federation forces.

actor-ftek =
   .description = Provides Federation advanced technologies.
   .name = Federation Tech Center

actor-gap3 =
   .name = Federation Eye
   .description = Detects nearby cloaked units.
      Strong vs Spies, Phase Transports
     Weak vs Uncloaked things

actor-dgun =
   .description = Long Range, Anti-Armor base defense.
      Strong vs Tanks
      Weak vs Infantry, Aircraft
   .name = Hellfire Cannon

actor-advsam =
   .description = Stronger Anti-Air base defense.
    Requires power to operate.
    Can detect cloaked units.
      Strong vs Aircraft
      Weak vs Ground units
   .name = Advanced SAM Site

actor-oregen =
   .description = Generates an ore field, 
      Unarmed
   .name = Ore Generator

actor-gemgen =
   .description = Generates a gem field, 
      Unarmed
   .name = Gem Generator

## fed_veh.yaml
actor-aaty =
   .description = Long-range quad artillery.
      Strong vs Infantry, Buildings
    Speed: 85
      Weak vs Tanks, Aircraft
   .name = Rook Artillery

actor-btnk =
   .description = Federation Main Battle Tank.
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Plasma Tank
   .generic-name = Tank

actor-lmech =
   .description = Federation assault mech. Uses fire.
      Strong vs Infantry, Light Vehicles
      Weak vs Vehicles, Aircraft
   .name = Legionary
   .generic-name = Mech

actor-drone =
   .description = Federation stealth drone.
      Strong vs Infantry, Light Vehicles
      Weak vs Heavy Vehicles, Aircraft
   .name = Sentinel
   .generic-name = Drone

actor-mornstar =
   .description = Light, missile weilding hover vehicle.
      Strong vs Vehicles, Aircraft
      Weak vs Vehicles, Aircraft
   .name = Morning Star

actor-rtnk =
   .description = Federation transport tank.
      Strong vs Infantry, Light Vehicles
      Weak vs Heavy Vehicles, Aircraft
   .name = Reaper Transport

actor-speeder =
   .description = Fast scout vehicle, armed with 
    rockets.
      Strong vs Vehicles, Aircraft
      Weak vs Infantry
   .name = Speeder

actor-fcru =
   .description = Strong mech unit.
      Strong vs Everything
      Weak vs Fast Aircraft
   .name = Crusader
   .generic-name = Mech

actor-solc =
   .description = [EPIC]
    Very slow, armoured deployable 
     tank, powerful long range nuke.
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Sol Cannon

actor-solcdepl-name = Sol Cannon (Deployed)
actor-solcorb1-name = Sol Orb

## gdi_air.yaml
actor-orca =
   .description = VTOL aircraft armed
    with multi-purpose missiles.
    Speed: 149
      Strong vs Tanks, Aircraft
      Weak vs Infantry
   .name = Orca Fighter

actor-orca-husk-name = Orca Fighter

actor-a10 =
   .description = Bomber with a firey payload.
    Speed: 256
      Strong vs Infantry, structures
      Weak vs Aircraft
   .name = A-10 Warthog

actor-tsorca =
   .description = VTOL aircraft armed
    with multi-purpose missiles.
    Speed: 160
      Strong vs Tanks, Aircraft
      Weak vs Infantry
   .name = Orca Gunship

actor-tsorca-husk-name = Orca Gunship

actor-tsorcab =
   .description = VTOL Bomber with a devastating payload.
    Speed: 150
      Strong vs Ground units, Structures
      Weak vs Aircraft
   .name = Orca Bomber

actor-tsorcab-husk-name = Orca Gunship

actor-tsorcatran =
   .description = Heavily armored VTOL transport.
    Can transport vehicles.
    Can paradrop its cargo.
    Speed: 100
      Unarmed
   .name = Orca Carryall

actor-tsorcatran-husk-name = Orca Carryall

actor-tskodiac =
   .description = [EPIC]
    Capital VTOL Airship armed
    with devastating Air-to-Ground weapons.
      Special Ability: Can Deploy to produce as Barracks.
      Strong vs Ground
      Weak vs Air
   .name = Flagship Kodiak

actor-tskodiac-husk-name = Flagship Kodiak
actor-tskodid-name = Flagship Kodiak

## gdi_inf.yaml
actor-rmbo =
   .description = Elite commando infantry. Armed with
    a sniper and C4.
    Speed: 71
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
      Special Ability: Destroy Building with C4
   .name = Commando

actor-tsghost =
   .description = Anti-ground elite infantry with a railgun.
    Speed: 71
      Strong vs Everything
      Weak vs Aircraft
   .name = ZOCOM Commando

actor-tsjump =
   .name = Jumpjet Infantry
   .description = Airborne soldier.
    Speed: 71
      Strong vs Infantry, Aircraft
      Weak vs Vehicles

actor-tselite =
   .description = [EPIC]
    Anti-ground elite infantry with a railgun
     and nuke grenades.
    Speed: 71
      Strong vs Everything
      Weak vs Aircraft
   .name = Super Elite

actor-d6-havoc =
   .description = Elite commando infantry.
   .name = Havoc

actor-d6-deadeye-name = Deadeye
actor-d6-gunner-name = Gunner
actor-d6-patch-name = Patch
actor-d6-hotwire-name = Hotwire

## gdi_str.yaml
actor-gdi-speed =
   .name = Research Reactor Engines
   .description = Increases movement speed of tanks and aircraft.

actor-gdi-suits =
   .name = Supply Hazard Suits
   .description = Grants immunity to corrosion and similar effects.

actor-atek-gdi =
   .description = Provides GDI advanced technologies.
   .name = GDI Tech Center

actor-eyed =
   .description = Provides radar and Orbital Ion Cannon support power.
    Requires power to operate.
   .name = Adv. Com. Center

actor-atwr =
   .name = Advanced Guard Tower
   .description = All-purpose defensive structure.
    	Strong vs Aircraft, Tanks
    	Weak vs Infantry

actor-atwr2 =
   .name = Rocket Tower
   .description = High-explosive defensive structure.
    Cannot attack air.
    	Strong vs Vehicles

actor-ctwr =
   .description = Upgradeable static defense.
    Can be placed on Concrete Walls.
      Unarmed unless upgraded.
   .name = Component Tower
   .vulcan = Vulcan Cannon
   .sssa = SS-SA Missile Tower
   .flame = Flame Tower
   .tesla = EMP Tesla Coil
   .sam = SAM Site

actor-ctwr-gun =
   .name = Vulcan Cannon attachment
   .description = Place on a free Component Tower. 
     Strong vs Infantry

actor-ctwr-agt =
   .name = Missile rack attachment
   .description = Place on a free Component Tower. 
     Strong vs Infantry, Vehicles, Aircraft

actor-ctwr-ftur =
   .name = Flame Turret attachment
   .description = Place on a free Component Tower. 
     Strong vs Infantry

actor-ctwr-tsla =
   .name = Tesla Coil attachment
   .description = Place on a free Component Tower. 
     Strong vs Infantry, Vehicles

actor-ctwr-sam =
   .name = SAM Site attachment
   .description = Place on a free Component Tower. 
     Strong vs Aircraft

## gdi_veh.yaml
actor-mtnkd-g =
   .description = GDI Main Battle Tank.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = GDI Medium Tank

actor-htnkd-g =
   .description = Big and slow tank, with anti-air capability.
    Can crush concrete walls.
    Speed: 50
      Strong vs Vehicles, Infantry, Aircraft
      Weak vs Nothing
   .name = GDI Mammoth Tank
   .generic-name = Tank

actor-jeepd =
   .description = Fast scout & anti-infantry vehicle.
    Can carry one infantry.
    Speed: 156
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Humvee

actor-msam =
   .description = Long-range rocket artillery.
    Speed: 85
      Strong vs Infantry, Light armor, Buildings
      Weak vs Tanks, Aircraft
   .name = Rocket Launcher

actor-smech =
   .description = Anti-personnel walker.
    Speed: 99
      Strong vs Infantry, Light armor
      Weak vs Vehicles, Aircraft
   .name = Wolverine

actor-mmch =
   .description = General purpose mechanized walker.
    Speed: 60
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Titan

actor-jugg =
   .name = Juggernaut
   .deployed--name = Juggernaut (deployed)
   .description = Mobile Artillery Mech.
    Needs to deploy in order to attack.
    Speed: 71
      Strong vs Ground units
      Weak vs Aircraft
   .botdescription = Auto-deploys. AI Use only.

actor-triton =
   .description = Advanced multi-purpose mechanized walker.
    Speed: 52
      Strong vs Vehicles, Infantry, Air
      Weak vs Nothing
   .name = Marauder

actor-direwolf =
   .description = [EPIC]
    Advanced mech walker armed with gauss rifles,
     missiles and anti-infantry laser.
    Mid damage and low speed for higher health than
     other epic units.
    Speed: 44
    
      Strong vs Everything
      Weak vs Nothing
   .name = Direwolf

## gla_inf.yaml
actor-ge1 =
   .description = Light infantry.
    Speed: 62
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Rebel

actor-ge1r1-name = Elite Rebel

actor-ge2 =
   .description = Suicide bomber.
    Speed: 64 - 84
      Strong vs Infantry, Vehicles
      Weak vs Long range
   .name = Terrorist

actor-ge3 =
   .description = Anti-tank/Anti-aircraft infantry.
    Speed: 62
      Strong vs Vehicles, Aircraft
      Weak vs Infantry
   .name = RPG Troop

actor-gharv =
   .description = Collects Ore, Tiberium and Gems for processing.
    Can repair buildngs and vehicles.
    Infiltrates and captures
    enemy structures.
    Speed: 64
      Unarmed
   .name = Worker

actor-ghijack =
   .description = Steals enemy credits.
    Hijacks enemy vehicles.
    Unarmed.
    Speed: 72
   .name = Hijacker

actor-tse5-g =
   .description = Stealth sniper.
    Invisible to GPS, weapon has tracer.
    Speed: 56
      Strong vs Infantry
      Weak vs Everything else
   .name = Jarmen Kell

actor-c1-master =
   .name = Angry Mob
   .description = Very angry at the enemy.
    Speed: 56
      Strong vs Ground units
      Weak vs Aircraft

actor-c1-g-name = Angry Mob
actor-c10-g-name = Angry Scientist

## gla_str.yaml
meta-glahole-name = GLA Hole
actor-gfact-hole-name = GLA Hole (Construction Yard)
actor-gtent-name = GLA Barracks
actor-gtent-hole-name = GLA Hole (Barracks)
actor-gproc-hole-name = GLA Hole (Refinery)
actor-gfoundry-hole-name = GLA Hole (Foundry)
actor-gadvtech-hole-name = GLA Hole (Adv Tech Centre)

actor-atek-gla =
   .description = Provides GLA advanced technologies.
   .name = GLA Palace

actor-atek-hole-name = GLA Hole (Palace)
actor-gsilo-hole-name = GLA Hole (Silo)

actor-gair =
   .description = Delivers vehicles.
   .name = Airstrip

actor-gair-hole-name = GLA Hole (Airstrip)
actor-gfix-hole-name = GLA Hole (Service Depot)
actor-gpbox-hole-name = GLA Hole (Pillbox)
actor-ghbox-hole-name = GLA Hole (Camo Pillbox)

actor-sstorm =
   .name = Scud Storm
   .description = Delivers a barrage of SCUD missiles.
    Requires power to operate.
    Maximum 1 can be built.
      Special Ability: Scud Storm

actor-sstorm-hole-name = GLA Hole (Scud Storm)
actor-gmiss-hole-name = GLA Hole (EpiTech Centre)

actor-gblk =
   .description = Provides steady income for the GLA.
   .name = Black Market

actor-gblk-hole-name = GLA Hole (Black Market)

actor-gstg =
   .description = Anti-Armor/Aircraft base defense.
    Can detect cloaked units.
      Strong vs Vehicles, Aircraft
      Weak vs Infantry
   .name = Stinger Site

actor-gstg-hole-name = GLA Hole (Stinger Site)
actor-gamb-name = GLA Ambush Hole

actor-gsneak =
   .description = Entry point for GLA ground units to 
    use the tunnel network. 
    
    Allows you to build a Sneak Attack.
   .name = GLA Tunnel Network

actor-gsneak-teleport-name = GLA Tunnel Network
actor-gsneak-hole-name = GLA Hole (Tunnel Network)

actor-gsneak2 =
   .description = Exit point for GLA ground units to 
    use the tunnel network. 
    
    Can be placed anywhere.
     Lasts 1 minute.
   .name = GLA Sneak Attack

actor-gsneak2-hole-name = GLA Hole (Sneak Attack)

## gla_upg.yaml
actor-upgrade-glashoes =
   .name = Worker Shoes
   .description = Improve worker move speed by 20%

actor-gla-beta =
   .name = Anthrax Beta
   .description = Increases damage of chemical weapons by 33%

actor-gla-pay =
   .name = Hazard Pay
   .description = Pays your workers more, and in turn this
     increases GLA Hole resilience.

## gla_veh.yaml
actor-gmgg =
   .name = Radar Van
   .description = Provides an overview
    of the battlefield.
    Speed: 64
      Unarmed

actor-gbike-description = Fast scout vehicle, armed with dual machine guns.
    Speed: 213
      Strong vs Infantry
      Weak vs Vehicles

actor-gscud =
   .description = Long-range rocket artillery.
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
   .name = GLA Scud Launcher

actor-gscud-t =
   .description = Long-range rocket artillery loaded with Tiberium.
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
   .name = GLA Toxin Scud

actor-gftrk =
   .description = Mobile unit with mounted tiberium sprays.
    Causes armour debuff.
    Speed: 98
      Strong vs Infantry, Light armor, Structures
      Weak vs Tanks
   .name = Toxin Truck

actor-1tnk-g-name = GLA Light Tank

actor-bggyd-g =
   .description = Fast anti-armour buggy.
    Speed: 135
      Strong vs Vehicles
      Weak vs Vehicles, Infantry
   .name = Rocket Buggy

actor-dtrk-g =
   .description = Truck with actively armed 
    explosives. Has very weak armor.
     Speed: 128
   .name = Demo Truck

actor-mnly-g =
   .description = Lays demo traps to destroy
    unwary enemy units.
    Can detect mines.
     Speed: 96
      Unarmed
   .name = Demotrap Layer

actor-bbus =
   .description = Unarmed infantry transport.
    Infantry can fire from inside.
    Speed: 88 
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft
   .name = Battle Bus

## husks.yaml
actor-mcvd-husk-name = Husk (Mobile Construction Vehicle)
actor-mcvm-husk-name = Husk (Mobile Construction Vehicle)
actor-stnkd-husk-name = Husk (Stealth Tank)
actor-ctnkb-husk-name = Husk (Mobile Stealth Gen.)
actor-ltnkd-husk-name = Husk (Light Tank)
actor-mtnkd-husk-name = Husk (GDI Med Tank)
actor-htnkd-husk-name = Husk (GDI Mammoth Tank)
actor-mtnkd-nz-husk-name = Husk (Nazi Med Tank)
actor-2tnk-nz-husk-name = Husk (Tank Destroyer)
actor-3tnk-nz-husk-name = Husk (Nazi Heavy Tank)
actor-c17-husk-name = C17
actor-a10-husk-name = A10
actor-mmch-husk-name = Husk (Titan)
actor-triton-husk-name = Husk (Marauder)
actor-dmgtnk-husk-name = Husk (Mammoth Mk III)
actor-dmgtnk-ph-husk-name = Husk (Raider Mammoth)
actor-dmgtnk-m-husk-name = Husk (Mammoth Overlord)
actor-btnk-husk-name = Husk (Plasma Tank)
actor-btnk-m-husk-name = Husk (Plasma Tank)
actor-maus-husk-name = Husk (Maus)
actor-bbus-husk-name = Husk (Battle Bus)
actor-fcru-husk-name = Husk (Crusader)
actor-jugg-husk-name = Husk (Juggernaut)
actor-novan-husk-name = Husk (Purifier)
actor-harvd-husk-name = Husk (Harvester)
actor-pscout-husk-name = Scout
actor-pcorsair-husk-name = Corsair
actor-parbiter-husk-name = Arbiter
actor-pcarry-husk-name = Carrier
actor-pcarry-groundhusk-name = Husk (Carrier)
actor-pmother-husk-name = Mothership
actor-pshuttle-husk-name = Shuttle
actor-combatchinook-husk-name = Combat Chinook
actor-usaraptor-husk-name = Raptor
actor-usastealthfighter-husk-name = Stealth Fighter
actor-usaaurora-husk-name = Aurora
actor-usakingraptor-husk-name = King Raptor
actor-usaauroraalpha-husk-name = Aurora Alpha
actor-usaa10-husk-name = A-10 Thunderbolt
actor-usamoabplane-husk-empty-name = Stealth Bomber
actor-usamoabplane-husk-loaded-name = Stealth Bomber
actor-vechiclechinook-husk-name = Halo
actor-usalasercrusader-husk-name = Husk (Laser Crusader)
actor-supplychinook-husk-name = Chinook
actor-tvult-husk-name = Husk (Vulture)
actor-tstank-husk-name = Husk (Siege Tank)
actor-tstank-deployed-husk-name = Husk (Siege Tank)
actor-tgoliath-husk-name = Husk (Goliath)
actor-tdropship-husk-name = Dropship
actor-twraith-husk-name = Wraith
actor-tvalk-husk-name = Valkyrie
actor-tbattle-husk-name = Battlecruiser
actor-tbattle-groundhusk-name = Husk (Battlecruiser)
actor-thyperion-husk-name = Hyperion
actor-thyperion-groundhusk-name = Husk (Hyperion)
actor-chinabattlemaster-husk-name = Husk (Battlemaster Tank)
actor-chinadragontank-husk-name = Husk (Dragon Tank)
actor-chinaecmtank-husk-name = Husk (ECM Tank)
actor-chinaoverlord-husk-name = Husk (Overlord Tank)
actor-chinaemperor-husk-name = Husk (Emperor Overlord Tank)
actor-chinanukemig-husk-empty-name = Nuke Mig
actor-chinanukemig-husk-loaded-name = Nuke Mig
actor-chinahelix-husk-name = Helix
actor-chinamig-husk-name = Mig
actor-usacrusader-husk-name = Husk (Crusader)
actor-usapaladin-husk-name = Husk (Paladin)
actor-usamicrowave-husk-name = Husk (Microwave Tank)
actor-usasupplydropplane-husk-empty-name = Supply Drop Plane
actor-usasupplydropplane-husk-loaded-name = Supply Drop Plane
actor-avfrigate-husk-name = Illuminate Frigate
actor-avbomber-husk-name = Illuminate Bomber
actor-avcarrier-husk-name = Illuminate Warpship Carrier
actor-avcarrier-groundhusk-name = Husk (Carrier)
actor-av1tnk-husk-name = Husk (Predator Tank)

## japan_air.yaml
actor-japanchoppervx =
   .description = The Helix helicopter provided China with a highly flexible airborne platform. Armed with a gatling gun & napalm bombs.
   .name = Chopper VX

actor-japanjettengu =
   .description = The MiG is armed with two napalm missiles that could be used effectively against ground targets.
   .name = Jet Tengu

actor-japankitsune =
   .description = Multi-role fighter plane.
    Can deflect enemy missiles with lasers.
   .name = Kitsune

actor-japanyousei =
   .description = Fast fighter plane.
    Can not be damaged while attacking.
    Slows down and becomes vulnerable after attacking.
   .name = Yousei

actor-japankaminari =
   .description = Fast fighter plane.
    Can not be damaged while attacking.
    Slows down and becomes vulnerable after attacking.
   .name = Kaminari

actor-japanballoonsentryflying-name = Balloon Sentry
actor-japanfinalsquadron-name = Final Squadron
actor-japanfinalsquadron-husk-name = Final Squadron

actor-japanskyempress =
   .description = [EPIC]
    Sky Empress armed
    with devastating plasma cannon.
      Strong vs Ground
      Weak vs Air
   .name = Sky Empress

actor-japanskyempress-husk-name = Sky Empress

## japan_inf.yaml
actor-japanimperialwarrior =
   .description = Japan Imperial Warrior, equipped with basic machine gun.
    Speed: 62
      Strong vs Infantry
      Weak vs Vehicles
   .name = Imperial Warrior

actor-japantankbuster =
   .description = Armed with a plasma launcher.
    Speed: 62
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Tank Buster

actor-japanrocketangel =
   .name = Rocket Angel
   .description = Airborne angel. Can fly to go over difficult terrain, armed with a plasma rocket barrage.
    Speed: 71
      Strong vs Infantry, Vehicles
      Weak vs Aircraft

actor-japanarchermaiden =
   .description = Archer Maiden. Armed with a bow, can be upgraded to shot explosive arrows.
      Strong vs Infantry, Aircraft
     Weak vs Vehicles
   .name = Archer Maiden

actor-japanwarhorse =
   .description = Archer Maiden riding horse. Armed with a bow, can be upgraded to shot explosive arrows.
      Strong vs Infantry, Aircraft
     Weak vs Vehicles
   .name = Warhorse

actor-japanshinobi =
   .description = Shinobi, stealth unit.
     Strong vs Infantry, Aircraft
     Weak vs Vehicles
   .name = Shinobi

actor-japanbioengineer =
   .description = The Science Team! Can heal infantry and defend themself with a pistol.
   .name = Bio Engineer

actor-japanmutant =
   .description = Cybernetic infantry unit with a
    twin plasma cannon.
      Strong vs Infantry, Light armor
      Weak vs Vehicles, Aircraft
   .name = Titan

actor-japanmatsui =
   .description = Yandere anime girl that shots fuckin lasers.
   .name = Matsui Yuriko

actor-japanonmyodo =
   .description = Provides an armor buff to nearby friendly infantry. Also curses an enemy infantry unit, who will explode into a spirit wolf when killed.
   .name = Onmyodo

actor-japaninugami-name = Inugami

## japan_shp.yaml
actor-japankappa =
   .description = Fast scout boat, armed with plasma gattling gun.
   .name = Kappa Boat

actor-japannaginata =
   .description = Very slow long-range ship. Armed with a plasma rocket barrage.
      Strong vs Buildings, Ground units
      Weak vs Naval units, Aircraft
   .name = Naginata Cruiser

actor-japanshogun =
   .description = Long range battleship. Armed with long range plasma cruiser missiles.
   .name = Shogun Battleship

actor-japanhovercraft =
   .description = Amphibious transport.
    Can carry infantry and tanks.
      Unarmed
   .name = Genbu Hovercraft

## japan_str.yaml
actor-japanantimatterreactor =
   .description = Provides power for other structures.
    Can be deployed to sacrifice itself to provide unlimited power for 30 seconds.
   .name = Antimatter Reactor

actor-japanantimatterreactornavy =
   .description = Provides power for other structures. Can be built on water.
    Can be deployed to sacrifice itself to provide unlimited power for 30 seconds.
   .name = Antimatter Reactor (Navy Edition)

actor-japansupplycenter =
   .description = Refines Ore and Gems
    into credits.
   .name = Supply Center
   .infiltrateforcash-infiltrated-text-notification = Credits stolen.

actor-japansupplycenternavy =
   .description = Refines Ore and Gems. Can be built on water. Provides an amphibious harvester.
    into credits.
   .name = Supply Center (Navy Edition)
   .infiltrateforcash-infiltrated-text-notification = Credits stolen.

actor-japanbarracks =
   .description = Trains infantry.
   .name = Barracks

actor-japanmechabay =
   .description = Produces mechas and tanks.
   .name = Mecha Bay

actor-japanairfield =
   .description = Produces and reloads aircraft.
   .name = Japan Airfield

actor-japanairfield =
   .description = Produces and reloads aircraft. Can be built on water.
   .name = Japan Airfield (Navy Edition)

actor-japanshipyard =
   .description = Produces and repairs
    ships and transports.
   .name = Imperial Dock
   .repairsunits-start-repairing-text-notification = Repairing.
   .repairsunits-finish-repairing-text-notification = Unit repaired.

actor-japanmainframe =
   .description = Provides Japan advanced technologies.
      Special Ability: Clairvoyance
      Special Ability: Tenshi Drop
      Special Ability: Mecha Drop (Mecha General)
   .name = Mainframe

actor-japanmainframenavy =
   .description = Provides Japan advanced technologies. Can be built on water.
      Special Ability: Clairvoyance
      Special Ability: Tenshi Drop
   .name = Mainframe (Navy Edition)

actor-japan-bomber-name = Stealth Bomber

actor-japanpsychicdatacenter =
   .description = Provides Japan psychic advanced technologies.
      Special Ability: Curse (Enhanced version if Economic)
      Special Ability: Berserker (Economic General)
      Special Ability: Final Squadron
      Special Ability: Warp Portal
      Special Ability: Drone Swarm (Mecha General)
   .name = Psychic Data Center

actor-japanpsychicdatacenternavy =
   .description = Provides Japan psychic advanced technologies. Can be built on water.
      Special Ability: Curse (Enhanced version if Economic)
      Special Ability: Berserker (Economic General)
      Special Ability: Final Squadron
      Special Ability: Warp Portal
      Special Ability: Drone Swarm (Mecha General)
   .name = Psychic Data Center (Navy Edition)

actor-japanwarpportalred =
   .description = it warps things
   .name = Spacewarp

actor-japan-bomber-divine-name = Stealth Bomber

actor-japanlaserbase =
   .description = Firebase defense structure. Long ranged laser.
   .name = Laserbase

actor-japanlaserbasenavy =
   .description = Firebase defense structure. Long ranged laser. Can be built on water. Does not provide bunkers if build on water.
   .name = Laserbase (Navy Edition)

actor-japandecimator =
   .name = Psionic Decimator
   .description = Provides the Psionic Decimator support power.

actor-japandecimatornavy =
   .name = Psionic Decimator (Navy Edition)
   .description = Provides the Psionic Decimator support power. Can be built on water.

actor-japanmindcontrol =
   .name = Mind Control Tower
   .description = Mind controls nearby units. Consumes lots of power.

actor-japanmindcontrolnavy =
   .name = Mind Control Tower (Navy Edition)
   .description = Mind controls nearby units. Consumes lots of power. Can be built on water.

actor-japantransformerbase =
   .name = Transformer Base
   .description = Static defense with a fireport for a garrisoned vehicles.
    Can hold 2 vehicles.

actor-japanballoon =
   .description = Strong defense structure.
    Can detect cloaked units.
      Strong vs All
   .name = Balloon Sentry

actor-japanoredrill =
   .description = Generates an ore field.
   .name = Ore Drill

actor-japanwaveforceturret =
   .description = Anti-Infantry and Air base defense.
    Can detect cloaked units.
      Strong vs Infantry, Aircraft
      Weak vs Vehicles
   .name = Waveforce Turret

actor-japanberserktower =
   .description = Sends nearby enemies into a berserk state. Consumes lots of power.
   .name = Berserker Tower

actor-japanhyperantimatterreactor =
   .description = Advanced Powerplant.
    Can be deployed to sacrifice itself to provide unlimited power for 30 seconds.
   .name = Hyper Antimatter Reactor

actor-japanhyperantimatterreactornavy =
   .description = Advanced Powerplant. Can be built on water.
    Can be deployed to sacrifice itself to provide unlimited power for 30 seconds.
   .name = Hyper Antimatter Reactor (Navy Edition)

## japan_upg.yaml
actor-upgrade-upgradedualtankbarrels =
   .name = Dual Tank Barrels
   .description = Upgrade Tsunami tanks to have dual barrels.

actor-upgrade-basemedkits =
   .name = Laserbase Medkits
   .description = Upgrade Laserbases with medkits to heal neaby infantry.

actor-upgrade-remoteassembly =
   .name = Remote Assembly
   .description = Allows Mecha Tengu & Striker VX to be made on airfield queue & assembly of Tsunami Tank, Sudden Transport, Mecha Tengu & Striker VX on Docks

actor-upgrade-focusedlasers =
   .name = Focused Lasers
   .description = Upgrades weapons for Laser Base, Hiroshima Artillery, Dominatrix and Tantou.

actor-upgrade-cyrostream =
   .name = Cyro-Stream Rockets
   .description = Upgrades weapons for Rocket Angels, Striker VX & Naginata Cruiser to freezing rockets that reduce movement speed.

actor-upgrade-explosivearrows =
   .name = Explosive Arrows
   .description = Upgrades arrows for all archers.

actor-upgrade-superheatedplasma =
   .name = Super-Heated Plasma
   .description = Upgrades weapons for Tankbuster, Raiju, Executioner, Balloon Sentry and Shogun Battleship

actor-upgrade-baseshields =
   .name = Shields
   .description = Adds shields to structures.

actor-upgrade-dnaresearch =
   .name = DNA Research
   .description = Research advanced DNA. Unlocking extra units and upgrades.

actor-upgrade-nanomachines =
   .name = DNA Nanomachines
   .description = DNA Nanomachines into your infantry to allow them to generate a shield.

actor-upgrade-dnastamina =
   .name = DNA Stamina
   .description = DNA Stamina increases vision, range, damage, firerate and movement speed of all infantry.

actor-upgrade-dnacloning =
   .name = DNA Cloning
   .description = Decrease infantry cost and allow faster production.

actor-upgrade-shikyo =
   .name = Shikyo
   .description = When mecha are below 30% health, will now disable all safety functions.
   Gaining speed, attack speed, increased damage, reduced damage, but will take damage until killed.

## japan_veh.yaml
actor-japansuddentransport =
   .description = Stealth APC
   .name = Sudden Transport

actor-japantsunamitank =
   .description = Tsunami Tank. Armed with a plasma cannon.
      Strong vs Vehicles
      Weak vs Aircraft
   .name = Tsunami Tank

actor-japanmechatransformer =
   .description = Light Mecha that can change its weapon depending on what unit is piloting it.
    Speed: 99
      Strong vs Infantry, Light armor
      Weak vs Vehicles, Aircraft
   .name = Mecha Transformer

actor-japantsukumogami =
   .description = Light Mecha with dual plasma cannons.
    Speed: 99
      Strong vs Vehicles, Buildings
      Weak vs Infantry, Aircraft
   .name = Tsukumogami

actor-japanmecharaijuu =
   .description = Anti-tank walker. Dual wielding plasma cannons.
    Speed: 99
      Strong vs Vehicles, Buildings
      Weak vs Infantry, Aircraft
   .name = Mecha Raijuu

actor-japanstrikervx =
   .description = Anti-personnel walker. Armed with a plasma gatling cannon.
    Speed: 99
      Strong vs Infantry, Aircraft
      Weak vs Vehicles, Buildings
   .name = Striker VX

actor-japanmechatengu =
   .description = Anti-tank walker. Armed with a dual plasma rocket barrage. Strong on groups of light units.
    Speed: 99
      Weak vs Vehicles, 
      Strong vs Infantry, Light armor, Aircraft
      Weak vs Vehicles
   .name = Mecha Tengu

actor-japanhiroshimawaveforce =
   .description = Tsunami Tank. Equipped with a Waveforce Cannon that can be deployed to adapt to enemy forces.
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Hiroshima Waveforce

actor-japandatenshi =
   .description = Datenshi tank. Long range anti-air unit.
      Strong vs Aircraft
   .name = Datenshi

actor-japanexecutioner =
   .description = Anti-personnel walker. Melee unit that turns invisible after striking.
    Speed: 99
      Strong vs Infantry, Light armor
      Weak vs Vehicles, Aircraft
   .name = Executioner

actor-japandominatrix =
   .description = Anti-personnel walker. Long range debuffer.
    Speed: 99
      Strong vs Infantry, Light armor
      Weak vs Vehicles, Aircraft
   .name = Dominatrix

actor-japankomatsu =
   .description = Support vehicle.
     Can be used to increase the range and fire rate of friendly vehicles and defence structures.
   .name = Komatsu

actor-japanshishiron =
   .description = Support vehicle.
    Can be used to increase movement speed and money generation for friendly units.
    Recommended to use on harvesters.
   .name = Shishiron

actor-japanakuma =
   .description = [EPIC]
    Akuma is a long ranged artillery debuffer.
    Has to be deployed to fire, it will weaken any units caught in the blast
    and randomly cause some units to go berserk or become under your control.
   .name = Akuma

actor-japankingoni =
   .description = King Oni is a well rounded mech capable of fighting all forms of enemies, at the expense of defence.
      Dual-wielding Waveforce Cannons and Anti-air Datenshi Arrow.
      Strong vs Vehicles, Infantry, Aircraft
   .name = King Oni

actor-japankusogaki =
   .description = Plasma barrage artillery walker.
    Speed: 120
      Strong vs Infantry, Buildings
      Weak vs Aircraft, Vehicles
   .name = Kusogaki

actor-japankuruttaneko =
   .description = Heavy mecha equipped with a dual rocket barrage salvo and dual plasma cannons.
    Speed: 120
      Strong vs Infantry, Buildings
      Weak vs Aircraft, Vehicles
   .name = Kurutta Neko

actor-japanhakaimono =
   .description = [EPIC]
    Hakaimono is a fully equipped Super Mecha.
    Armed with a plasma gattling gun, anti matter missiles & laser barrage. The Ultimate Mecha.
   .name = Hakaimono

actor-japanmechanic =
   .description = Repair unit for infantry and vehicles.
   .name = Mechanic

actor-japanswarmdrone =
   .description = Fast moving suicide drone.
   .name = Swarm Drone

## medi_str.yaml
actor-meditent =
   .description = Allows production of infantry units.
   .name = Medieval Barracks

actor-laborcamp =
   .description = Allows production of Slaves and Workers
   .name = Labor Camp

actor-stables =
   .description = Allows production of horse based,
     Mechanical & Elemental units.
   .name = Medieval Stables

actor-dockmedi =
   .description = Produces and repairs
    ships and transports.
   .name = Dockyard

actor-aviary =
   .description = Allows production of air units.
   .name = Aviary

actor-farmmedi =
   .description = Drop off point for resources gathered by Slaves and Workers.
    Also acts as a Silo to allow more credits to be held.
   .name = Farm

## medi_upg.yaml
actor-upgrade-mediarrowt1 =
   .name = Archer Defence
   .description = Upgrades your Arrow Towers with another Archer

actor-upgrade-mediarrowt2 =
   .name = Tower Upgrade (Healer)
   .description = Unlocks plug to upgrade Archer towers with Healer

actor-upgrade-mediarrowt3 =
   .name = Tower Upgrade (Mage)
   .description = Unlocks plug to upgrade Archer towers with a Mage

actor-upgrade-mediarrowt4 =
   .name = Tower Upgrade (Musket)
   .description = Unlocks plug to upgrade Archer towers with a Musketeer

actor-upgrade-mediworkboot =
   .name = Worker boots
   .description = Upgrades your workers and slaves with boots, safe to walk on Tiberium

actor-upgrade-medimagicwep =
   .name = Magic Weapons
   .description = Enchant your weapons for bonus damage to vehicles

actor-upgrade-medimagiclogs =
   .name = Magic Logs
   .description = Enchant your Buildings for bonus Shields

actor-upgrade-medibless =
   .name = Holy Blessing
   .description = Protect your units from stealth, see invisable from further away

actor-upgrade-medishield =
   .name = Holy Shield
   .description = Protect your units with a holy shield at low HP

actor-upgrade-mediabolish =
   .name = Abolish Slavery
   .description = Can no longer build slaves, cheaper workers, faster workers.

actor-upgrade-medipure =
   .name = Pure Magic
   .description = Boosts Magic Damage

actor-upgrade-medimagearm =
   .name = Mage Armor
   .description = Provides a shield for Magic units

actor-upgrade-mediwiztow =
   .name = Wizard Towers
   .description = Cheaper Arcane Towers, Can Garrison Mages.

actor-upgrade-medidarkwep =
   .name = Corrupt Weapons
   .description = Dark Magic grants your units Lifesteal.

actor-upgrade-medirituals =
   .name = Advanced Rituals
   .description = Your Accolites spawn in pairs.

actor-upgrade-medinecro =
   .name = Necromancy
   .description = Enhance your Zombies and spawn gouls on death of units.

## misc.yaml
actor-camera-name = (reveals area to owner)
actor-camera-small-name = (reveals small area to owner)
actor-tmonolith-name = Tiberium Monolith

## nazi_air.yaml
actor-bf109 =
   .description = Attack Plane armed with
    dual machine guns.
    Speed: 178
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft
   .name = Messerschmitt Bf 109

actor-bf109-husk-name = Bf 109

actor-do17 =
   .description = Bomber with a devastating payload.
    Speed: 256
      Strong vs Ground units, Structures
      Weak vs Aircraft
   .name = Dornier Do 17 Bomber

actor-do17-shd-name = Do 17 Stealth Bomber
actor-do17-husk-name = Do 17
actor-do17-bomber-name = Do 17 Bomber

## nazi_inf.yaml
actor-nbos1 =
   .description = Heavily armoured super soldier.
    Can attack air.
    Speed: 52
      Strong vs Infantry
      Weak vs Vehicles
   .name = Supersoldier

actor-nbos2 =
   .description = Hovering Hitler decoy with a flamethrower.
    Can travel over water and cliffs, good for scouting.
    Speed: 72
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = False Hitler

actor-nbos3 =
   .description = Elite infantry with a rocket pistol.
    Speed: 72
      Strong vs Infantry, light vehicles
      Weak vs Aircraft
   .name = Commander

actor-nbos4 =
   .description = Elite super soldier, heavily armoured.
    Special ability: Squad boost. Demoralise enemy troops.
    Speed: 42
      Strong vs Everything
      Weak vs Nothing
   .name = Death Knight

actor-nbos6 =
   .description = The Fuhrer in super mecha armour.
    Hitler ejects on death to fight more.
    Speed: 60
      Strong vs Everything
      Weak vs Nothing
   .name = Hitler

actor-nbos7 =
   .description = The Fuhrer fights on the frontlines.
    Speed: 76
      Strong vs Infantry, Light Vehicles
      Weak vs Nothing
   .name = Hitler

actor-spy-shd =
   .description = Steals enemy credits.
    Hijacks enemy vehicles.
    Unarmed.
    Can detect cloaked units and spies.
    Speed: 80
    
    Special Ability: Cloaked
   .name = Super Hijacker

## nazi_str.yaml
actor-ttr-fuel =
   .name = Improved Fuel Chemistry
   .description = Increases damage and range of flame weapons by 20%.

actor-ttr-fanatic =
   .name = Fanaticism
   .description = Enables Fanaticism support power. 
    
    Increases all stats by 20% for 30 seconds.

actor-nhand =
   .description = Trains infantry.
   .name = Hand of Hitler

actor-atek-nz =
   .description = Provides Third Reich uber technologies.
   .name = Reich Tech Center

actor-dgun-nz-name = Double Turret

## nazi_veh.yaml
actor-mtnkd-shd =
   .description = Reich's Secondary Battle Tank.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Reich Medium Tank

actor-2tnk-nz =
   .description = Slow, lightly armoured tank destroyer.
    Must get close to attack.
    Speed: 48
      Strong vs Vehicles
      Weak vs Aircraft
   .name = Tank Destroyer

actor-3tnk-nz =
   .description = Reich's Main Battle Tank, with dual cannons
    Speed: 71
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Reich Heavy Tank

actor-seige =
   .name = Reich Siege Tank
   .deployed--name = Reich Siege Tank (deployed)
   .description = Reich's deployable artillery tank.
    Speed: 50
      Strong vs Vehicles, Infantry
      Weak vs Aircraft

actor-arty-ss =
   .description = Long-range fire artillery.
    Speed: 85
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
   .name = Inferno Artillery

actor-maus =
   .description = Super heavy tank with supreme firepower.
    Cannot attack air. Explodes violently.
     on death.
      Strong vs Everything
      Weak vs Aircraft
    Maximum of 2 can be built.
   .name = Panzer VIII Maus

## nod_air.yaml
actor-scrin =
   .description = Scrin-tech aircraft
    with Air to ground plasma guns.
    Speed: 256
      Strong vs Tanks
      Weak vs Infantry, Aircraft
   .name = Banshee

actor-scrin-husk-name = Banshee

actor-a10-n3 =
   .description = Bomber with a gaseous tiberium payload.
    Causes armour debuff.
    Speed: 224
      Strong vs Infantry, structures
      Weak vs Aircraft
   .name = A-10 Chemduster

actor-venom =
   .description = VTOL gunship armed
    with anti-ground lasers.
    Speed: 149
      Strong vs Light Vehicles, Infantry
      Weak vs Aircraft, Tanks
   .name = Venom

actor-venom-husk-name = Venom

actor-hunter =
   .name = Hunter-Seeker Droid
   .actorlostnotification-text-notification = Hunter-Seeker target destroyed.

## nod_inf.yaml
actor-e5 =
   .description = Advanced anti-material unit.
    Causes armour debuff.
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
   .name = Chem Warrior

actor-sbh =
   .description = Cloaked infantry. Armed with
    laser rifle.
      Strong vs Infantry, Light Vehicles
      Weak vs Heavy Armor, Aircraft
   .name = Black Hand

actor-tscyb =
   .description = Cybernetic infantry unit with a
    machine gun and rocket launcher.
      Strong vs Infantry, Light armor
      Weak vs Vehicles, Aircraft
   .name = Cyborg

actor-tscybcom =
   .description = [EPIC]
    Cybernetic commando unit.
      Strong vs Everything
      Weak vs Aircraft
   .name = Cyborg Commando

## nod_str.yaml
actor-nod-tiberium =
   .name = Research Tiberium Processing
   .description = Increases yield of reprocessing minerals and
     tiberium by 10%

actor-nod-fanatic =
   .name = Fanaticize Forces
   .description = Increases attack speed by 10%. 
    
    In the name of Kane.

actor-handd =
   .description = Trains infantry.
   .name = Hand of Nod

actor-afldd =
   .description = Delivers vehicles.
   .name = Airstrip

actor-stek-nod =
   .description = Provides Nod transcendant technologies.
   .name = Nod Tech Center

actor-tmpld =
   .description = Provides GPS and atomic bomb.
    Requires power to operate.
   .name = Temple of Nod

actor-samd =
   .name = SAM Site
   .description = Anti-Air base defense.
    Requires power to operate.
      Strong vs Aircraft
      Weak vs Ground units

actor-oblid =
   .description = Advanced base defense.
    Requires power to operate.
    Can detect cloaked units.
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Obelisk of Light

actor-pdox-bhand =
   .description = Creates a cloaking field for all nearby/n units and structures.
    
    Requires power.
   .name = Stealth Generator

actor-cbomb-name = Catalyst Bomb

## nod_veh.yaml
actor-1tnk-n =
   .description = Fast tank, good for scouting.
    Speed: 98
      Strong vs Light armor
      Weak vs Infantry, Tanks, Aircraft
   .name = Nod Light Tank
   .generic-name = Tank

actor-bggyd =
   .description = Fast scout & anti-infantry vehicle.
    Speed: 170
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Nod Buggy

actor-bike =
   .description = Fast scout vehicle, armed with rockets.
    Can attack Aircraft.
    Speed: 213
      Strong vs Vehicles, Tanks
      Weak vs Infantry
   .name = Recon Bike

actor-stnkd =
   .description = Long-range missile tank that can cloak.
    Can attack Aircraft.
    Has weak armor
    Speed: 142. Can be spotted by infantry and defense structures.
      Strong vs Vehicles, Tanks
      Weak vs Infantry.
   .name = Stealth Tank

actor-ftnkd =
   .name = Flame Tank
   .description = Heavily armored flame-throwing vehicle.
    Speed: 98
      Strong vs Infantry, Buildings, Light vehicles
      Weak vs Tanks

actor-ftnkd-n3 =
   .name = Chem Tank
   .description = Heavily armored tiberium-spray vehicle.
    Causes armour debuff.
    Speed: 98
      Strong vs Infantry, Buildings, Light vehicles
      Weak vs Tanks

actor-ctnk-bhand =
   .description = Provides stealth to nearby friendly units
     and structures.
    Requires power.
    Speed: 75
    Can detect cloaked units.
      Unarmed
   .name = Mobile Stealth Generator

actor-scorpion =
   .description = Long-range Obelisk-armed mech walker.
      Strong vs Ground units
      Weak vs Air
   .name = Scorpion

actor-novan =
   .description = [EPIC]
    Advanced mech walker armed with anti-infantry flamer,
     Obelisk and 120mm cannons.
    High damage and speed for less health than
     other epic units.
    Speed: 72
    
      Strong vs Everything
      Weak vs Nothing
   .name = Epic Purifier

actor-novan-m =
   .description = Mech walker armed with anti-infantry flamer,
     and dual cannon.
    Speed: 72
    
      Strong vs Everything
      Weak vs Aircraft
   .name = Purifier

## player.yaml
actor-player =
   .providestechprerequisite-noepic-name = Advanced Tech
   .providestechprerequisite-unrestricted-name = Epic Tech
   .providestechprerequisite-boss-name = Boss Mode
   .lobbyprerequisitecheckbox-noboats-label = No Boats
   .lobbyprerequisitecheckbox-noboats-description = Check to disable boats.
   .lobbyprerequisitecheckbox-bridges-label = Indestructible Bridges
   .lobbyprerequisitecheckbox-bridges-description = Check to disable bridge destruction.
   .lobbyprerequisitecheckbox-weather-label = Weather (Incomplete)
   .lobbyprerequisitecheckbox-weather-description = This is incomplete and just enables a permanent lightning storm.
   .lobbyprerequisitecheckbox-daynight-label = Day/Night Cycle
   .lobbyprerequisitecheckbox-daynight-description = Enable day/night cycle.
   .lobbyprerequisitecheckbox-noupg-label = No Upgrades
   .lobbyprerequisitecheckbox-noupg-description = Check to disable generalised upgrades. Faction upgrades will remain.
   .lobbyprerequisitecheckbox-gems-label = Gems Everywhere
   .lobbyprerequisitecheckbox-gems-description = Check to replace Ore mines with Gem mines.
   .lobbyprerequisitecheckbox-techbuildings-label = Perm Tech Buildings
   .lobbyprerequisitecheckbox-techbuildings-description = Check to allow Tech Buidings to respawn.
   .lobbyprerequisitecheckbox-notib-label = No Tiberium
   .lobbyprerequisitecheckbox-notib-description = This displeases Kane.
   .lobbyprerequisitecheckbox-concrete-label = Concrete
   .lobbyprerequisitecheckbox-concrete-description = Construction Yards will be placed on concrete.
   .lobbyprerequisitecheckbox-herotest-label = Heroes
   .lobbyprerequisitecheckbox-herotest-description = Enables all factions to train the Jim Raynor hero.
   .lobbyprerequisitecheckbox-badcrates-label = Bad Crates
   .lobbyprerequisitecheckbox-badcrates-description = Enable the bad crates.

## prereqdefs.yaml
actor-barracks =
   .name = Infantry Production
   .description = Infantry Production

actor-techcenter =
   .name = Tech Center
   .description = Tech Center

actor-advtechcenter =
   .name = Adv. Tech Center
   .description = Adv. Tech Center

actor-ulttechcenter =
   .name = Super Tech Center
   .description = Super Tech Center

actor-anypower =
   .name = Power Plant
   .description = Power Plant

actor-factory =
   .name = Vehicle Factory
   .description = Vehicle Factory

actor-refinery =
   .name = Refinery
   .description = Refinery

actor-radar =
   .name = Radar Provider
   .description = Radar Provider

actor-shippen =
   .name = Naval Production
   .description = Naval Production

actor-conyard =
   .name = Construction Yard
   .description = Construction Yard

actor-superweapon =
   .name = Superweapon
   .description = Superweapon

## protoss_air.yaml
actor-pobserver =
   .description = Unarmed stealthed scout.
     Detects cloaked units.
    Speed: 88
   .name = Observer

actor-pshuttle =
   .description = Protoss transport ship.
    Speed: 136
      Unarmed
   .name = Shuttle

actor-pscout =
   .description = Protoss gunship armed
    with Anti-matter missiles and 
     photon blasters.
    Speed: 128
      Strong vs Infantry, Aircraft
      Weak vs Vehicles, Buildings
   .name = Scout

actor-parbiter =
   .description = Protoss support ship with
    with area cloak.
    Speed: 112
      Strong vs Infantry, Aircraft
      Weak vs Vehicles, Buildings
   .name = Arbiter

actor-pcorsair =
   .description = Protoss gunship armed
    with anti-air Neutron flares and 
     ground unit disruptors.
    Speed: 144
      Strong vs Aircraft, Vehicles
      Weak vs Infantry
   .name = Corsair

actor-pvoidray =
   .description = Protoss artillery ship armed
    with long range laser beam.
    Speed: 88
      Strong vs Aircraft, Vehicles
      Weak vs Infantry
   .name = Void Ray

actor-pcarry =
   .description = Protoss gunship armed
    with Anti-matter missiles and 
     photon blasters.
    Speed: 48
      Strong vs Everything
   .name = Carrier

actor-pinter =
   .description = Small drone figther 
    with photon blasters.
    Speed: 200
      Strong vs Everything
   .name = Interceptor

actor-pmother =
   .description = [EPIC]
    Protoss epic support ship with
    with area cloak and lasers.
    Can teleport on deploy.
    Speed: 24
      Strong vs Everything
   .name = Protoss Mothership

## protoss_inf.yaml
actor-pprobe =
   .description = Collects Ore, Gems and Tiberium for processing.
    Speed: 96
      Unarmed
   .name = Probe
   .generic-name = Harvester

actor-pprobe-eng-description = Captures stuff for the AI.

actor-pzealot =
   .description = Fanatical melee infantry.
    Speed: 80
      Strong vs infantry
   .name = Zealot

actor-ptemplar =
   .description = Psi empowered ranged support.
     Can merge with another into a 
     powerful Archon.
    Speed: 72
      Strong vs ground units
   .name = High Templar

actor-parchon =
   .description = Powerful being of 2 merged High Templar
     The ultimate sacrifice.
    Speed: 88
      Strong vs everything
   .name = Archon

actor-pdtemplar =
   .description = Stealth assassin.
    Speed: 96
      Strong vs ground units
   .name = Dark Templar

actor-pdarchon =
   .description = Powerful being of 2 merged Dark Templar
     The ultimate sacrifice.
    Speed: 88
      Mind control ability
   .name = Dark Archon

actor-pzeratul =
   .description = [EPIC]
   Stealth assassin. Boosts fellow ground units.
    Speed: 96
      Strong vs ground units
   .name = Zeratul

## protoss_str.yaml
actor-protoss-dragoon =
   .name = Research Singularity Charge
   .description = Increases attack range of Dragoons/Stalkers,
      Arbiters and Photon Cannons.

actor-protoss-shields =
   .name = Research Improved Shielding
   .description = Increases shield regeneration and armor 
    across all Protoss units and structures.

actor-protoss-shadows =
   .name = Research Veil of Shadows
   .description = Increases shield regeneration rate by 100%
    when near Dark Pylons.

actor-pnexus =
   .description = Produces structures.
   .name = Nexus

meta-warpstructure-name = Warp

actor-pgatew-warp =
   .description = Trains infantry.
   .name = Warp (Gateway)

actor-pgatew-name = Gateway

actor-ppylon-warp =
   .description = Provides power and build area for Protoss structures.
   .name = Warp (Pylon)

actor-ppylon-name = Pylon
actor-ppylon-dark = Dark Pylon

actor-passim-warp =
   .description = Refines resources
    into credits.
   .name = Warp (Assimilator)

actor-passim-name = Assimilator

actor-pcyber-warp =
   .description = Provides access to Dragoon,
     defense structures.
   .name = Warp (Cybernetics Core)

actor-pcyber-name = Cybernetics Core

actor-pphoto-warp =
   .description = Anti-air and anti-ground defense.
   .name = Warp (Photon Cannon)

actor-pphoto-name = Photon Cannon

actor-pobser-warp =
   .description = Provides an overview
    of the battlefield.
    Requires power to operate.
   .name = Warp (Observatory)

actor-pobser-name = Observatory

actor-psupor-warp =
   .description = Autonomous building construction. 
    Increases build speed of Structures and
    Defense by 1 stage (max 10).
   .name = Warp (Foundry)

actor-psupor-name = Protoss Foundry

actor-padun-warp =
   .description = Provides Protoss advanced technologies. 
    Increases Zealot move speed.
   .name = Warp (Citadel of Adun)

actor-padun-name = Citadel of Adun

actor-ptempl-warp =
   .description = Provides extra advanced technologies and
     upgrades to your forces.
      Special Ability: Steady income
      Superweapon: Orbital Beam Cannon
   .name = Warp (Templar Archives)

actor-ptempl-name = Templar Archives
actor-ptempl-req-name = Limited

actor-probot-warp =
   .description = Produces vehicles.
   .name = Warp (Robotics Facility)

actor-probot-name = Robotics Facility

actor-psbatt-warp =
   .description = Heals nearby friendly units and buildings.
   .name = Warp (Shield Battery)

actor-psbatt-name = Shield Battery

actor-pstarg-warp =
   .description = Produces aircraft.
   .name = Warp (Stargate)

actor-pstarg-name = Stargate

actor-pfleet-warp =
   .description = Provides access to your faction's epic unit or ability.
    
      Special Ability: Provides money
     Limit of one.
   .name = Warp (Fleet Beacon)

actor-pfleet =
   .name = Fleet Beacon
   .chronoshiftpower-advancedchronoshift-select-target-text-notification = Select target.
   .chronoshiftpower-advancedchronoshift-insufficient-power-text-notification = Insufficient power.
   .chronoshiftpower-advancedchronoshift-begin-charge-text-notification = Chronosphere charging.
   .chronoshiftpower-advancedchronoshift-end-charge-text-notification = Chronosphere ready.

actor-pfleet-req-name = Limited

actor-pzealot-warp =
   .name = Warp in Zealot

actor-pdrago-warp =
   .name = Warp in Dragoon

## protoss_veh.yaml
actor-pdrago =
   .description = Cybernetic ranged unit.
    Speed: 88
      Strong vs vehicles, aircraft
   .name = Dragoon

actor-preaver =
   .description = Slow seige unit.
    Speed: 42
      Strong vs Ground units
   .name = Reaver

actor-pfenix =
   .description = [EPIC]
   Cybernetic ranged unit.
    Speed: 108
      Strong vs everything
   .name = Fenix

actor-pstalker =
   .description = Cybernetic ranged unit.
    Can teleport a short distance.
    Slightly more damage vs infantry than Dragoons
    Speed: 96
      Strong vs vehicles, aircraft
   .name = Stalker

## shared_air.yaml
actor-heli-description = Helicopter gunship armed
    with multi-purpose missiles.
    Speed: 149
      Strong vs Buildings, Vehicles, Aircraft
      Weak vs Infantry
actor-mh60-description = Helicopter gunship armed
    with dual chainguns.
    Speed: 112
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft
actor-tran-description = Fast Infantry Transport Helicopter.
    Speed: 128
      Unarmed
actor-c17-name = C17
actor-a10-bomber-name = A-10 Thunderbolt
actor-avbomber-bomber-name = Illuminate Bomber

## shared_inf.yaml
actor-e1of =
   .description = Squad leader, boosts nearby troops'
    speed and firepower.
    Speed: 62
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Officer

actor-tsengi-o =
   .description = Deploys an outpost for further 
    base expansion.
    Also behaves as normal engineer.
      Unarmed
   .name = Surveyor

actor-c1-o-name = Retired Surveyor
actor-e1-tester-name = Testman
actor-e1god-name = Jesus

## shared_pwr.yaml
meta-powerplant-tooltipdescription-description = Upgraded

actor-powr =
   .description = Provides power for other structures.
   .name = Power Plant

actor-apwr =
   .description = Provides double the power of
    a standard Power Plant.
   .name = Advanced Power Plant

actor-xpwr =
   .description = Provides huge power, but very unstable.
    	Explodes violently.
   .name = Fission Power Plant

actor-dpwr =
   .description = Provides power for other structures.
   .name = Power Plant

actor-nuk2 =
   .description = Provides double the power of
    a standard Power Plant.
   .name = Advanced Power Plant

actor-pwrgen =
   .description = Briefly provides some backup power 
      when you have low power. 
      Unarmed
   .name = Backup Generator

actor-pwrgen-husk-name = Backup Generator (Dead)

actor-powr-up =
   .name = Boost Power Output
   .description = Place onto a friendly power plant/n to increase power output by 20%.

## shared_shp.yaml
actor-lst-description = General-purpose naval transport.
    Can carry infantry and tanks.
    Speed: 113
      Unarmed

actor-lst-e =
   .description = Submerged naval transport.
    Can carry infantry and tanks.
    Speed: 96
      Unarmed
   .name = Submersive Transport

actor-pt-description = Light scout & support ship.
    Can detect submarines.
    Speed: 128
      Strong vs Naval units
      Weak vs Ground units, Aircraft
actor-dd-description = Fast multi-role ship.
    Can detect submarines.
    Speed: 85
      Strong vs Naval units, Vehicles, Aircraft
      Weak vs Infantry
actor-ca-description = Very slow long-range ship.
    Speed: 42
      Strong vs Buildings, Ground units
      Weak vs Naval units, Aircraft
actor-ss-description = Submerged anti-ship unit
    armed with torpedoes.
    Can detect other submarines.\Speed: 71
      Strong vs Naval units
      Weak vs Ground units, Aircraft
      Special Ability: Submerge
actor-msub-description = Submerged anti-ground siege unit
    with anti-air capabilities.
    Can detect other submarines.
    Speed: 42
      Strong vs Buildings, Ground units, Aircraft
      Weak vs Naval units
      Special Ability: Submerge

actor-lstnew =
   .description = Amphibious transport.
    Can carry infantry and tanks.
      Unarmed
   .name = Hovercraft

actor-lst2 =
   .description = Lays mines to destroy
    unwary enemy ships and submarines.
    Can detect mines.
      Unarmed
   .name = Minelayer

## shared_str.yaml
actor-factd-name = Construction Yard

actor-foundry =
   .description = Autonomous building construction. 
    Increases build speed of Structures and
    Defense by 1 stage (max 10).
   .name = Foundry

actor-proc =
   .description = Refines Ore, Tiberium and Gems
    into credits.
   .name = Refinery

actor-silo-description = Stores excess refined
    Ore, Tiberium and Gems.
     Capacity: 2500

actor-procd =
   .description = Refines Ore, Tiberium and Gems
    into credits.
   .name = Refinery

actor-silod =
   .description = Stores excess refined
    Ore, Tiberium and Gems.
     Capacity: 3500
   .name = Silo

actor-barr-name = Barracks

actor-pyled =
   .description = Trains infantry.
   .name = Barracks

actor-weap =
   .description = Produces vehicles.
   .name = War Factory

actor-weapd =
   .description = Produces vehicles.
   .name = Weapons Factory

actor-dome =
   .description = Provides an overview
    of the battlefield.
    Requires power to operate.
   .name = Radar Dome

actor-hqd =
   .description = Provides an overview
    of the battlefield.
    Requires power to operate.
   .name = Communications Center

actor-hpad-description = Produces and reloads
    aircraft. 
    Can be placed in water.
actor-gtwr-name = Guard Tower
actor-outpost-name = Outpost

actor-advtech =
   .description = Provides extra advanced technologies and
     upgrades to your forces.
      Special Ability: Steady income
   .name = Advanced Tech Center

actor-radio-p =
   .description = Provides access to GPS Satellite.
    Also provides radar.
   .name = Radio Telescope

actor-atd =
   .description = Anti-Naval and air defense.
    Can detect cloaked units.
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Adv. Torpedo Defense

actor-xbar =
   .description = Highly explosive proximity trap.
      Strong vs Ground units
      Weak vs Aircraft
   .name = Demo Trap

actor-seamine-name = Sea Mine

actor-sbag =
   .description = Stops infantry and light vehicles.
    Can be crushed by tanks.
   .name = Sandbag Wall

actor-fenc =
   .description = Stops infantry and light vehicles.
    Can be crushed by tanks.
   .name = Wire Fence

actor-cycl =
   .description = Stop units and blocks enemy fire.
    Can be crushed by tanks.
   .name = Chain-Link Barrier

actor-brik =
   .description = Stop units and blocks enemy fire.
   .name = Concrete Wall

actor-barb-name = Barbed-Wire Fence

actor-wood =
   .description = Stops infantry and light vehicles.
    Can be crushed by tanks.
   .name = Wooden Fence

actor-oreext =
   .description = Place on ore mines to increase 
     their growth rate. 
      Unarmed
   .name = Ore Extractor

actor-oreext2 =
   .description = Place on ore mines to increase 
     their growth rate. 
      Unarmed
   .name = Advanced Ore Extractor

actor-agate-name = Gate

meta-concrete =
   .name = Pavement
   .generic-name = Cement
   .description = Pave the ground to increase unit movement speed.

actor-concretea-name = Pavement 3x3
actor-concreteb-name = Pavement 4x4
actor-concretec-name = Pavement 10x10

## shared_tek.yaml
actor-t-miss =
   .description = Provides access to your faction's epic unit or ability.
    
      Special Ability: Provides money
     Limit of one.
   .name = Super Tech Center
   .produceactorpower-devouringone-end-charge-text-notification = Devouring Ones ready.
   .produceactorpower-devouringone-ready-text-notification = Reinforcements have arrived.
   .produceactorpower-devouringone-blocked-text-notification = No room for new unit.
   .droppodspower-artillery-select-target-text-notification = Select target.
   .airstrikepower-nuclearparabombs-select-target-text-notification = Select target.
   .airstrikepower-antimatterbombdrop-select-target-text-notification = Select target.
   .airstrikepower-hyperion-select-target-text-notification = Select target.

actor-haxor =
   .description = Become the Boss, makes your 
     structures never targeted by AI.
   .name = Boss Mode
   .chronoshiftpower-chronoshift-select-target-text-notification = Select target.
   .chronoshiftpower-chronoshift-insufficient-power-text-notification = Insufficient power.
   .chronoshiftpower-chronoshift-begin-charge-text-notification = Chronosphere charging.
   .chronoshiftpower-chronoshift-end-charge-text-notification = Chronosphere ready.

actor-haxor-ai1 =
   .description = Debug Mode for AI
   .name = Enable AI Prereqs: Medium

actor-haxor-ai2 =
   .description = Debug Mode for AI
   .name = Enable AI Prereqs: Hard

actor-pbox-teleport =
   .description = For testing purposes
   .name = Teleport Network

actor-oblid-hax =
   .description = Fuck everything
   .name = Obelisk of God

actor-obl-haxdefault =
   .description = Default Debug
   .name = Default Debug

actor-obl-haxfire =
   .description = Fire Debug
   .name = Fire Debug

actor-obl-haxzap =
   .description = Zap Debug
   .name = Zap Debug

actor-obl-haxbullet =
   .description = Bullet Debug
   .name = Bullet Debug

actor-obl-haxzombie =
   .description = Zombie Debug
   .name = Zombie Debug

actor-obl-haxexplosion =
   .description = Explosion Debug
   .name = Explosion Debug

actor-obl-haxsmallexplosion =
   .description = SmallExplosion Debug
   .name = SmallExplosion Debug

actor-obl-haxtiberium =
   .description = Tiberium Debug
   .name = Tiberium Debug

actor-t-missair-description = Provides access to your faction's epic unit or ability.
    
      Special Ability: Provides money
     Limit of one.
actor-t-missinf-description = Provides access to your faction's epic unit or ability.
    
      Special Ability: Provides money
     Limit of one.

## shared_veh.yaml
actor-mcv-description = Deploys into another Construction Yard.
    Speed: 71
      Unarmed

actor-mcvd =
   .description = Deploys into another Construction Yard.
    Speed: 71
      Unarmed
   .name = Mobile Construction Vehicle

actor-harv-description = Collects Ore, Tiberium and Gems for processing.
    Speed: 100 
      Unarmed

actor-harvnavy-description = Collects Ore, Tiberium and Gems for processing. Amphibious unit.
    Speed: 100 
      Unarmed
   .name = Amphibious Harvester
   .generic-name = Amphibious Harvester

actor-harvd =
   .description = Collects Ore, Tiberium and Gems for processing.
    Speed: 100 
      Unarmed
   .name = Harvester
   .generic-name = Harvester

actor-arty-description = Long-range artillery.
    Speed: 85
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
actor-apc-description = Tough infantry transport.
    Speed: 142
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft

actor-amapc =
   .description = Amphibious infantry transport.
    Speed: 113
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft
   .name = Amphibious APC

actor-truk-description = Transports cash to other players.
    Speed: 128
      Unarmed
actor-mnly-description = Lays mines to destroy
    unwary enemy units.
    Speed: 128 
    Can detect mines.
      Unarmed
actor-ftrk-description = Mobile unit with mounted Flak cannon.
    Speed: 118
      Strong vs Infantry, Light armor, Aircraft
      Weak vs Tanks

## soviet_air.yaml
actor-mig-description = Fast Ground-Attack Plane.
    Speed: 256
      Strong vs Buildings, Vehicles
      Weak vs Infantry, Aircraft
actor-yak-description = Attack Plane armed with
    dual machine guns.
    Speed: 178
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft

actor-n-mig =
   .description = Fast Ground-Attack Plane with nuclear warheads.
      Strong vs Everything, Tanks
      Weak vs Aircraft
   .name = Nuke MiG

## soviet_inf.yaml
actor-shok-description = Elite infantry with portable Tesla coils.
    Speed: 56
      Strong vs Infantry, Vehicles
      Weak vs Aircraft
actor-dog-description = Anti-infantry unit.
    Can detect spies.
    Speed: 99
      Strong vs Infantry
      Weak vs Vehicles, Aircraft

actor-heavyguy =
   .description = Elite commando with a minigun.
      Strong vs Infantry, light vehicles, aircraft
      Weak vs Tanks
   .name = Heavy

actor-e4deso =
   .description = Advanced anti-material infantry
    Deploy to create a radiation field.
      Strong vs Infantry, Light vehicles
      Weak vs Heavy vehicles, Aircraft
   .name = Desolator

## soviet_str.yaml
actor-soviet-iron =
   .name = Iron Blanket Protocol
   .description = Increases armor of all Structures and Tanks by 20% with reactive plating.

actor-soviet-tesla =
   .name = Improved Coils
   .description = A new alloy was discovered for use in electrical coils,
     increasing damage and range of Tesla weapons.

actor-tsla-est =
   .description = Advanced base defense, disables current target.
    Requires power to operate.
    Can detect cloaked units.
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = EMP Tesla Coil

actor-brik-est =
   .description = Stop units and blocks enemy fire.
   .name = Reinforced Wall

actor-ironball =
   .description = Utility base defense.
    Grants short invulnerability to 
    nearby structures and vehicles when attacked.
    
    Explodes violently.
   .name = Iron Shroud

## soviet_veh.yaml
actor-3tnk =
   .description = Soviet Main Battle Tank, with dual cannons
    Speed: 71
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Soviet Heavy Tank

actor-4tnk =
   .description = Big and slow tank, with anti-air capability.
    Can crush concrete walls.
    Speed: 43
      Strong vs Vehicles, Infantry, Aircraft
      Weak vs Nothing
   .name = Soviet Mammoth Tank

actor-v2rl-description = Long-range rocket artillery.
    Speed: 85
      Strong vs Infantry, Buildings
      Weak vs Vehicles, Aircraft
actor-ttnk-description = Tank with mounted Tesla coil.
    Speed: 99
      Strong vs Infantry, Vehicles, Buildings
      Weak vs Aircraft

actor-dtrk =
   .description = Truck with actively armed nuclear
    explosives. Has very weak armor.
    Speed: 85
   .name = Nuclear Demo Truck

actor-qtnk-description = Deals seismic damage to nearby vehicles
    and structures.
    Speed: 56
      Strong vs Vehicles, Buildings
      Weak vs Infantry, Aircraft

actor-ztnk =
   .description = [EPIC]
    Advanced Mobile Tesla platform.
    Deletes infantry.
    Speed: 35
      Strong vs Ground Units
      Weak vs Air
   .name = Tesla Goliath
   .generic-name = Death

actor-u-tnk =
   .description = Big and slow tank, with anti-air capability.
    Can crush concrete walls.
      Strong vs Vehicles, Infantry, Aircraft
      Weak vs Nothing
   .name = Apocalypse Tank
   .generic-name = Tank

## techbuildings.yaml
actor-miss =
   .name = Communications Center
   .tooltipdescription-ally-description = Increases visual range of all units.
   .tooltipdescription-other-description = Capture to give increase visual range of all units.

actor-miss-husk =
   .name = Communications Center (Dead)
   .tooltipdescription-other-description = This structure is being rebuilt.

actor-oilb-husk =
   .name = Oil Derrick (Dead)
   .tooltipdescription-other-description = This structure is being rebuilt.

actor-fcom =
   .name = Forward Command
   .tooltipdescription-ally-description = Provides buildable area, and Building + Infantry production queues.
   .tooltipdescription-other-description = Capture to give buildable area, and Building + Infantry production queues.

actor-fcom-husk =
   .name = Forward Command (Dead)
   .tooltipdescription-other-description = This structure is being rebuilt.

actor-hosp-husk =
   .name = Hostipal (Dead)
   .tooltipdescription-other-description = This structure is being rebuilt.

## terran_add.yaml
meta-terranaddon =
   .name = X with attached Y
   .in_world--name = X

actor-tcomsat-plug =
   .name = Addon: ComSat Station
   .description = Attach to Command Center. Provides an overview of the battlefield.
    Requires power to operate. 
    
    Ability: Scanner Sweep

actor-tcomsat =
   .name = Command Centre with attached ComSat Station
   .in_world--name = ComSat Station

actor-tshop-plug =
   .name = Addon: Machine Shop
   .description = Attach to Factory. 
    Allows access to Siege Tank,
     Goliath and vehicle upgrades. 
    
    Repairs vehicles and aircraft. 
    Rearms Vulture mines.

actor-tshop =
   .name = Factory with attached Machine Shop
   .in_world--name = Machine Shop
   .repairsunits-start-repairing-text-notification = Repairing.
   .repairsunits-finish-repairing-text-notification = Unit repaired.

actor-tctrl-plug =
   .name = Addon: Control Tower
   .description = Attach to Starport. 
    Allows production of Dropship and aircraft upgrades. 
    Support Power: Orbital Drop

actor-tctrl =
   .name = Starport with attached Control Tower
   .in_world--name = Control Tower
   .droppodspower-select-target-text-notification = Select target.
   .droppodspower-2-select-target-text-notification = Select target.

actor-tcops-plug =
   .name = Addon: Covert Ops
   .description = Attach to Science Facility. 
    Allows access to Ghost and 
     missile silo.

actor-tcops =
   .name = Science Facility with attached Covert Ops
   .in_world--name = Covert Ops

actor-tplab-plug =
   .name = Addon: Physics Lab
   .description = Attach to Science Facility. 
    Allows access to Battlecruiser.

actor-tplab =
   .name = Science Facility with attached Physics Lab
   .in_world--name = Physics Lab

actor-tsilo-plug =
   .name = Addon: Missile Silo
   .description = Attach to Command Center. 
    Allows production of a nuclear missile.
    Requires power to operate.

actor-tsilo =
   .name = Command Center with attached Missile Silo
   .in_world--name = Missile Silo

## terran_air.yaml
actor-twraith =
   .description = Terran gunship armed with Gemini AA missiles 
     and 25mm burst lasers.
    
    Can cloak but reduces effectiveness.
    Speed: 160
      Strong vs Infantry, Aircraft
      Weak vs Vehicles, Buildings
   .name = Wraith

actor-tdropship =
   .description = Terran transport ship.
    Speed: 136
      Unarmed
   .name = Dropship

actor-tdropship-raynor =
   .description = Raynor's choice of transport ship.
    Speed: 136
      Can heal infantry.
   .name = Medivac Dropship

actor-tvessel =
   .description = Terran support vessel. Can provide defense matrices to allies, and irradiate enemies.
    Speed: 128
    
    Detects cloaked units.
   .name = Science Vessel
   .irradiate = Science Vessel - Irradiate
   .matrix = Science Vessel - Defense Matrix

actor-tbattle =
   .description = Terran capital ship.
    Slow but armed to the teeth with lasers.
    Speed: 56
      Strong vs Everything
      Weak vs Nothing
   .name = Battlecruiser

actor-tvalk =
   .description = Terran armored missile Frigate armed
    with H.A.L.O. Cluster rockets.
    Can only attack air.
    Speed: 152
      Strong vs Aircraft
      Weak vs Anything else
   .name = Valkyrie

actor-tvalk-bomber-name = Valkyrie

actor-thyperion =
   .description = Raynor's capital ship, headed by Matt Horner.
    Slow but armed to the teeth with lasers.
    Speed: 72
      Strong vs Everything
      Weak vs Nothing
   .name = Hyperion

## terran_inf.yaml
actor-tscv =
   .description = Collects Ore, Gems and Tiberium for processing.
    Speed: 96
      Can repair structures and vehicles.
   .name = SCV

actor-tmarine =
   .description = General-purpose infantry.
    Speed: 60
      Strong vs Infantry
      Weak vs Vehicles, Aircraft 
    
    Can attack air with an upgrade.
   .name = Marine

actor-tfirebat =
   .description = Splash damage flamethrower.
    Speed: 60
      Strong vs Infantry, Structures
      Weak vs Vehicles, Aircraft
   .name = Firebat

actor-tmedic =
   .description = Heals nearby infantry.
     Infiltrates and captures
    enemy structures.
      Unarmed
   .name = Medic

actor-tghost =
   .description = Covert Ops assassin.
    Speed: 72
      Strong vs Infantry
      Weak vs Vehicles, Aircraft 
    
    Can use stealth, and launch spot for the Missile Silo.
   .generic-name = Ghost
   .name = Ghost
   .2--generic-name = Ghost
   .2--name = Ghost - Target Painting (No Nuke)
   .3--generic-name = Ghost
   .3--name = Ghost - Target Painting

actor-traynor =
   .description = Leader of Raynor's Raiders armed with a modified
     C-14 Gauss Rifle.
    Speed: 72
      Strong vs Infantry, Aircraft
      Weak vs Vehicles 
    
    Equipped with Stimpacks and a squad booster.
   .name = Jim Raynor

actor-active-raynor-name = EpiTech Center

actor-traynor-hero0 =
   .description = [HERO]
    
    Leader of Raynor's Raiders armed with a modified
     C-14 Gauss Rifle.
    Speed: 72
      Strong vs Infantry, Aircraft
      Weak vs Vehicles 
    
    Equipped with Stimpacks.
   .name = Jim Raynor (Tier 0)
   .real--name = Jim Raynor

actor-traynor-hero1-name = Jim Raynor (Tier 1)
actor-traynor-hero2-name = Jim Raynor (Tier 2)
actor-traynor-hero3-name = Jim Raynor (Tier 3)

actor-traynor-hero4 =
   .name = Jim Raynor (Tier 4)
   .droppodspower-select-target-text-notification = Select target.

actor-traynor-hero5-name = Jim Raynor (Tier 5)

## terran_str.yaml
actor-tcommand =
   .description = Produces structures.
   .name = Command Center

actor-tcommand-addon-name = Command Center with no addon

actor-tcommand-air =
   .description = Produces structures.
   .name = Command Center

actor-tcommand-husk-name = Command Center

actor-tsupply =
   .description = Provides power for other structures.
   .name = Supply Depot

actor-tsupply-socket-name = Supply Depot (unupgraded)

actor-tsupply-up =
   .name = Boost Supply Output
   .description = Place onto a friendly supply depot/n to increase power output by 100%.

actor-trefinery =
   .description = Refines Ore, Tiberium and Gems
    into credits.
   .name = Refinery

actor-tbarr =
   .description = Trains infantry. 
    Each one has its own production queue.
   .name = Terran Barracks

actor-tbarr-ai-description = Bot only structure to give Hard AI a large advantage.
actor-tbarr-air-name = Terran Barracks
actor-tbarr-husk-name = Terran Barracks

actor-tacadamy =
   .description = Allows access to additional infantry and upgrades.
   .name = Academy
   .tooltipdescription-description = Move Marines or Firebats near this
     structure to give them stimpacks.

actor-tenbay =
   .description = Produces Terran advanced technologies.
   .name = Technology Center

actor-tenbay-air-name = Technology Center
actor-tenbay-husk-name = Technology Center

actor-tmissile =
   .description = Anti-Armor base defense.
    Can detect cloaked units.
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Missile Turret

actor-tmissile-mengsk-name = Fortified Missile Turret

actor-tfactory =
   .description = Produces vehicles.
   .name = Terran Factory

actor-tfactory-addon-name = Factory with no addon
actor-tfactory-air-name = Terran Factory
actor-tfactory-husk-name = Terran Factory

actor-tsport =
   .description = Produces aircraft.
   .name = Starport

actor-tsport-addon-name = Starport with no addon
actor-tsport-air-name = Starport
actor-tsport-husk-name = Starport

actor-tarmory =
   .description = Allows access to additional vehicle upgrades.
   .name = Armory

actor-tscience =
   .description = Provides extra advanced technologies and
     upgrades to your forces.
      Special Ability: Steady income
    
      Allows access to more Barracks.
   .name = Science Facility
   .droppodspower-select-target-text-notification = Select target.

actor-tscience-addon-name = Science Facility with no addon
actor-tscience-air-name = Science Facility
actor-tscience-husk-name = Science Facility

actor-tbunker =
   .name = Bunker
   .description = Static defense with a fireport for
     garrisoned troops.
    Cannot detect cloaked units.
      Strong vs Infantry, Light armor
      Weak vs Tanks, Aircraft

actor-tbunker-bot-description = AI-only, contains 3 marines and a firebat. 
    Also has self-heals for Hard difficulty
actor-tbunker-bot2-description = AI-only, contains 3 marines and a ghost. 
    Also has self-heals for Hard difficulty
actor-tbunker-mengsk-name = Supply Bunker
actor-tbunker-mengsk-bot-description = AI-only, contains 4 marines and 2 firebats. 
    Also has self-heals for Hard difficulty
actor-tbunker-mengsk-bot2-description = AI-only, contains 5 marines and 1 ghost. 
    Also has self-heals for Hard difficulty

## terran_upg.yaml
actor-terran-marine =
   .name = Research U-238 Shells
   .description = Increases Marine attack range and
     allows them to target air units.

actor-terran-tank =
   .name = Research Siege Mode
   .description = Enables Siege Mode for Siege Tanks.

actor-terran-ghost =
   .name = Research Ocular Implants
   .description = Improves sight range for Ghosts by 10%.

actor-terran-resources =
   .name = Research Forced Labor
   .description = Increases yield of reprocessing minerals and
     tiberium by 10%. 
    Increases SCV speed by 50%.

actor-terran-armor =
   .name = Research Vanadium Plating
   .description = Increases vehicle and aircraft armor by a further 20%

actor-terran-structure =
   .name = Research Fortification
   .description = Increases structure armor by a further 20%

actor-terran-nuke =
   .name = Atom Bomb
   .description = Arm a nuclear missile. Must be launched by a Terran Ghost.
    Strong vs Everything

actor-raynor-tier1-fastupgrade1 =
   .name = Enhanced Training Regime
   .description = Gain Infantry Firepower I instantly.

actor-raynor-tier1-fastupgrade2 =
   .name = Vanadium Plating
   .description = Gain Infantry Armor I instantly.

actor-raynor-tier2-costcut =
   .name = Improved Supply Chain
   .description = Produce Infantry for 10% cheaper and 20% faster.

actor-raynor-tier2-firespeed =
   .name = Mercenary Munitions
   .description = Improves Infantry weapon reload speed by 10%.

actor-raynor-tier3-fastupgrade1 =
   .name = Enhanced Training Regime II
   .description = Gain Infantry Firepower II instantly.

actor-raynor-tier3-fastupgrade2 =
   .name = Vanadium Plating II
   .description = Gain Infantry Armor II instantly.

actor-raynor-tier3-range =
   .name = Nano Projectors
   .description = Increase range of Medics, Medivac Dropships and Firebats.

actor-raynor-tier4-support1 =
   .name = Orbital Bombing
   .description = Enables Orbital Bombing support power. 
    
    Instant artillery strike in small target area.
    Cooldown: 6:00

actor-raynor-tier4-support2 =
   .name = Strike Force
   .description = Enables Strike Force support power. 
    
    Call in 2 Dropships to paradrop 12 infantry.
    Cooldown: 3:00

actor-raynor-tier5-hyperion1 =
   .name = Yamato Gun
   .description = Enables the use of the Yamato Gun,
     which can be fired once by the Hyperion.

actor-raynor-tier5-hyperion2 =
   .name = Hypercharge
   .description = Allows the Hyperion to remain in 
     combat for an additional 15 seconds.

## terran_veh.yaml
actor-tvult =
   .description = Fast scout vehicle, armed with grenades.
    Can place Spider Mines.
    
    Speed: 114
      Strong vs Infantry
      Weak vs Tanks
   .name = Vulture

actor-tspider-name = Spider Mine

actor-tstank =
   .name = Terran Siege Tank
   .deployed = Terran Siege Tank (deployed)
   .description = Deployable artillery tank.
    Speed: 48
      Strong vs Vehicles, Infantry
      Weak vs Aircraft

actor-tgoliath =
   .description = Mech walker. Can attack air.
    
    Speed: 96
      Strong vs Infantry, Aircraft
      Weak vs Tanks
   .name = Goliath

actor-tvult-raynor =
   .description = In Vulture.
    
    Leader of Raynor's Raiders armed with a modified
     Grenade launcher.
    Speed: 172
      Strong vs Infantry, Aircraft
      Weak vs Vehicles 
    
    Equipped with a squad booster.
   .name = Jim Raynor

## uac_inf.yaml
actor-dm2 =
   .description = General-purpose infantry.
    Speed: 60
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Rifle Marine

actor-dm2of =
   .description = Squad leader, boosts nearby troops'
    speed and firepower.
    Speed: 66
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Officer

actor-dm6 =
   .description = Anti-Air infantry.
    Speed: 60
      Strong vs Infantry, Aircraft
      Weak vs Tanks
   .name = Minigunner

actor-dm1 =
   .description = Shoulder-mounted RPG.
    Speed: 60
      Strong vs Infantry, Light Vehicles
      Weak vs Heavy Armor, Aircraft
   .name = RPG Marine

actor-dm3 =
   .description = Heavy anti-infantry and anti-armour marine.
    Speed: 56
      Strong vs Infantry, Tanks
      Weak vs Light Vehicles, Aircraft
   .name = Plasma Gunner

actor-medi-dm =
   .description = Heals nearby infantry.
    Speed: 56
      Unarmed
   .name = UAC Medic

actor-mech-dm =
   .description = Repairs nearby vehicles and restores
    husks to working condition by capturing them.
    Speed: 56
      Unarmed
   .name = UAC Mechanic

actor-dm4 =
   .description = Heavy anti-material marine.
    Speed: 48
      Strong vs Infantry, Tanks
      Weak vs Aircraft
   .name = BFG Marine

actor-tse5p-dm =
   .description = Stealth while stationary.
    Invisible to GPS, always prone,
      weapon has tracer.
    Speed: 28
      Strong vs Infantry
      Weak vs Everything else
   .name = UAC Sniper

actor-dm5 =
   .description = [EPIC]
    Dwayne 'The Sarge' Schwartz is armed with a BFG10k.
    Speed: 48
      Strong vs Infantry, Tanks
      Weak vs Aircraft
   .name = Sarge

actor-dm7 =
   .description = Very angry. Sometimes ignores orders.
   .name = Berserker

actor-helld1 =
   .description = Medium demon from Hell, can float over water and cliffs.\Speed: 72
      Strong vs Infantry, Air
      Weak vs Vehicles
   .name = Cacodemon

actor-helld2 =
   .description = Large demon from Hell, can attack air.
    Speed: 56
      Strong vs Infantry, Air
      Weak vs Vehicles
   .name = Baron Of Hell

actor-helld3 =
   .description = A cybernetic demon lord from Hell.
     Can attack air.
    Speed: 65
      Strong vs Everything
      Weak vs Nothing
   .name = Cyberdemon

actor-helld4 =
   .description = Small demon from Hell, can attack air.
    Speed: 56
      Strong vs Infantry, Air
      Weak vs Vehicles
   .name = Imp

actor-helld5 =
   .description = Anti-vehicle skeletal man from Hell.
    Can attack air.
    Speed: 66
      Strong vs Vehicles, Air
      Weak vs Infantry
   .name = Revenant

actor-helld6 =
   .description = Fast melee demon.
    Speed: 88
      Strong vs Infantry
      Weak vs Vehicles, Air
   .name = Demon

actor-helld6-s =
   .description = Fast invisible melee demon.
    Speed: 88
      Strong vs Infantry
      Weak vs Vehicles, Air
   .name = Spectre

actor-helld7 =
   .description = Long-range seige demon from Hell.
    Speed: 36
      Strong vs Ground, Buildings
      Weak vs Air
   .name = Mancubus

actor-helld8 =
   .description = A mastermind of Hell, can spawn in new
     demons from the corpses of it's victims.
      Strong vs Everything
      Weak vs Nothing
   .name = Spider Mastermind

actor-helld9 =
   .description = Fire-elemental sniper and restoration demon,
    can attack air.
    Speed: 72
      Strong vs Vehicles, Air
      Weak vs Infantry
   .name = Archvile

## uac_shp.yaml
actor-dmdd =
   .description = Very slow seige ship with AA capability. Can transport units.
    Speed: 39
      Strong vs Buildings, Aircraft
      Weak vs Naval units
   .name = Fortress

## uac_str.yaml
actor-dmb3 =
   .description = Provides UAC advanced technologies.
      Special Ability: Paradoom
   .name = UAC Tech Center

actor-plstur =
   .description = Advanced base defense.
    Requires power to operate.
    Can detect cloaked units.
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Gauss Tower

actor-hellgate =
   .description = Gain access to Hell to produce
    powerful demon units.
    Requires power to operate.
      Special Ability: Summon Demon
   .name = Hell Portal

actor-hellgate-d-description = Gain access to Hell to produce
    powerful demon units.
    Can have 2 active charges.
    Requires power to operate.
      Special Ability: Summon Cyberdemon
actor-bfg10k-name = BFG10k

## uac_veh.yaml
actor-stnk-dm =
   .description = Heavy armored infantry transport
      serves as UAC main battle tank. 
     Speed: 128
      Strong vs Light armor
      Weak vs Infantry, Tanks, Aircraft
   .name = UAC Raider

actor-1tnk-dm-name = UAC Light Tank

actor-dmgtnk =
   .description = Big and slow gauss tank, with anti-air capability.
    Can crush concrete walls.
    Speed: 46
      Strong vs Vehicles, Infantry, Aircraft
      Weak vs Nothing
   .name = Mammoth Mk III

actor-dmgtnk-ph =
   .description = Big and slow gauss tank, with anti-air capability.
    Can crush concrete walls.
    Can transport infantry.
    Speed: 56
      Strong vs Vehicles, Infantry, Aircraft
      Weak vs Nothing
   .name = Raider Mammoth

actor-dmgtnk-m =
   .description = Big and slow gauss tank, boosts nearby troops.
    Also has BFG9000.
    Can crush concrete walls.
    Speed: 36
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Mammoth Overlord

actor-btnk-m =
   .description = Tank mounted with a plasma cannon.
    Speed: 85
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Plasma Tank

actor-baneblade =
   .description = Huge, slow but destructive tank of the UAC.
    Speed: 24
      Strong vs Everything
      Weak vs Nothing
   .name = Baneblade

## upgrades.yaml
actor-upgrade-buildarmor1 =
   .name = Structural Integrity Upgrade I
   .description = Improve structure health by 20%

actor-upgrade-buildarmor2 =
   .name = Structural Integrity Upgrade II
   .description = Improve structure health by 40%

actor-upgrade-buildarmor3 =
   .name = Structural Integrity Upgrade III
   .description = Improve structure health by 60%

actor-upgrade-buildfirepower1 =
   .name = Structure Weapons Upgrade I
   .description = Improve defensive structure damage by 14%

actor-upgrade-buildfirepower2 =
   .name = Structure Weapons Upgrade II
   .description = Improve defensive structure damage by 28%

actor-upgrade-buildfirepower3 =
   .name = Structure Weapons Upgrade III
   .description = Improve defensive structure damage by 42%

actor-upgrade-infarmor1 =
   .name = Infantry Armour Upgrade I
   .description = Improve infantry armour by 15%

actor-upgrade-infarmor2 =
   .name = Infantry Armour Upgrade II
   .description = Improve infantry armour by 30%

actor-upgrade-infarmor3 =
   .name = Infantry Armour Upgrade III
   .description = Improve infantry armour by 45%

actor-upgrade-inffirepower1 =
   .name = Infantry Weapons Upgrade I
   .description = Improve infantry weapon damage by 15%

actor-upgrade-inffirepower2 =
   .name = Infantry Weapons Upgrade II
   .description = Improve infantry weapon damage by 30%

actor-upgrade-inffirepower3 =
   .name = Infantry Weapons Upgrade III
   .description = Improve infantry weapon damage by 45%

actor-upgrade-veharmor1 =
   .name = Vehicle Armour Upgrade I
   .description = Improve vehicle armour by 15%

actor-upgrade-veharmor2 =
   .name = Vehicle Armour Upgrade II
   .description = Improve vehicle armour by 30%

actor-upgrade-veharmor3 =
   .name = Vehicle Armour Upgrade III
   .description = Improve vehicle armour by 45%

actor-upgrade-vehfirepower1 =
   .name = Vehicle Weapons Upgrade I
   .description = Improve vehicle weapon damage by 15%

actor-upgrade-vehfirepower2 =
   .name = Vehicle Weapons Upgrade II
   .description = Improve vehicle weapon damage by 30%

actor-upgrade-vehfirepower3 =
   .name = Vehicle Weapons Upgrade III
   .description = Improve vehicle weapon damage by 45%

actor-upgrade-airarmor1 =
   .name = Aircraft Armour Upgrade I
   .description = Improve aircraft armour by 18%

actor-upgrade-airarmor2 =
   .name = Aircraft Armour Upgrade II
   .description = Improve aircraft armour by 36%

actor-upgrade-airarmor3 =
   .name = Aircraft Armour Upgrade III
   .description = Improve aircraft armour by 54%

actor-upgrade-airfirepower1 =
   .name = Aircraft Weapons Upgrade I
   .description = Improve aircraft weapon damage by 15%

actor-upgrade-airfirepower2 =
   .name = Aircraft Weapons Upgrade II
   .description = Improve aircraft weapon damage by 30%

actor-upgrade-airfirepower3 =
   .name = Aircraft Weapons Upgrade III
   .description = Improve aircraft weapon damage by 45%

actor-upgrade-navarmor1 =
   .name = Naval Armour Upgrade I
   .description = Improve naval armour by 15%

actor-upgrade-navarmor2 =
   .name = Naval Armour Upgrade II
   .description = Improve naval armour by 30%

actor-upgrade-navarmor3 =
   .name = Naval Armour Upgrade III
   .description = Improve naval armour by 45%

actor-upgrade-navfirepower1 =
   .name = Naval Weapons Upgrade I
   .description = Improve naval weapon damage by 15%

actor-upgrade-navfirepower2 =
   .name = Naval Weapons Upgrade II
   .description = Improve naval weapon damage by 30%

actor-upgrade-navfirepower3 =
   .name = Naval Weapons Upgrade III
   .description = Improve naval weapon damage by 45%

## usa_air.yaml
actor-usachinook =
   .description = Collects Ore, Tiberium and Gems for processing.
    Speed: 96 
      Unarmed
   .name = Chinook

actor-usacombatchinook =
   .description = Fast Infantry Transport Helicopter.
    Can be loaded with units that can fire onto targets.
   .name = Combat Chinook

actor-usacomanche =
   .description = Attack helicopter armed with twin 20 mm chainguns & anti-tank missiles.
    Can be upgraded to use stealth after recruiting General Malcolm Granger.
   .name = Comanche
   .upgrade--name = Stealth Comanche

actor-usaraptor =
   .description = Multi-role fighter plane.
    Can attack both ground and air targets.
   .name = Raptor

actor-usastealthfighter =
   .description = Stealth fighter plane.
   .name = Stealth Fighter

actor-usaaurora =
   .description = Fast fighter plane.
    Can not be damaged while attacking.
    Slows down and becomes vulnerable after attacking.
   .name = Aurora

actor-usakingraptor =
   .description = Multi-role fighter plane.
    Can deflect enemy missiles with lasers.
   .name = King Raptor

actor-usaauroraalpha =
   .description = Fast fighter plane.
    Can not be damaged while attacking.
    Slows down and becomes vulnerable after attacking.
   .name = Aurora Alpha

actor-usaspydrone-name = Spy Drone
actor-usaa10-name = A-10 Thunderbolt
actor-usamoabplane-name = Stealth Bomber

actor-usatransportchinook =
   .description = Fast Vehicle Transport Helicopter.
   .name = Halo

actor-usaspectregunship =
   .description = The Spectre Gunship was a support aircraft that could be periodically deployed by particularly high-ranking US generals based on the Lockheed AC-130 Spectre.
    Speed: 120
      Strong vs Ground Targets
      Weak vs Anti-Air
   .name = Lockheed AC-130 Spectre

actor-usaspectregunship-husk-name = Lockheed AC-130 Spectre

## usa_inf.yaml
actor-usaranger =
   .description = US Ranger, equipped with M16A2 assault rifles
    and flash grenades.
    Speed: 62
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Ranger
   .upgrade--name = Laser Ranger

actor-usadefender =
   .description = US Missile Defender, equipped with an MK 153 SMAW
    Can be upgraded with a laser targeting system
    improving range and fire rate.
      Strong vs Vehicles, Aircraft
      Weak vs Infantry
   .name = Missile Defender
   .upgrade--name = Missile Defender (Upgraded)

actor-usapathfinder =
   .description = US Elite Sniper, equipped with Heckler & Koch MSG90
    and ghillie suits for camouflage.
    Speed: 62
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Pathfinder
   .upgrade--name = Pathfinder (Upgraded)

actor-usaburton =
   .description = An expert in covert operations, Colonel Burton can wreak havoc against enemy infantry of all types.
    Armed with a rifle, knife and remote or timed demo charges,
    Colonel Burton’s stealth training allows him to move invisibly across almost any terrain.
     He has over 500 confirmed kills.
   .name = Burton

## usa_shp.yaml
actor-usaspycarrier =
   .description = Carrier used to detect invisible units and unscouted areas in a large location.
   .name = US Spy Carrier

actor-usareconboat =
   .description = Fast scout boat, armed with rockets.
   .name = US Recon Boat

actor-usamlrscarrier =
   .description = Very slow long-range ship.
      Strong vs Buildings, Ground units
      Weak vs Naval units, Aircraft
   .name = US MLRS Carrier

## usa_str.yaml
actor-usacoldfusion =
   .description = Provides power for other structures.
    Can be upgraded to provide more power.
   .name = Cold Fusion Reactor
   .extra50--name = Cold Fusion Reactor (Control Rods)
   .extra150--name = Cold Fusion Reactor (Nuclear Rods)

actor-usabarracks =
   .description = Trains infantry. Patriots. God bless 'em.
   .name = Barracks

actor-usasupplycenter =
   .description = Refines Ore, Tiberium and Gems
    into credits.
   .name = Supply Center

actor-usawarfactory =
   .description = Produces vehicles.
   .name = War Factory

actor-usaairfield =
   .description = Produces and reloads aircraft.
      Special Ability: Spy Plane
      Special Ability: Paratroopers
   .name = USA Airfield

actor-usastrategycenter =
   .description = Strategic Center, provides upgrades.
   .name = Strategy Center

actor-usaminedropactor =
   .description = Highly explosive proximity trap.
      Strong vs Ground units
      Weak vs Aircraft
   .name = Land Mine

actor-usasupplydropzone =
   .description = A Cargo Plane drops money crates here every 2.5 minutes.
   .name = Supply Drop Zone

actor-usaparticlecannon =
   .name = Particle Uplink Cannon
   .description = Provides Particle Cannon support power.

actor-camera-particle-cannon-name = (support power proxy camera)

actor-usapatriot =
   .description = Anti-tank & anti-air base defense.
   .name = Patriot Missile System

actor-usapatriotemp =
   .description = Patriot Missile System upgrade with EMP rockets, disabling vehicles.
    Provided by General Alexis Alexander.
   .name = EMP Patriot Missile System

actor-usalaserpatriot =
   .description = Laser Defense Turret.
    Provided by General Townes
   .name = Laser Defense Turret

actor-usafirebase =
   .description = Firebase defense structure. Long ranged artillery.
   .name = Firebase

actor-usasilo =
   .description = Stores excess refined Ore and Gems.
   .name = US Silo
   .infiltrateforcash-infiltrated-text-notification = Credits stolen.

actor-usashipyard =
   .description = Produces and repairs
    ships and transports.
   .name = US Naval Yard
   .repairsunits-start-repairing-text-notification = Repairing.
   .repairsunits-finish-repairing-text-notification = Unit repaired.

actor-usasupportmatrix =
   .description = Support matrix system that increases attack and defense of nearby units for a short amount of time.
    Provided by General Alexis Alexander.
   .name = Support Matrix

actor-usatomahawkstorm =
   .name = Tomahawk Storm
   .description = Provides the Tomahawk Storm ability.
   .droppodspower-artillery-select-target-text-notification = Select target.

actor-tomahawkstormpower-name = bomblol

## usa_upg.yaml
actor-upgrade-coldreactor =
   .name = Cold Reactor Control Rods
   .description = Upgrade your Cold Reactors to provide more power.

actor-upgrade-coldreactoradvanced =
   .name = Cold Reactor Nuclear Control Rods
   .description = Upgrade your Cold Reactors to provide even more power.
    Cold Reactors become volatile and explode if destroyed.
    Proceed at your own risk.

actor-upgrade-supplylines =
   .name = Supply Lines
   .description = Increases credits recieved from all sources of income.

actor-upgrade-usatraining =
   .name = Advanced Training
   .description = Doubles the experience gained for all units.

actor-upgrade-cheaperplanes =
   .name = Advanced Engineering
   .description = Halves the cost of aircraft.

actor-upgrade-laserguided =
   .name = Laser Guided Missiles
   .description = Increase range and damage of Stealth Bombers and King Raptors.

actor-upgrade-countermeasures =
   .name = Countermeasures
   .description = Aircraft now drop stronger countermeasures to prevent missile targeting.

actor-upgrade-chargedlasers =
   .name = Charged Lasers
   .description = Increases firerate of laser weaponry.

actor-upgrade-improvedbatteries =
   .name = Improved Batteries
   .description = Reduces the power cost of Laser Patriots by 50%

actor-upgrade-empmissiles =
   .name = EMP Missiles
   .description = Missile Defenders & Humvees will now fire EMP missiles.

actor-upgrade-aircraftgeneral =
   .name = Malcolm Granger
   .description = Recruit General Malcolm Granger to join your forces.
    Unlocks advanced airforce units and abilities.

actor-upgrade-superweaponsgeneral =
   .name = Alexis Alexander
   .description = Recruit General Alexis Alexander to join your forces.
    Unlocks advanced weaponry and abilities.

actor-upgrade-lasergeneral =
   .name = "Pinpoint" Townes
   .description = Recruit General "Pinpoint" Townes to join your forces.
    Unlocks laser weaponry and abilities.

actor-upgrade-searchanddestroy =
   .name = Search and Destroy
   .description = Increases weapon range & sight range of all friendly ground units by 10%.
    Installs sensors that enabled the detection of stealthed units within a large radius around the strategy center.

actor-upgrade-holdtheline =
   .name = Hold the Line
   .description = Increases armor of all friendly ground units by 10%.
    Reinforces the strategy center with sandbags to increase its resilience.

actor-upgrade-bombardment =
   .name = Bombardment
   .description = Increases damage of all friendly ground units by 10%.
    Deploys an artillery piece from the strategy center for defense.

## usa_veh.yaml
actor-usacrusader =
   .description = USA main battle tank.
    Equipped with an 120 mm L30 rifled gun.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Crusader Tank

actor-usapaladin =
   .description = USA main battle tank.
    Equipped with an 120 mm ramjet-assisted cannon.
    and point defense laser.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Paladin Tank
   .upgrade--name = Paladin Tank (Upgraded)

actor-usahumvee =
   .description = Lightly armed infantry transport.
    Armed with a machine gun, tow missile launcher and 5 gun ports.
    Speed: 156
      Strong vs Infantry
      Weak vs Vehicles, Aircraft
   .name = Humvee

actor-usaambulance =
   .description = Unarmed support vehicle.
    Can carry three infantry.
    Can heal infantry and repair vehicles.
   .name = Ambulance

actor-usatomahawk =
   .description = Long-range rocket artillery.
    Capable of locking onto any target.
   .name = Tomahawk Launcher

actor-usasentrydrone =
   .description = Unmanned detection vehicle.
    Camouflaged while not moving.
    Armed with a machine gun for self defense
      Weak vs Everything
   .name = Sentry Drone

actor-usaavenger =
   .description = Support vehicle.
    Armed with twin anti-air lasers and anti personal laser.
      Strong vs Infantry, Aircraft
      Weak vs Vehicles
   .name = Avenger

actor-usamicrowave =
   .description = Advanced support tank.
    Equipped with a Microwave generator.
    Can disable vehicles, structures and fry infantry.
      Strong vs Vehicles, Infantry
      Weak vs Aircraft
   .name = Microwave Tank

actor-usalasercrusader =
   .description = USA main battle tank.
    Equipped with a High-energy directed pulse laser cannon.
    Speed: 85
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Laser Crusader Tank

actor-usarailgun =
   .description = [EPIC]
    Cannon-Caliber Electromagnetic Artillery.
   .name = CCEM Artillery

actor-usadisrupter =
   .description = General Townes personal project. The ultimate laser equipped tank.
    Speed: 35
      Strong vs Vehicles
      Weak vs Infantry, Aircraft
   .name = Disrupter

## world.yaml
actor-world =
   .mapcreeps-checkbox-label = Creeps
   .mapcreeps-checkbox-description = Allows creeps to spawn.
   .startingunits-mcvonly-class-name = MCV Only
   .startingunits-mcvonlydawn-class-name = MCV Only
   .startingunits-mcvonlyciv-class-name = MCV Only
   .startingunits-mcvonlygla-class-name = MCV Only
   .startingunits-mcvonlyprotoss-class-name = MCV Only
   .startingunits-mcvonlyzerg-class-name = MCV Only
   .startingunits-mcvonlyterran-class-name = MCV Only
   .startingunits-mcvonlyavalon-class-name = MCV Only
   .startingunits-lightallies-class-name = Light Support
   .startingunits-lightsoviet-class-name = Light Support
   .startingunits-lightgdi-class-name = Light Support
   .startingunits-lightnod-class-name = Light Support
   .startingunits-lightfed-class-name = Light Support
   .startingunits-lightuac-class-name = Light Support
   .startingunits-lightnazi-class-name = Light Support
   .startingunits-lightgla-class-name = Light Support
   .startingunits-lightciv-class-name = Light Support
   .startingunits-lightprotoss-class-name = Light Support
   .startingunits-lightzerg-class-name = Light Support
   .startingunits-lightterran-class-name = Light Support
   .startingunits-lightusa-class-name = Light Support
   .startingunits-lightusatownes-class-name = Light Support
   .startingunits-lightusagranger-class-name = Light Support
   .startingunits-lightchina-class-name = Light Support
   .startingunits-lightchinatank-class-name = Light Support
   .startingunits-lightchinanuke-class-name = Light Support
   .startingunits-lightchinainfantry-class-name = Light Support
   .startingunits-lightjapan-class-name = Light Support
   .startingunits-lightavalon-class-name = Light Support
   .startingunits-heavyallies-class-name = Heavy Support
   .startingunits-heavysoviet-class-name = Heavy Support
   .startingunits-heavygdi-class-name = Heavy Support
   .startingunits-heavynod-class-name = Heavy Support
   .startingunits-heavyfed-class-name = Heavy Support
   .startingunits-heavyuac-class-name = Heavy Support
   .startingunits-heavynazi-class-name = Heavy Support
   .startingunits-heavyheydrich-class-name = Heavy Support
   .startingunits-heavygla-class-name = Heavy Support
   .startingunits-heavyciv-class-name = Heavy Support
   .startingunits-heavyprotoss-class-name = Heavy Support
   .startingunits-heavyzerg-class-name = Heavy Support
   .startingunits-heavyterran-class-name = Heavy Support
   .startingunits-heavyusa-class-name = Heavy Support
   .startingunits-heavyusatownes-class-name = Heavy Support
   .startingunits-heavyusagranger-class-name = Heavy Support
   .startingunits-heavychina-class-name = Heavy Support
   .startingunits-heavychinatank-class-name = Heavy Support
   .startingunits-heavychinanuke-class-name = Heavy Support
   .startingunits-heavychinainfantry-class-name = Heavy Support
   .startingunits-heavyjapan-class-name = Heavy Support
   .startingunits-heavyavalon-class-name = Heavy Support

## zerg_air.yaml
actor-zoverlord =
   .description = Allows control over your swarm.
     Detects cloaked units.
    Speed: 32 
    
    Can be upgraded with speed, control and sensory upgrades.
    
    Unarmed
   .name = Overlord

actor-zoverlord-upgraded-description = [Upgraded]
     Allows control over your swarm.
     Detects cloaked units.
    Speed: 72 
    
    Transports units.

actor-zmuta =
   .description = Primary Zerg air-attack unit.
    Speed: 144
      Strong vs Infantry, Aircraft
      Weak vs Vehicles, Buildings
   .name = Mutalisk

actor-zqueen =
   .description = Zerg air support unit. Can infect 
     and ensnare enemies.
    Speed: 136
    
      Unarmed
   .name = Queen
   .ensnare = Queen - Ensnare
   .generic-name = Queen
   .parasite = Queen - Parasite
   .2generic-name = Queen

actor-zguardian =
   .description = Long-ranged ground attacker.
    Speed: 96
      Strong vs Ground units
      Weak vs Air
   .name = Guardian

actor-zscourge =
   .description = Kamikaze unit. Must get close
     to initiate attack.
    Speed: 144
      Strong vs Vehicles, Aircraft, Buildings
      Weak vs Anti-air
   .name = Scourge

## zerg_drone.yaml
actor-zdrone =
   .description = Collects resources and can also
     evolve into Zerg structures.
    Speed: 96
      Unarmed
   .name = Drone
   .generic-name = Zerg Drone
   .hatchery = Drone (Hatchery)

actor-zdrone-colony-name = Drone (Creep Colony)
actor-zdrone-hatchery-name = Drone (Hatchery)
actor-zdrone-extrac-name = Drone (Extractor)
actor-zdrone-pool-name = Drone (Spawning Pool)
actor-zdrone-hydra-name = Drone (Hydralisk Den)
actor-zdrone-chamber-name = Drone (Evolution Chamber)
actor-zdrone-ultraden-name = Drone (Ultralisk Cavern)
actor-zdrone-spire-name = Drone (Spire)
actor-zdrone-nest-name = Drone (Queen's Nest)
actor-zdrone-mound-name = Drone (Defiler Mound)
actor-zdrone-nydus-name = Drone (Nydus Canal)

actor-ze-hatchery =
   .name = Evolve into Hatchery
   .description = Zerg's baseline structure. 
    
    Spreads creep and doesn't need
       to be placed on creep.

actor-ze-colony =
   .name = Evolve into Creep Colony
   .description = Spreads creep, can be evolved into 
     defensive structures. 
    
    Must be placed on creep.

actor-ze-extrac =
   .name = Evolve into Extractor
   .description = Refines and stores resources. 
    
    Must be placed on creep.

actor-ze-pool =
   .name = Evolve into Spawning Pool
   .description = Allows production of Zerglings at
     a Hatchery. 
    
    Must be placed on creep.

actor-ze-hydra =
   .name = Evolve into Hydralisk Den
   .description = Allows production of Hydralisks at
     a Hatchery. 
    
    Must be placed on creep.

actor-ze-chamber =
   .name = Evolve into Evolution Chamber
   .description = Provides access to Zerg-specific upgrades
     and ability to evolve your Hatchery. 
    
    Must be placed on creep.

actor-ze-ultraden =
   .name = Evolve into Ultralisk Cavern
   .description = Allows production of Ultralisks at 
     a Hatchery. 
    
    Must be placed on creep.

actor-ze-spire =
   .name = Evolve into Spire
   .description = Allows production of basic air units
     at a Spire. 
    
    Must be placed on creep.

actor-ze-nest =
   .name = Evolve into Queen's Nest
   .description = Allows production of a Queen
     at a Spire. 
    
    Must be placed on creep.

actor-ze-mound =
   .name = Evolve into Defiler Mound
   .description = Allows production of Defilers
     at a Hatchery. 
    
    Must be placed on creep.

actor-ze-nydus =
   .name = Evolve into Nydus Canal (Entry)
   .description = Entry point for Zerg ground units to 
    use the Nydus network. 
    
    Must be placed on creep.

## zerg_inf.yaml
actor-zzergling =
   .description = Basic ground unit, powerful in swarms.
    Comes in pairs.
      Speed: 104
      Strong vs infantry
   .name = Zergling

actor-zdrone-eng-description = Captures stuff for the AI.

actor-zhydra =
   .description = Ranged ground unit.
      Speed: 88
      Strong vs infantry and aircraft
   .name = Hydralisk

actor-zlurker =
   .description = Ranged burrowing unit - must 
     burrow to attack
    
      Speed: 112
      Strong vs ground units
   .name = Lurker

actor-zlurker-ai =
   .description = Ranged burrowing unit - must 
     burrow to attack
    
      Speed: 112
      Strong vs ground units
   .name = Lurker

actor-zultra =
   .description = Powerful ground unit.
      Speed: 88
      Strong vs ground units and structures
   .name = Ultralisk

actor-ztorrasque =
   .description = Power ground unit. 
     Upgraded to have an area-damage
     cleave attack. 
    
    When killed, can be revived after 10 seconds, 
     once every 60 seconds.
      Speed: 88
      Strong vs ground units and structures
   .name = Torrasque

actor-ztorrasque-corpse-name = Corpse (Torrasque)

actor-zdefiler =
   .description = Ground support unit. Boosts friendly units and
     reduces incoming missile accuracy.
      Speed: 64
      Plague: Drains groups of enemies' health.
   .name = Defiler

actor-zdevouring =
   .description = An advanced strain of Zergling.
    Comes in pairs.
      Speed: 112
      Strong vs infantry
   .name = Devouring One

actor-zenthralled-name = Enthralled Zergling
actor-zhydra-e-name = Enthralled Hydralisk

actor-zbaneling =
   .description = Exploding ground unit, powerful in swarms.
    Comes in pairs.
      Speed: 104
      Strong vs everything
   .name = Baneling

actor-zkerrigan =
   .description = The Queen of the Swarm.
      Speed: 96
      Strong vs everything
   .name = Kerrigan

actor-zkerrigan-hero0 =
   .description = [HERO]
    
    The Queen of the Swarm.
      Speed: 112
      Strong vs ground units.
   .name = Kerrigan (Tier 0)
   .real--name = Kerrigan

actor-zkerrigan-hero1-name = Kerrigan (Tier 1)

actor-zkerrigan-hero2 =
   .description = [HERO]
    
    The Queen of the Swarm
     Now has a ranged attack.
      Speed: 96
      Strong vs everything.
   .name = Kerrigan (Tier 2)

actor-zkerrigan-hero3-name = Kerrigan (Tier 3)
actor-zkerrigan-hero4-name = Kerrigan (Tier 4)
actor-zkerrigan-hero5-name = Kerrigan (Tier 5)

actor-zzagara =
   .description = [HERO]
   
   The Broodmother of the Swarm.
   Excellent base defense and expansion.
      Speed: 72
      Strong vs ground units
   .name = Zagara
   .tier0 = Zagara (Tier 0)
   .tier1 = Zagara (Tier 1)
   .tier2 = Zagara (Tier 2)
   .tier3 = Zagara (Tier 3)
   .tier4 = Zagara (Tier 4)
   .tier5 = Zagara (Tier 5)
   .heal = Transfusion
   .healdesc = Heals units and buildings in target area.
     60 sec cooldown.

actor-ztumor =
   .name = Creep Tumor
   .description = Spreads creep in a small area and 
   can only be placed near Zagara; ideal 
   for base expansion.
      
     Can detect cloaked units.
     Boosts nearby units attack speed.
     
     60 sec cooldown.

actor-zergegg = Zerg Egg

actor-zegg =
   .zergling = Spawn Zerglings (45 sec cooldown)
   .hydra = Spawn Hydralisk (45 sec cooldown)
   .muta = Spawn Mutalisk (90 sec cooldown)

## zerg_str.yaml
actor-zhatchery =
   .description = Produces structures.
   .name = Hatchery
   .lair = Lair
   .hive = Hive
   .produceactorpower-devouringone-end-charge-text-notification = Devouring Ones ready.
   .produceactorpower-devouringone-ready-text-notification = Reinforcements have arrived.
   .produceactorpower-devouringone-blocked-text-notification = No room for new unit.

actor-zlair-up =
   .name = Evolve to Lair
   .description = Evolve a Hatchery to a Lair. 
    Unlocks access to Advanced structures and units.

actor-zhive-up =
   .name = Evolve to Hive
   .description = Evolve a Lair to a Hive. 
    Unlocks access to high tier structures and units. 
    
    Limit of 1.

actor-zlair-name = Lair
actor-zhive-name = Hive

actor-zccolony =
   .description = Spreads creep, can be evolved into 
     defensive structures. 
    
    Must be placed on creep.
   .name = Creep Colony
   .sunken = Sunken Colony
   .spore = Spore Colony

actor-ze-sunken =
   .name = Evolve into Sunken Colony
   .description = Anti-ground defensive structure. 
     Cannot detect cloaked. 
    
    Strong vs ground units

actor-ze-spore =
   .name = Evolve into Spore Colony
   .description = Anti-air defensive structure. 
     Detects cloaked units. 
    
    Strong vs aircraft

actor-zextrac =
   .description = Refines and stores resources. 
    
    Must be placed on creep.
   .name = Extractor

actor-zpool =
   .description = Allows production of Zerglings at
     a Hatchery. 
    
    Must be placed on creep.
   .name = Spawning Pool

actor-zhydraden =
   .description = Allows production of Hydralisks at
     a Hatchery. 
    
    Must be placed on creep.
   .name = Hydralisk Den

actor-zchamber =
   .description = Provides access to Zerg-specific upgrades
     and ability to evolve your Hatchery. 
    
    Must be placed on creep.
   .name = Evolution Chamber

actor-zspire =
   .description = Allows production of basic air units
     at a Spire. 
    
    Must be placed on creep.
   .name = Spire
   .2--name = Greater Spire

actor-zgspire-up =
   .name = Evolve to Greater Spire
   .description = Evolve a Spire into a Greater Spire. 
    Unlocks access to advanced air units
     and upgrades.

actor-zgspire-name = Greater Spire

actor-znest =
   .description = Allows production of a Queen
     at a Spire. 
    
    Must be placed on creep.
   .name = Queen's Nest

actor-zmslo =
   .name = Infested Missile Silo
   .description = Provides an atomic bomb full of plague and corrosion.
    Requires power to operate.
    Maximum 1 can be built.
      Special Ability: Zerg Atom Bomb
   .nukepower-select-target-text-notification = Select target.
   .nukepower-insufficient-power-text-notification = Insufficient power.
   .nukepower-begin-charge-text-notification = A-bomb prepping.
   .nukepower-end-charge-text-notification = A-bomb ready.
   .nukepower-incoming-text-notification = A-bomb launch detected.

actor-zmound =
   .description = Allows production of Defilers
     at a Hatchery. 
    
    Must be placed on creep.
   .name = Defiler Mound

actor-zultraden =
   .description = Allows production of Ultralisks at 
     a Hatchery. 
    
    Must be placed on creep.
   .name = Ultralisk Cavern

actor-znydus-name = Nydus Canal

actor-znydus-entry =
   .description = Entry point for Zerg ground units to 
    use the Nydus network. 
    
    Must be placed on creep.
   .name = Nydus Canal Entry

actor-nydus-teleport-name = Nydus Canal Entry

## zerg_upg.yaml
actor-zerg-zergling =
   .name = Evolve Zerglings
   .description = Improve Zergling attack and movement speed.

actor-zerg-hydra =
   .name = Evolve Hydralisks
   .description = Improve Hydralisk attack range and movement speed.

actor-zerg-overlord =
   .name = Evolve Overlords
   .description = Improve Overlord movement speed and sensor range.
     Also improves control over your swarm.

actor-zerg-spawning =
   .name = Evolve Colony Spawning
   .description = Allows production and placement of creep colonies
     without using drones.

actor-zerg-easybuild =
   .name = Enable EZ Build Mode
   .description = Allows production and placement of zerg structures
     without using drones.

actor-kerrigan-tier1-fortitude =
   .name = Heroic Fortitude
   .description = Increases Kerrigan's max HP by 20%
     and regen by 100%.

actor-kerrigan-tier1-savagery =
   .name = Savagery
   .description = Increases Kerrigan's damage done by 15%

actor-kerrigan-tier2-fastupgrade1 =
   .name = Enhanced Muscle Tissue
   .description = Gain Infantry Firepower I instantly.

actor-kerrigan-tier2-fastupgrade2 =
   .name = Hardened Skeletons
   .description = Gain Infantry Armor I instantly.

actor-kerrigan-tier3-carapace =
   .name = Mutating Carapace
   .description = Increases Kerrigan's life-steal from 15% to 30%

actor-kerrigan-tier4-torrasque =
   .name = Ultralisk Evolution: Torrasque
   .description = Upgrade Ultralisks to have an area-damage
     cleave attack. 
    
    When killed, can be revived after 10 seconds, 
     once every 60 seconds.

actor-zagara-tier1-fastupgrade1 =
   .name = Enhanced Muscle Tissue
   .description = Gain Structure Firepower I instantly.

actor-zagara-tier1-fastupgrade2 =
   .name = Hardened Epidermis
   .description = Gain Structure Armor I instantly.

actor-zagara-tier2-costcut =
   .name = Accelerated Evolution
   .description = Produce units for 10% cheaper and 20% faster.

actor-zagara-tier2-firespeed =
   .name = Adrenal Glands
   .description = Improves infantry attack speed by 10%.

actor-zagara-tier3-fastupgrade1 =
   .name = Enhanced Muscle Tissue II
   .description = Gain Structure Firepower II instantly.

actor-zagara-tier3-fastupgrade2 =
   .name = Hardened Epidermis II
   .description = Gain Structure Armor II instantly.

actor-zagara-tier3-range =
   .name = Mutate Optical Enhancements
   .description = Increase view and attack range of defensive
     structures by 10%.

actor-zagara-tier4-support1 =
   .name = Frenzy
   .description = Enables Zerg Frenzy support power. 
    
    Boosts a group of units by 20%.
    Cooldown: 5:00

actor-zagara-tier4-support2 =
   .name = Regenerative Cells
   .description = Increases HP regen of all Zerg units by 100%. 

actor-zagara-tier5-option1 =
   .name = 'Fortress' Mutation 
   .description = Increases Zagara's HP by 100%.
   Increases structure armor and damage by a further 20%.

actor-zagara-tier5-option2 =
   .name = Heart of the Swarm
   .description = Produce units for a further 10% cheaper and 20% faster.

   Totaling 20% and 40%.

notification-shield-projection-charging = Shield projection charging.
notification-shield-projection-ready = Shield projection ready.
