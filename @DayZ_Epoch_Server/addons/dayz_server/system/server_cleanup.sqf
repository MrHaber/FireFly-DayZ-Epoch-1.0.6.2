_lootype = _this select 0;
_lootobj = _this select 1;
_lootref = _this select 2;

_dateNow = diag_ticktime;

switch (_lootype) do
{
	case "Dropped_Loot":
	{
	/*
		diag_log("[СЕРВЕР]: [server_cleanup]: Сбрасываем лут...");

		_created = (_lootobj getVariable ["created",-0.1]);
		if (_created == -0.1) then
		{
			_lootobj setVariable ["created",diag_ticktime,false];
			_created = diag_ticktime;
		};

		_age		=	(_dateNow - _created);
		_nearby		=	{(isPlayer _lootobj) and (alive _lootobj)} count (_lootobj nearEntities [["CAManBase","AllVehicles"], 130]);

		if ((_nearby==0) then
		{
			if (_age > 20) then
			{
				_remove = true;
			}
			else
			{
				dayz_droppedlootarray set [count dayz_droppedlootarray,_lootobj];
			};
		};
	*/	
		//diag_log("[СЕРВЕР]: [server_cleanup]: Сбрасываем лут...");
		deleteVehicle _lootobj;
	};
	
	case "Spawned_Loot":
	{
		//diag_log("[СЕРВЕР]: [server_cleanup]: Спавним лут...");
		deleteVehicle _lootobj;
	};
	
	case "Perma_Loot":
	{
		//diag_log("[СЕРВЕР]: [server_cleanup]: Perma Loot...");	
	};
};

/*
{

	_Dropped	=	(_x getVariable ["Dropped",false]);
	_Spawned	=	(_x getVariable ["spawnedLoot",false]);
	_Perma		=	(_x getVariable ["permaLoot",false]);

	if (!_Spawned and !_Perma) then
	{
		_x setVariable ["Dropped",true];
	};

	if (_Dropped) then
	{
		_x setVariable ["created",diag_ticktime,false];
		_created = diag_ticktime;
		
		diag_log("[СЕРВЕР]: [server_cleanup]: Сбрасываем лут...");
	};

	if (_Spawned) then
	{
		diag_log("[СЕРВЕР]: [server_cleanup]: Спавним лут...");	
	};

	if (_Perma) then
	{
		diag_log("[СЕРВЕР]: [server_cleanup]: Perma Loot...");		
	};
} foreach _lootingrids;


if (_delQty > 0) then
{
	diag_log ("[СЕРВЕР]: [server_cleanup]: ЧИСТКА: УДАЛЕНО " + str(_delQty) + " ТОЧЕК ЛУТА");
};
*/