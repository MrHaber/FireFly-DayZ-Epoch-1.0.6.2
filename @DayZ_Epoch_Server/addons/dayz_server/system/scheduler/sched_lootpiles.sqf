#include "\z\addons\dayz_server\compile\server_toggle_debug.hpp"

sched_lootpiles_5m_init =
{
	sched_lp_state		=	0;
	sched_lp_var1		=	0;
	sched_lp_lootTotal	=	0;
	sched_lp_delqty		=	0;
	sched_lp_players	=	[];
	sched_lp_list		=	[];

	objNull
};

sched_lootpiles_5m =
{
	private ["_created","_kind","_x"];
	if (sched_lp_state == 0) then
	{
		sched_lp_list		=	[];
		sched_lp_lootTotal	=	0;
		{
			_kind = _x;
			{
				_created = _x getVariable ["created",-1];
				if (_created == -1) then
				{
					_created = diag_tickTime;
					_x setVariable ["created",_created];
				};

				if (!(_x getVariable ["permaLoot",false]) AND {(diag_tickTime - _created > 1500)}) then
				{
					sched_lp_list set [ count sched_lp_list, _x ];
				};
				sched_lp_lootTotal = sched_lp_lootTotal + 1;
			} forEach allMissionObjects _kind;	
		} forEach ["Blood_Trail_DZ", "ReammoBox", "Land_Fire_DZ", "flamable_DZ"];
		
#ifdef SERVER_DEBUG		
		diag_log ["[СЕРВЕР]: [sched_lootpiles]: [ПЛАНИРОВЩИК]: [sched_lootpiles_5mn]: сброс точек lootpiles, Всего найдено:", sched_lp_lootTotal, "Прослушивается сейчас:", count sched_lp_list];
#endif

		if (count sched_lp_list > 0) then
		{
			sched_lp_state		=	1;
			sched_lp_var1		=	0;
			sched_lp_players	=	+(playableUnits);
		};
	};
	objNull
};

sched_lootpiles =
{
	private ["_plrBatch","_chunkSize","_imax","_plr","_i","_x", "_changed"];
	// Каждые 5 минут, одна из трех задач варьируется между 5 секундами:
	// Смотрим старые LOOTPILES -или- Игнорируем LOOTPILES рядом с _plrBatch игроками -или- удаляем оставщиеся в _chunkSize LOOTPILES 		
	_chunkSize	=	50;
	_plrBatch	=	10;
	switch true do {
		case (sched_lp_state == 1): { // forEach players -> игнорируем лут рядом с игроком
				_imax = (count sched_lp_players) min (sched_lp_var1 + _plrBatch);
				//diag_log format ["[СЕРВЕР]: [sched_lootpiles]: [ПЛАНИРОВЩИК]: %1: lootpiles foreach игроков Из:%2 В:%3 Игроков:%4 Старых:%5 Всего:%6", __FILE__, sched_lp_var1, _imax, count sched_lp_players, count sched_lp_list, sched_lp_lootTotal ];
				for "_i" from sched_lp_var1 to _imax-1 do {
					_plr = (sched_lp_players select _i);

					if (!(isNull _plr) AND {(isPlayer _plr)}) then
					{
						_plr = vehicle _plr;
						{
							if (_x IN sched_lp_list) then
							{
								sched_lp_list = sched_lp_list - [_x];
							};
						} forEach ((getPosATL _plr) nearObjects ["ReammoBox",250]);
					}/*
					else {
						diag_log format [ "%1 Игрок ушел? %2", __FILE__, _x ];
					}*/;
				};

				sched_lp_var1	=	_imax;
				_changed		=	false;
				
				if (_imax == count sched_lp_players) then	// поймать нескольких игроков, которые вошли между тем
				{
					{
						if !(_x in sched_lp_players) then
						{ 
							sched_lp_players set [ count sched_lp_players, _x ];
							_changed = true;
						};
					} forEach playableUnits;
				};

				if (!_changed) then
				{
					sched_lp_state		=	2;
					sched_lp_var1		=	0;
					sched_lp_delqty		=	count sched_lp_list;
#ifdef SERVER_DEBUG		
					diag_log [ "[СЕРВЕР]: [sched_lootpiles]: [ПЛАНИРОВЩИК]: [sched_lootpiles]: Будет удалено",sched_lp_delqty,"lootpiles"];
#endif
				}
				else {
#ifdef SERVER_DEBUG		
					diag_log [ "[СЕРВЕР]: [sched_lootpiles]: [ПЛАНИРОВЩИК]: [sched_lootpiles]: Расширенный цикл для новых игроков", _imax, count sched_lp_players];
#endif
				};
			};
		case (sched_lp_state == 2): {  // forEach оставшиеся lootpiles -> Удалить 
				_imax = (sched_lp_delqty) min (sched_lp_var1 + _chunkSize);
				//diag_log format ["[СЕРВЕР]: [sched_lootpiles]: [ПЛАНИРОВЩИК]:%1: lootpiles foreach Лут будет удален Из:%2 В:%3 Старые:%4 Всего:%5", __FILE__, sched_lp_var1, _imax, sched_lp_delqty, sched_lp_lootTotal ];
				for "_i" from sched_lp_var1 to _imax-1 do {
					_x = sched_lp_list select _i;
					deleteVehicle _x;
				};

				sched_lp_var1 = _imax;

				if (_imax == sched_lp_delqty) then
				{
					sched_lp_state	=	0;
					sched_lp_list	=	[];
#ifdef SERVER_DEBUG		
					diag_log format ["[СЕРВЕР]: [sched_lootpiles]: [ПЛАНИРОВЩИК]: %1: удалено %2 lootpiles. Всего: %3", __FILE__, sched_lp_delqty, sched_lp_lootTotal ];
#endif
				};
			};
	};

	objNull
};

