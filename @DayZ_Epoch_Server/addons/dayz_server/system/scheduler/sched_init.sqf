_base="z\addons\dayz_server\system\scheduler\";

call compile preprocessFileLineNumbers (_base+"sched_corpses.sqf");
call compile preprocessFileLineNumbers (_base+"sched_lootpiles.sqf");
call compile preprocessFileLineNumbers (_base+"sched_sync.sqf");
call compile preprocessFileLineNumbers (_base+"sched_safetyVehicle.sqf");

[
	// Период	Оффсет	Код <-> ctx					init код ->ctx
	 [ 120,	 	224,	sched_corpses ],
	 [ 180,	 	336,	sched_lootpiles_5m,         sched_lootpiles_5m_init ],
	 [ 120,	 	340,	sched_lootpiles ],
	 [ 600,		0,		sched_sync ],
	 [ 180,		48,		sched_safetyVehicle ]
] execFSM ("z\addons\dayz_code\system\scheduler\scheduler.fsm");

diag_log [ __FILE__, "Scheduler started"];




/*
	// (see ViralZeds.hpp -> zombie_agent.fsm -> zombie_findOwner.sqf), вызывается когда зомби становится "local" на сервере после дисконнекта
	zombie_findOwner =
	{
		(_this select 0) call fa_deleteVehicle;
	};
*/

