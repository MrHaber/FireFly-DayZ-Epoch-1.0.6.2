sched_traps =
{
	private ["_n","_x"];
	// Каждые 5 секунд
	// Проверяем статус ловушек
	
	if (!isNil "dayz_traps") then
	{
		_n = 0;
		{
			if ((isNil "_x") OR {(isNull _x)}) then
			{
				dayz_traps = dayz_traps - [_x];
			}
			else
			{
				if (_x getVariable ["armed", false]) then
				{
					if !(_x in dayz_traps_active) then
					{
						["arm", _x] call compile getText (configFile >> "CfgVehicles" >> typeOf _x >> "script");

						if !(_x in dayz_traps_active) then
						{
							dayz_traps_active set [count dayz_traps_active, _x];
						};
						_n = _n + 1;
					};
				}
				else
				{
					if (_x in dayz_traps_active) then
					{
						["disarm", _x] call compile getText (configFile >> "CfgVehicles" >> typeOf _x >> "script");

						if (_x in dayz_traps_active) then
						{
							dayz_traps_active = dayz_traps_active - [_x];
						};
						_n = _n + 1;
					};
				};
			};
		} forEach dayz_traps;

		if (_n > 0) then
		{
			diag_log format ["[СЕРВЕР]: [sched_traps]: [ПЛАНИРОВЩИК]: %1: ловушки обновлены, изменено %2 состояний", __FILE__, _n];
		};
	};

	objNull
};