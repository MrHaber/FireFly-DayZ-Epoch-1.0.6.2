/*
	PVEH не предоставляет никакой информации об отправителе в A2, это
	необходимо для проверки ВЕРИФИКАЦИИ отправителя (чтобы не было подмены).
	
	Это нужно чтобы определить и помешать Читеру использовать массовое удаление или создание запросами в Базу Данных с помощью PVS.
*/

private ["_clientKey","_exitReason","_function","_index","_objPos","_params","_player","_playerUID"];

_params		=	_this select 0;
_function	=	"Server_" + (_this select 1);
_objPos		=	_this select 2;		//Может быть Объектом или Позицией
_clientKey	=	_this select 3;
_playerUID	=	_this select 4;
_player		=	_this select 5;

_index = dayz_serverPUIDArray find _playerUID;

_exitReason = switch true do {
	// Если объект или Игрок является Нуль (is Null), то дистанция вернется 9999+
	// Если объект или Игрок был перемещен через setPos на клиенте, то позиция будет получена через секунду для обновления информации на сервер a second
	// Координаты могут использоваться вместо объекта

	case (_objPos distance _player > (Z_VehicleDistance + 10)): {
		format["[СЕРВЕР]: [server_verifySender]: ВЕРИФИКАЦИЯ: ФУНКЦИЯ %1 ПОЛУЧИЛА ОШИБКУ: ВЕРИФИКАЦИЯ НЕ ПРОШЛА, ИГРОК ДАЛЕКО ОТ ОБЪЕКТА. PV ARRAY: %2",_function,_params]
	}; 

	case (_index < 0): {
		format["[СЕРВЕР]: [server_verifySender]: ВЕРИФИКАЦИЯ: ФУНКЦИЯ %1 ПОЛУЧИЛА ОШИБКУ: PUID НЕ НАЙДЕН НА СЕРВЕРЕ. PV ARRAY: %2",_function,_params]
	};

	case (((dayz_serverClientKeys select _index) select 0 != owner _player) or ((dayz_serverClientKeys select _index) select 1 != _clientKey)): {
		format["[СЕРВЕР]: [server_verifySender]: ВЕРИФИКАЦИЯ: ФУНКЦИЯ %1 ПОЛУЧИЛА ОШИБКУ: КЛЮЧ АВТОРИЗАЦИИ КЛИЕНТА НЕВЕРНЫЙ ИЛИ НЕУЗНАВАЕМЫЙ! PV ARRAY: %2",_function,_params]
	};
	default {""};
};

_exitReason