// Настройки сервера
dayZ_instance 		= 	24;				// Инстанция (24 - Napf)
dayZ_serverName 	= 	"FireFly";		// Водяной знак
dayz_antihack		=	0;				// DayZ Antihack / 1 = Вкл / 0 = Выкл
dayz_REsec			=	0;				// DayZ RE Security / 1 = Вкл / 0 = Выкл

dayz_ForcefullmoonNights 	= 	false; 		// Луна ночью

// Настройки скриптов
UseWeather = false;
UseRndLoadout = true;
UseSafeZone = true;

if (UseRndLoadout) then
{
	execVM "Scripts\RndLoadout\init.sqf";
};

enableRadio false;
enableSentences false;

#include "configVariables.sqf"

// Черно-Стайл
dayz_POIs 						= 	false; 		// Только для Черно (Сажает ФПС).
dayz_infectiousWaterholes 		= 	false; 		// Только для Черно (Сажает ФПС).
dayz_townGenerator 				= 	false;		// Только для Черно (Сажает ФПС).
dayz_townGeneratorBlackList 	= 	[];

EpochUseEvents = true;		// Использовать Систему Эвентов?
EpochEvents =
[
	 ["any","any","any","any",15,"animated_crash_spawner"]
	,["any","any","any","any",30,"animated_crash_spawner"]
	,["any","any","any","any",45,"animated_crash_spawner"]
];


diag_log '[МИССИЯ]: [init.sqf]: dayz_preloadFinished сброшен';
dayz_preloadFinished = nil;
onPreloadStarted "diag_log [diag_tickTime,'onPreloadStarted']; dayz_preloadFinished = false;";
onPreloadFinished "diag_log [diag_tickTime,'onPreloadFinished']; dayz_preloadFinished = true;";
with uiNameSpace do {RscDMSLoad = nil;};

if (!isDedicated) then
{
	enableSaving [false, false];
	startLoadingScreen ["","RscDisplayLoadCustom"];
	progressLoadingScreen 0;
	dayz_loadScreenMsg	=	localize 'str_login_missionFile';
	progress_monitor	=	[] execVM "\z\addons\dayz_code\system\progress_monitor.sqf";
	0 cutText ['','BLACK',0];
	0 fadeSound 0;
	0 fadeMusic 0;
};

initialized = false;
call compile preprocessFileLineNumbers "Fixes\base\variables.sqf";
progressLoadingScreen 0.05;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.15;
call compile preprocessFileLineNumbers "Fixes\base\compiles.sqf";
progressLoadingScreen 0.25;
call compile preprocessFileLineNumbers "server_traders.sqf";
initialized = true;

setViewDistance 3000;
setTerrainGrid 25;

if (dayz_REsec == 1) then
{
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\REsec.sqf";
};

if (UseWeather) then
{
	execVM "\z\addons\dayz_code\system\DynamicWeatherEffects.sqf";
};
DZE_WeatherVariables = [10, 20, 5, 10, 0, 0.2, 0, 0.7, 0, 0.6, 0, 8, 25, 30, 0, false];

if (isServer) then
{
	if (dayz_POIs && (toLower worldName == "chernarus")) then
	{
		call compile preprocessFileLineNumbers "\z\addons\dayz_code\system\mission\chernarus\poi\init.sqf";
	};

	call compile preprocessFileLineNumbers "\z\addons\dayz_server\system\dynamic_vehicle.sqf";
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\system\server_monitor.sqf";

	execVM "\z\addons\dayz_server\traders\napf.sqf";
	
	if (dayz_infectiousWaterholes && (toLower worldName == "chernarus")) then
	{
		execVM "\z\addons\dayz_code\system\mission\chernarus\infectiousWaterholes\init.sqf";
	};

	if (dayz_townGenerator) then
	{
		execVM "\z\addons\dayz_code\system\mission\chernarus\MainLootableObjects.sqf";
	};
};

if (!isDedicated) then
{
	if (toLower worldName == "chernarus") then
	{
		execVM "\z\addons\dayz_code\system\mission\chernarus\hideGlitchObjects.sqf";
	};
	
	execVM "\z\addons\dayz_code\system\antihack.sqf";
	
	if (UseSafeZone) then
	{
		execVM "Scripts\Other\SafeZone.sqf";
	};

	execVM "Scripts\Other\EscMenuTitle.sqf";
	
	if (dayz_townGenerator) then
	{
		execVM "\z\addons\dayz_code\compile\client_plantSpawner.sqf";
	};
	
	if (Z_singleCurrency) then
	{
		call compile preprocessFileLineNumbers "Scripts\ZSC\init.sqf";
	};

	[] execVM "Scripts\Other\RemoteMessage.sqf";

	execFSM "\z\addons\dayz_code\system\player_monitor.fsm";
	[] call compile preprocessFileLineNumbers "Scripts\DZAI_Client\dzai_initclient.sqf";
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	if (DZE_R3F_WEIGHT) then
	{
		execVM "Scripts\R3F_Realism\R3F_Realism_Init.sqf";
	};

	waitUntil {scriptDone progress_monitor};
	
	cutText ["","BLACK IN", 3];
	3 fadeSound 1;
	3 fadeMusic 1;
	endLoadingScreen;
};