#include "\z\addons\dayz_server\compile\server_toggle_debug.hpp"

sched_co_deleteVehicle =
{
	private "_group";
	_this removeAllMPEventHandlers "mpkilled";
	_this removeAllMPEventHandlers "mphit";
	_this removeAllMPEventHandlers "mprespawn";
	_this removeAllEventHandlers "FiredNear";
	_this removeAllEventHandlers "HandleDamage";
	_this removeAllEventHandlers "Killed";
	_this removeAllEventHandlers "Fired";
	_this removeAllEventHandlers "GetIn";
	_this removeAllEventHandlers "GetOut";
	_this removeAllEventHandlers "Local";
	_this removeAllEventHandlers "Respawn";

	clearVehicleInit _this;
	_group = group _this;
	deleteVehicle _this;

	if (count units _group == 0) then
	{
		deleteGroup _group;
	};

	_this = nil;
};

sched_corpses =
{
	private ["_delQtyG","_delQtyZ","_delQtyP","_addFlies","_x","_deathTime","_onoff","_delQtyAnimal","_sound","_deathPos","_cpos","_animal","_nearPlayer","_delQtyV"];
	// Каждые 2 минуты
	// Удаляем некотролируемых зомби --- Наложим муж на свежие трупы --- Удаляем старые трупы и мух
	_delQtyZ	=	0;
	_delQtyP	=	0;
	_delQtyG	=	0;
	_delQtyV	=	0;
	_addFlies	=	0;
	{
		if (local _x && {_x isKindOf "CAManBase"}) then
		{
			if (_x isKindOf "zZombie_Base") then
			{
				_x call sched_co_deleteVehicle;
				_delQtyZ = _delQtyZ + 1;
			}
			else
			{
				// Спавним мух только на свежие трупы, перезапись удалить труп (Чистка удаляет Призраков при релоге, иногда это не делается автоматически через Arma или onPlayerDisconnect)
				// AI (ботам) надо выдать параметр: setVariable "bodyName" на их трупы, чтобы предотватить чистку трупов
				_deathTime = _x getVariable ["sched_co_deathTime", -1];

				if (_x getVariable["bodyName",""] != "") then
				{
					if (_deathTime == -1) then
					{
						/*_deathPos = _x getVariable ["deathPos",respawn_west_original];
						_cpos = getPosATL _x;
						// Запретить движение более 50 метров или зарытое тело (АнтиЧит)
						if (_deathPos distance _cpos > 50 or _deathPos select 2 < -0.2) then
						{
							diag_log [ __FILE__, "Трупы должны быть перемещены! CID#",(_x getVariable["characterID", "?"]),"От:", _cpos, "На:", _deathPos ];
							//_x setPosATL _deathPos;
						};*/
						_deathTime = diag_tickTime;
						_x setVariable ["sched_co_deathTime", _deathTime];

						if (dayz_enableFlies) then
						{
							_x setVariable ["sched_co_fliesAdded", true];
							_addFlies = _addFlies + 1;
						};
					};

					// 60 минут = Как долго труп будет оставаться на карте
					if (diag_tickTime - _deathTime > 60*60) then
					{
						if (_x getVariable["sched_co_fliesDeleted",false] or !dayz_enableFlies) then
						{
							// Мухи были выключены, мы можем удалить труп
							_sound = _x getVariable ["sched_co_fliesSource", nil];
							
							if !(isNil "_sound") then
							{
								detach _sound;
								deleteVehicle _sound;
							};
							_x call sched_co_deleteVehicle;
							_delQtyP = _delQtyP + 1;
						}
						else
						{
							PVCDZ_flies = [ 0, _x ];
							publicVariable "PVCDZ_flies";
							_x setVariable ["sched_co_fliesDeleted", true];
							// Тело будет удалено при следующем запросе
						};
					}
					else
					{
						// Не спавним мух сразу после смерти. Ждем 10 минут.
						if ((diag_tickTime - _deathTime < 10*60) or !dayz_enableFlies) exitWith {};
						_onoff = 1;

						// Удаляем мух если идет сильный дождь.
						if (rain > 0.25) then
						{
							_onoff = 0;
						};

						// Переключаем звук мух. 
						// Звук должен удаляться и пересоздаваться периодично, потому что новые игроки не слышат звук и перезапись накладывает звук поверх!
						_sound = _x getVariable ["sched_co_fliesSource", nil];
						if !(isNil "_sound") then
						{
							detach _sound;
							deleteVehicle _sound;
							_x setVariable ["sched_co_fliesSource", nil];
							//diag_log "delete sound";
						};

						if (_onoff == 1) then
						{
							_sound = createSoundSource["Sound_Flies",getPosATL _x,[],0];
							_sound attachTo [_x];
							_x setVariable ["sched_co_fliesSource", _sound];
							//diag_log "create sound";
						};
						// Периодически обновляем статус мух, чтобы обновить их визуально
						PVCDZ_flies = [ _onoff, _x ];
						publicVariable "PVCDZ_flies";
					};
				}
				else
				{
					if (_deathTime == -1) then
					{
						_deathTime = diag_tickTime;
						_x setVariable ["sched_co_deathTime", _deathTime];
					}
					else
					{
						// Ждем 30 секунд чтобы точно получить переменную setVariable "bodyName". PVDZ_plr_Death может задерживаться на несколько секунд.
						if (diag_tickTime - _deathTime > 30) then {
							_x call sched_co_deleteVehicle;
							_delQtyG = _delQtyG + 1;
						};
					};
				};
			};
		};

		if (_x in vehicles) then
		{
			_deathTime = _x getVariable ["sched_co_deathTime", -1];

			if (_deathTime == -1) then
			{
				_deathTime = diag_tickTime;
				_x setVariable ["sched_co_deathTime", _deathTime];
			};

			// 5 минут = Как должно уничтоженная техника может оставаться на карте
			if (diag_tickTime - _deathTime > 230*60) then
			{
				{
					deleteVehicle _x
				} forEach (_x nearObjects ["CraterLong",50]);
				_x call sched_co_deleteVehicle;
				_delQtyV = _delQtyV + 1;
			};
		};
	} forEach allDead;

	_delQtyAnimal = 0;
	{
		_animal = _x;
		if (local _animal) then
		{
			_nearPlayer = {isPlayer _x} count (_animal nearEntities ["CAManBase",150]);

			if (_nearPlayer == 0) then
			{
				_animal call sched_co_deleteVehicle;
				_delQtyAnimal = _delQtyAnimal + 1;
			};
		};
	} forEach entities "CAAnimalBase";

	_delQtyGrp=0;
	{
		if (count units _x==0) then
		{
			deleteGroup _x;
			_delQtyGrp = _delQtyGrp + 1;
		};
	} forEach allGroups;
	
#ifdef SERVER_DEBUG
	if (_delQtyZ+_delQtyP+_addFlies+_delQtyGrp+_delQtyG+_delQtyV > 0) then
	{
		diag_log format ["[СЕРВЕР]: [sched_corpses]: [ПЛАНИРОВЩИК]: %1: Удалено неконтролируемых: Зомби: %2 / Животных: %3, %4: Трупов, %7: Призраков, %8: Уничтоженной техники и %5 Пустых групп. Добавлено %6 мух.",__FILE__,
		_delQtyZ,_delQtyAnimal,_delQtyP,_delQtyGrp,_addFlies,_delQtyG,_delQtyV];
	};
#endif

	objNull
};

/*
sched_disconnectedPlayers = {
	private ["_x","_disconnectTime"];
	{
	diag_log (_x);
		if (local _x) then {
			_disconnectTime = _x getVariable ["sched_co_disconnectTime", -1];
			if (_disconnectTime == -1) then {
				_disconnectTime = diag_tickTime;
				_x setVariable ["sched_co_disconnectTime", _disconnectTime];
			};
			if (diag_tickTime - _disconnectTime > dayz_ghostTimer) then {
				if (alive _x) then {
					[_x,nil] call server_playerSync;
				};
				
				dayz_disconnectPlayers = dayz_disconnectPlayers - [_x];
				
				_x call sched_co_deleteVehicle;
			};
			diag_log format["%1 - %2",_x,_disconnectTime];
		};
	} forEach dayz_disconnectPlayers;
	
	objNull
};
*/