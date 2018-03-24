USE_CANBUILD	=	false;		// Безопасные зоны в местах где нельзя строить?
USE_TraderCity	=	false;		// Безопасные зоны в стандартных местах эпоча?
USE_POSITIONS	=	true;		// to use own positions and radius
USE_AI_REMOVER	=	true;		// use this to remove Missionbots (AI) within 100m of a player if the player is in a SafeZone
USE_AntiSteal	=	true;		// Использовать блокировку открытия инвентаря, если другой игрок рядом?
USE_SPEEDLIMIT	=	true;		// very secret function, nobody is supposed to find out what it does.
    SPEEDLIMIT	=	40;			// Only used if USE_SPEEDLIMIT is true.
LOG_EnterLeave	=	false;		// Логгировать Вход и выход из Торговой зоны?
/* You can use USE_CANBUILD or/and (works together) the custom positions below (USE_POSITIONS) [position or zone,radius] */
_infiSZ =
[
     [[7665,  11765, 0], 150]		// Бандит
	,[[15930, 10400, 0], 150]		// Герой
	,[[3160,  12110, 0], 200]		// Церковь
	,[[9670,  2955,  0], 200]		// Гора
	,[[10580, 13110, 0], 200]		// Бункер
	,[[13155, 6395,  0], 200]		// Сторож
];

{
	DZE_SafeZonePosArray set [(count DZE_SafeZonePosArray), [(_x select 0), (_x select 1)]];
} forEach _infiSZ;

waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_gui'))};
uiSleep 2;

if (isNil 'inSafeZone') then
{
	inSafeZone = false;
}
else
{
	if (typename inSafeZone != 'BOOL') then
	{
		inSafeZone = false;
	};
};

[_infiSZ] spawn
{
	_infiSZ = _this select 0;

	_startSafeZone =
	{
		if (isNil 'outNow') then
		{
			_msg = 'Вы вошли в безопасную зону!';
			hint _msg;
			taskHint [_msg, [0,1,0,1], 'taskDone'];
			inNow = nil;
			outNow = true;

			if (LOG_EnterLeave) then
			{
				PVDZ_send = [player,'SafeZoneState',[1]];
				publicVariableServer 'PVDZ_send';
			};
		};

		player_fired =
		{
            deleteVehicle (nearestObject [_this select 0,_this select 4]);
            cutText ['Вы не можете стрелять в безопасной зоне!','WHITE IN'];
        };
		//wild_spawnZombies = {};
		zombie_generate = {};
        fnc_usec_damageHandler = {};

		player removeAllEventHandlers 'handleDamage';
		player addEventHandler ['handleDamage', {false}];
		player allowDamage false;

		_veh = vehicle player;
		_szs = _veh getVariable ['inSafeZone',0];

		if (_szs == 0) then
		{
			_veh setVariable ['inSafeZone',1,true];

			if (player != _veh) then
			{
				_veh removeAllEventHandlers 'Fired';
				_veh addEventHandler ['Fired', {_this call player_fired;}];
				{
					_x removeAllEventHandlers 'Fired';
					_x addEventHandler ['Fired', {_this call player_fired;}];
				} forEach (crew _veh);
				fnc_veh_handleDam = {false};
				_veh removeAllEventHandlers 'HandleDamage';
				_veh addeventhandler ['HandleDamage',{ _this call fnc_veh_handleDam } ];
				_veh allowDamage false;
			};
		};

		_notInSafeZone =
        [
			'MAAWS','RPG7V','M136','RPG18','STINGER',
			'MeleeBaseball','MeleeHatchet','MeleeCrowbar','MeleeMachete','MeleeFishingPole','MeleeSledge',
			'MeleeBaseBallBatNails','MeleeBaseBallBatBarbed','MeleeBaseBallBat'
		];

		_cwep = currentWeapon player;

		if (_cwep in _notInSafeZone) then
		{
			_swep = '';
			{
				if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
				{
					_swep = _x;
				};
			} forEach (weapons player);

			if (_swep == '') then
			{
				player playActionNow 'PutDown';
				_iPos = getPosATL player;
				_radius = 1;
				_removed = ([player,_cwep,1] call BIS_fnc_invRemove);

				if (_removed == 1) then
				{
					_item = createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
					_item addWeaponCargoGlobal [_cwep,1];
				};
			}
			else
			{
				player selectweapon _swep;
			};
		};
	};

	_endSafeZone =
	{
		if (isNil 'inNow') then
		{
			if (str fnc_usec_damageHandler == '{}') then
			{
				_msg = 'Вы покинули безопасную зону!';
				hint _msg;
				taskHint [_msg, [1,0,0.1,1], 'taskFailed'];
			};
			inNow = true;
			outNow = nil;

			if (LOG_EnterLeave) then
			{
				PVDZ_send = [player,'SafeZoneState',[0]];
				publicVariableServer 'PVDZ_send';
			};
		};
		//wild_spawnZombies = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\wild_spawnZombies.sqf';
		zombie_generate = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\zombie_generate.sqf";

		player_fired =
		{
			_this call compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
			_unit			=	_this select 0;
			_weapon			=	_this select 1;
			_muzzle			=	_this select 2;
			_mode			=	_this select 3;
			_ammo			=	_this select 4;
			_magazine		=	_this select 5;
			_projectile		=	_this select 6;
			_screenToWorld	=	screenToWorld [0.5,0.5];
			_near			=	_screenToWorld nearEntities ['AllVehicles',100];
			{
				if (isPlayer _x) then
				{
					_szs = _x getVariable ['inSafeZone',0];

					if (_szs == 1) then
					{
						deleteVehicle (nearestObject [_unit,_ammo]);
					};
				};
			} forEach _near;
		};

		fnc_usec_unconscious	=	compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
		object_monitorGear		=	compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
		fnc_veh_handleDam		=	compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\veh_handleDam.sqf';

		_veh = vehicle player;
		_szs = _veh getVariable ['inSafeZone',0];

		if (_szs == 1) then
        {
			_veh setVariable ['inSafeZone',0,true];

			if (player != _veh) then
            {
				_veh removeAllEventHandlers 'HandleDamage';
				_veh addeventhandler ['HandleDamage',{ _this call fnc_veh_handleDam } ];
				_veh allowDamage true;
			};
		};

		_end = false;

		if (isNil 'gmadmin') then
		{
			_end = true;
		}
		else
		{
			if (gmadmin == 0) then
			{
				_end = true;
			};
		};

		if (_end) then
		{
			player allowDamage true;
			fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
			player removeAllEventHandlers 'HandleDamage';
			player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
		};
	};

	while {1 == 1} do
	{
		if (isNil 'inSafeZone') then
		{
			inSafeZone = false;
		}
		else
		{
			if (typename inSafeZone != 'BOOL') then
			{
				inSafeZone = false;
			};
		};

		_state = false;

		if (isNil 'USE_POSITIONS') then
		{
			USE_POSITIONS = false;
		}
		else
		{
			if (typename USE_POSITIONS != 'BOOL') then
			{
				USE_POSITIONS = false;
			};
		};

		if (USE_POSITIONS) then
        {
            {
				_z = _x select 0;
				_r = _x select 1;

				if ((vehicle player) distance _z < _r) then
				{
					_state = true;
				};
			} forEach _infiSZ;
		};

		if (isNil 'USE_CANBUILD') then
		{
			USE_CANBUILD = true;
		}
		else
		{
			if (typename USE_CANBUILD != 'BOOL') then
			{
				USE_CANBUILD = true;
			};
		};

		if (USE_CANBUILD) then
		{
			if (isNil 'canbuild') then
			{
				canbuild = true;
			}
			else
			{
				if (typename canbuild != 'BOOL') then
				{
					canbuild = true;
				};
			};

			if (!canbuild) then
			{
				_state = true;
			};
		};
        if (isNil 'USE_TraderCity') then { USE_TraderCity = true; } else { if (typename USE_TraderCity != 'BOOL') then { USE_TraderCity = true; }; };
        if (USE_TraderCity) then
        {
            if (isNil 'isInTraderCity') then { isInTraderCity = false; } else { if (typename isInTraderCity != 'BOOL') then { isInTraderCity = false; }; };
            if (isInTraderCity) then {_state = true;};
        };
        if (_state) then
        {
            inSafeZone = true;
            call _startSafeZone;
            {
                if (!isNull _x) then
                {
                    if !(isPlayer _x) then
                    {
                        deletevehicle _x;
                    };
                };
            } forEach ((vehicle player) nearEntities ['zZombie_Base',50]);
            
            if (isNil 'USE_AI_REMOVER') then { USE_AI_REMOVER = false; } else { if (typename USE_AI_REMOVER != 'BOOL') then { USE_AI_REMOVER = false; }; };
            if (USE_AI_REMOVER) then
            {
                {
                    if ((!isNull group _x) && (getPlayerUID _x == '')) then
                    {
                        deleteVehicle _x;
                    };
                } forEach (player nearEntities ['Man',100]);
            };
        }
        else
        {
            inSafeZone = false;
        };
        uiSleep 2;
        if (!inSafeZone) then
        {
            call _endSafeZone;
        };
    };
};

if ((USE_AntiSteal) || (USE_SPEEDLIMIT)) then
{
	[] spawn
	{
		_USE_AntiSteal		=	USE_AntiSteal;
		_USE_SPEEDLIMIT		=	USE_SPEEDLIMIT;
		_speedlimit			=	SPEEDLIMIT;

		while {1 == 1} do
		{
			if (inSafezone) then
			{
				if (_USE_AntiSteal) then
				{
					_cnt = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'],4]);

					if ((_cnt > 0) && (!isNull (findDisplay 106))) then
					{
						(findDisplay 106) closedisplay 0;
						closeDialog 0;
						closeDialog 0;
						closeDialog 0;

						_log = format['%1 Вы не можете открывать рюкзак рядом с другим игроком!',name player];
						cutText [_log,'PLAIN'];
						hint _log;
					};
				};

				if (_USE_SPEEDLIMIT) then
				{
					_obj = vehicle player;

					if !(_obj isKindOf 'Plane') then
					{
						_speed = abs speed _obj;

						if ((_obj != player) && (_speed > _speedlimit)) then
						{
							_vel = velocity _obj;
							_x = 0.8;
							
							if (_speed > 50) then
							{
								_x = 0.1;
							};
							_velNew = [(_vel select 0) * _x, (_vel select 1) * _x,(_vel select 2) * _x];
							_obj SetVelocity _velNew;
						};
					};
				};
			}
			else
			{
				uiSleep 2;
			};
		};
	};
};