sched_sync =
{
	private ["_result","_outcome","_date","_hour","_minute"];
	// Каждые 10 минут
	// Синхронизиуем Локальное время с DLL сервера

	_result		=	"CHILD:307:" call server_hiveReadWrite;
	_outcome	=	_result select 0;

	if (_outcome == "PASS") then
	{
	        _date		=	_result select 1;
	        _hour		=	_date select 3;
	        _minute		=	_date select 4;

	        if (dayz_ForcefullmoonNights) then
			{
				_date = [2018,3,4,_hour,_minute];
	        };

	        setDate _date;
	        dayzSetDate = _date;
	        publicVariable "dayzSetDate";
			
			diag_log [__FILE__, "СИНХРОНИЗАЦИЯ ВРЕМЕНИ: Локальное время установлено:", _date, "Fullmoon:",dayz_ForcefullmoonNights, "Дата передана к HiveExt.dll:", _result select 1];
	};

	objNull
};	
