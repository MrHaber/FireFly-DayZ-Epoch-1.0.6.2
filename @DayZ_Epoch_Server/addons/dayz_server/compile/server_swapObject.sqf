private ["_class","_uid","_charID","_object","_worldspace","_key","_allowed","_obj","_inv","_objectID","_objectUID","_proceed","_activatingplayer","_clientKey","_exitReason","_playerUID"];

if (count _this < 8) exitWith
{
	diag_log "[СЕРВЕР]: [server_swapObject]: Server_SwapObject ошибка: Неверный формат параметра (_this < 8)";
};

_charID				=	_this select 0;
_object				=	_this select 1;
_worldspace			=	_this select 2;
_class				=	_this select 3;
_obj				=	_this select 4;
_activatingplayer	=	_this select 5;
_inv				=	_this select 6;
_clientKey			=	_this select 7;
_proceed			=	false;
_objectID			=	"0";
_objectUID			=	"0";
_playerUID			=	getPlayerUID _activatingPlayer;

_exitReason = [_this,"SwapObject",(_worldspace select 1),_clientKey,_playerUID,_activatingPlayer] call server_verifySender;
if (_exitReason != "") exitWith
{
	diag_log _exitReason
};

if (!isNull(_obj)) then
{
	// Ищем objectID
	_objectID 	= _obj getVariable ["ObjectID","0"];
	// Ищем objectUID
	_objectUID	= _obj getVariable ["ObjectUID","0"];
	if !(DZE_GodModeBase) then
	{
		_obj removeAllMPEventHandlers "MPKilled";
	};
	// Удаляем старый объект
	deleteVehicle _obj;
	
	_proceed = true;
};

if (isNull(_object)) then
{
	_proceed = false;
};

if (_objectID == "0" && _objectUID == "0") then
{ 
	_proceed = false;
}
else
{
	[_objectID,_objectUID] call server_deleteObjDirect;
};

_allowed = [_object, "Server"] call check_publishobject;
if (!_allowed || !_proceed) exitWith
{ 
	if (!isNull(_object)) then
	{
		deleteVehicle _object; 
	};

	diag_log ("[СЕРВЕР]: [server_swapObject]: Неверный объект для Замены (swap) с playerUID:" + _playerUID);
};

// Публикуем переменные
_object setVariable ["CharacterID",_charID,true];
	
//_object setVariable ["ObjectUID",_objectUID,true];
_object setVariable ["OEMPos",(_worldspace select 1),true];

//diag_log ("[СЕРВЕР]: [server_swapObject]: ПУБЛИЧНО: Попытка: " + str(_object));

// Получаем UID
_uid = _worldspace call dayz_objectUID2;

// Посылаем запрос
//_key = str formatText["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0, _charID, _worldspace, [], [], 0,_uid];
_key = str formatText["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0, _charID, _worldspace call AN_fnc_formatWorldspace, _inv, [], 0,_uid]; // Precise Base Building 1.0.5

//diag_log ("[БАЗА ДАННЫХ]: [server_swapObject]: Запись: "+ str(_key));
_key call server_hiveWrite;

_object setVariable ["lastUpdate",diag_tickTime];
_object setVariable ["ObjectUID", _uid,true];
// _object setVariable ["CharacterID",_charID,true];
if (DZE_GodModeBase && {!(_class in DZE_GodModeBaseExclude)}) then
{
	_object addEventHandler ["HandleDamage",{false}];
}
else
{
	_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
};
// Попытка отключить Симуляцию для построек на Серверной стороне
_object enableSimulation false;

dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];

diag_log format["[СЕРВЕР]: [server_swapObject]: ПУБЛИЧНО: Игрок %1(%2) Улучшил или ДаунГрейднул объект на %3 с UID:%4 @%5",(_activatingPlayer call fa_plr2str),_playerUID,_class,_uid,((_worldspace select 1) call fa_coor2str)];