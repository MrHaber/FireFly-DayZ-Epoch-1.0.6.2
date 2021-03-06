// spawn server_spawnEvents;

private ["_date","_key","_result","_outcome","_handle","_time","_datestr"];

diag_log("[СЕРВЕР]: [server_spawnEvent.sqf]: Инициализация системы Эвентов...");
EventSchedulerLastTime = "";

epoch_eventIsAny =
{
	private ["_boolReturn","_event","_date","_bool","_index"];
    _event			=	_this select 0;
	_date			=	_this select 1;
	_boolReturn		=	false;
	_index			=	0;
	{
		_bool = false;

		if (typeName _x == "STRING") then
		{
			_boolReturn = true;
		}
		else
		{
			_boolReturn = ((_date select _index) == _x);
		};

		if (!_boolReturn) exitWith {};
		_index = _index + 1;	
	} count _event;
	_boolReturn
};

while {1 == 1} do {
	// Получаем время сервера
	_key		=	"CHILD:307:";
	_result		=	_key call server_hiveReadWrite;
	_outcome	=	_result select 0;

	if(_outcome == "PASS") then
	{
		_date		=	_result select 1;
		_datestr	=	str(_date);
		if (EventSchedulerLastTime != _datestr) then
		{
			// Внутренняя метка времени
			ServerCurrentTime = [(_date select 3), (_date select 4)];

			// Один раз в минуту
			EventSchedulerLastTime = _datestr;

			//diag_log ("[СЕРВЕР]: [server_spawnEvent.sqf]: Локальное время установлено: " + _datestr);
			{
				if (!EpochUseEvents) exitWith {};

				if([[(_x select 0),(_x select 1),(_x select 2),(_x select 3),(_x select 4)],_date] call epoch_eventIsAny) then
				{
					diag_log ("[СЕРВЕР] - [server_spawnEvent.sqf]: ЭВЕНТ: Запуск: " + (_x select 5) + " на времени: " + _datestr);
					_handle = [] execVM "\z\addons\dayz_server\modules\" + (_x select 5) + ".sqf";
				};
			} count EpochEvents;
		};
	};
	uiSleep 10;
};