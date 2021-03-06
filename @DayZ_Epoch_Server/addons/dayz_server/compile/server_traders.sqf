private ["_clientID","_character","_traderid","_retrader","_data","_result","_status","_val","_key"];
//[dayz_characterID,_tent,[_dir,_location],"TentStorage"]
_character	=	_this select 0;
_traderid	=	_this select 1;

_clientID = owner _character;
//diag_log ("[БАЗА ДАННЫХ]: [server_traders]: Меню запрошено с ClientID: "+ str(_clientID));

// Добавляем кэш
_retrader = call compile format["ServerTcache_%1;",_traderid];

if (isNil "_retrader") then
{
	_retrader = [];

	_key	=	format["CHILD:399:%1:",_traderid];
	_data	=	"HiveEXT" callExtension _key;

	//diag_log "[БАЗА ДАННЫХ]: [server_traders]: Запрос отправлен";

	// Результат
	_result		=	call compile format ["%1",_data];
	_status		=	_result select 0;

	if (_status == "ObjectStreamStart") then
	{
		_val = _result select 1;
		// Обрабатываем
		//diag_log ("[БАЗА ДАННЫХ]: [server_traders]: Начинаем обработку Меню...");
		call compile format["ServerTcache_%1 = [];",_traderid];
		for "_i" from 1 to _val do {
			_data		=	"HiveEXT" callExtension _key;
			_result		=	call compile format ["%1",_data];
			call compile format["ServerTcache_%1 set [count ServerTcache_%1,%2]",_traderid,_result];
			_retrader set [count _retrader,_result];
		};
		//diag_log ("[БАЗА ДАННЫХ]: [server_traders]: Обработано " + str(_val) + " объектов");
		
	};
};

// diag_log(_retrader);
PVDZE_plr_TradeMenuResult = _retrader;

if (!isNull _character) then
{
	_clientID publicVariableClient "PVDZE_plr_TradeMenuResult";
};