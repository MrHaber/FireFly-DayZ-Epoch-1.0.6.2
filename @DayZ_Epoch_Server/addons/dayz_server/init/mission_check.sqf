// Фикс от перезаписи файлов миссии. A2OA.
// Этот баг должен быть исправлен EOL патче.
// Подключен в dayz_server\init\server_functions.sqf

_files =
[
	 'configVariables.sqf'
	,'description.ext'
	,'init.sqf'
	,'mission.sqm'
	,'rules.sqf'
	,'server_traders.sqf'
	
	,'Scripts\Other\Safezone.sqf'
	
	,'HPP\Ultima_Admins_Menu.hpp'
	
	,'Configs\CfgLoot\Buildings\Boat.hpp'
	,'Configs\CfgLoot\Buildings\Castle.hpp'
	,'Configs\CfgLoot\Buildings\Church.hpp'
	,'Configs\CfgLoot\Buildings\Construction.hpp'
	,'Configs\CfgLoot\Buildings\CrashSite.hpp'
	,'Configs\CfgLoot\Buildings\Farm.hpp'
	,'Configs\CfgLoot\Buildings\Hospital.hpp'
	,'Configs\CfgLoot\Buildings\Hunting.hpp'
	,'Configs\CfgLoot\Buildings\Industrial.hpp'
	,'Configs\CfgLoot\Buildings\InfectedCamp.hpp'
	,'Configs\CfgLoot\Buildings\Military.hpp'
	,'Configs\CfgLoot\Buildings\Misc.hpp'
	,'Configs\CfgLoot\Buildings\Office.hpp'
	,'Configs\CfgLoot\Buildings\Powerlines.hpp'		// Вообще не требуется, ибо отключен в CfgBuildingLoot.hpp , но все же впишу
	,'Configs\CfgLoot\Buildings\Residential.hpp'
	,'Configs\CfgLoot\Buildings\ResidentialRuins.hpp'
	,'Configs\CfgLoot\Buildings\Roaming.hpp'
	,'Configs\CfgLoot\Buildings\Supermarket.hpp'
	,'Configs\CfgLoot\Buildings\Toilet.hpp'
];

_list = [];
{
	_file	=	toArray (toLower(preprocessFile _x));
	_sum	=	0;
	_count	=
	{
		_sum = _sum + _x; true
	} count _file;

	if (_count > 999999) then
	{
		_count = _count mod 999999
	};

	if (_sum > 999999) then
	{
		_sum = _sum mod 999999
	};
	_list set [count _list,[_count,_sum]];
} forEach _files;

// Проверка целостности миссии на всех клиентах
_temp = "HeliHEmpty" createVehicle [0,0,0];
_temp setVehicleInit (str formatText["
	if (isServer) exitWith {};
	
	_list = [];
	{
		_file	=	toArray (toLower(preprocessFile _x));
		_sum	=	0;
		_count	=
		{
			_sum = _sum + _x; true
		} count _file;

		if (_count > 999999) then
		{
			_count = _count mod 999999
		};

		if (_sum > 999999) then
		{
			_sum = _sum mod 999999
		};
		_list set [count _list,[_count,_sum]];
	} forEach %1;
	
	_file = -1;
	{
		if ((_x select 0 != (_list select _forEachIndex) select 0) or (_x select 1 != (_list select _forEachIndex) select 1)) then
		{
			_file = _forEachIndex;
		};
	} forEach %2;

	if (_file != -1) then
	{
		MISSION_CHECK = if ((_list select _file) select 0 < 49999) then
		{
			preprocessFileLineNumbers (%1 select _file)
		}
		else
		{
			'ОЧЕНЬ БОЛЬШОЙ ФАЙЛ'
		};

		publicVariableServer 'MISSION_CHECK';

		[] spawn
		{
			uiSleep 1;

			{
				(findDisplay _x) closeDisplay 2;
			} count [0,8,12,18,46,70];
		};
	};
",_files,_list]);

processInitCommands;