/*
	DZAI Файл конфигурации
	Описание: Содержит всевозможные допустимые настройки DZAI.
*/

diag_log "[СЕРВЕР]: [DZAI]: [dzai_config]: Чтение файла конфигурации DZAI.";

/*	DZAI Настройки */	
// Откладка о DZAI в arma2oaserver.rpt. Уровень откладки. 0: откладка Отключена, 1: Базовая откладка, 2: Расширенная откладка. (По умолчанию: 0)
DZAI_debugLevel = 0;

// Частота обновления информации об откладке в RPT. О группах, маркерах, ботах и т.п. (По умолчанию: 300, 0 = Отключить)
DZAI_monitorRate = 300;

// Сканировать КлассНеймы лута. Если КлассНейм будет неверный, то система сообщит об этом в РПТ и удалит у ботов такой КлассНейм. (По умолчанию: true)
DZAI_verifyTables = true;

// (Функция в разработке) Улучшенное сканирование КлассНеймов. (По умолчанию: false)
DZAI_extendedVerify = false;

// Включить, чтобы сервер спавнил объекты / зданиях, которые обычно спавнились на стороне клиента через DayZ's CfgTownGenerator. Это избавит от проблемы, когда AI ходят/стреляют через объекты. (По умолчанию: true)	
// Если запущен DayZ Mod ("vanilla DayZ") или DayZ Overwatch, то рекомендуется включить эту опцию, так как многие дополнительные здания обрабатываются CfgTownGenerator. Не используется с Epoch.							
DZAI_objPatch = true;

// Через сколько удалять трупы/технику ботов. Если игрок будет рядом с трупом, то таймер пойдет заново! (По умолчанию: 900).	
// Внимание: Иные скрипты чистки игнорируют этот параметр!									
DZAI_cleanupDelay = 1800;									

// Авто-определение мода. Чтобы лучше работало DZAI_verifyTables.
DZAI_modAutoDetect = true;


/*	AI Настройки Юнитов */		

// Улучшенная система крови. 
// Включено - AI используют систему DayZ 12,000 крови, могут быть оглушены, Тизер и могут использовать медицину. Отключено - используется система от Arma 2. (По умолчанию: true)
DZAI_useHealthSystem = true;

// Мин/макс значение крови при спавне AI. Значение берется случайно между двумя диапазонами. Лимит: 12000 крови (По умолчанию: [10000,12000])
// Внимание: Не работает если DZAI_useHealthSystem = false
DZAI_unitBloodLevel = [8000,12000];

// Количество крови, добавляемое при полном само-лечении. Значение делится на 3 подхода. Внимание: Только пехотное могут использовать. (По умолчанию: 6000)
// Внимание: Не работает если DZAI_useHealthSystem = false
DZAI_unitHealAmount = 2000;

// Минимальный предел крови, когда AI будут лечиться и восстанавливать кровь от DZAI_unitHealAmount. Полное лечение занимает 9 секунд и и может быть прервано, если AI потеряет сознание. (По умолчанию: 5000)
// Внимание: Не работает если DZAI_useHealthSystem = false
DZAI_lowBloodLevel = 4000;

// Если AI стреляют, то зомби бегут на их звук. Не работает если DZAI_zombieEnemy = false. ВНИМАНИЕ!!! Включение этого параметра может вызывать проблемы с производительностью сервера.
// Внимание: AI не могут быть атакованными от зомби.(По умолчанию: false)		
DZAI_weaponNoise = false;

// Включить - AI будут пытаться искать Убийцу своего Товарища/Командира своей группы. Игроки, которые имеют радио будут получать сообщения об этом (По умолчанию: true)
DZAI_findKiller = true;

// Включить - AI будут использовать ПНВ ночью. При смерти AI ПНВ удалиться. (По умолчанию: false).									
DZAI_tempNVGs = false;	

// Количество Человечности за убийство AI (По умолчанию: 0)									
DZAI_humanityGain = 0;										

// Включить - AI будут использовать радиосообщения. (По умолчанию: true)
DZAI_radioMsgs = false;

// Включить - Последний AI из своей группы, получит Прирост умений, как последний выживщий. Не работает если AI отспавнился один (По умолчанию: false)
DZAI_lastManStanding = true;


/*DZAI client-side настройки. 
**ВНИМАНИЕ**: Эти параметры должны совпадать с параметрами в вашей папке с Миссией.
*/	

// Включить - Использовать client-side radio addon для радио-сообщений. (По умолчанию: false)
DZAI_clientRadio = false;

// Включить - AI будут атаковать Зомби рядом. (По умолчанию: false)
DZAI_zombieEnemy = true;	

// Максимальная дистанция (в метрах) когда лидер группы AI будет замечать зомби. Чем больше значение - тем больше проблем с производительностью сервера. (По умолчанию: 150)							
DZAI_zDetectRange = 30;

// Включить - Сообщения об убистве AI в системный чат. Формат: "(Unit name) был убит." (По умолчанию: false)
DZAI_deathMessages = false;									


/*	Настройка Статичных AI */	
// Включить - AI будут спавнииться в Городах, пригородках и других предопределенный зонах. Не влияет на Кастомные настройки (По умолчанию: true).
DZAI_staticAI = true;

// Мин/макс время (в секундах) при новом спавне после смерти. Работает для Статичных AI и Кастомных AI (По умолчанию: Min 300, Max 600).									
DZAI_respawnTimeMin = 1800;
DZAI_respawnTimeMax = 3600;

// Время (в секундах) ДоСпавна AI, если игрока нет рядом. Работает для Статичных AI и Кастомных AI (По умолчанию: 120)										
DZAI_despawnWait = 2700;										

// Лимит РеСпавна. Установите -1 чтобы отключить лимит. (По умолчанию: -1 для каждого).
DZAI_respawnLimit0 = 3; 	// Респавн AI на полях и деревнях
DZAI_respawnLimit1 = 2; 	// Респавн AI в городах и среднедопустимых зонах
DZAI_respawnLimit2 = 1; 	// Респавн AI в около-военных территориях
DZAI_respawnLimit3 = 0; 	// Респавн AI в самых важных точках, где топовый лут

// Шанс РеСпавна (Работает по принципу DZAI_respawnLimit0 к DZAI_spawnChance0)
DZAI_spawnChance0 = 1;
DZAI_spawnChance1 = 0.75;
DZAI_spawnChance2 = 0.50;
DZAI_spawnChance3 = 0.25;


/*	Настройка Динамичных AI */
// Включить - AI будут спавниться случайно рядом с игроком. (По умолчанию: true)									
DZAI_dynAISpawns = false;

// Время (в секундах), для достижения максимальной вероятности появления на игрока, после чего вероятность сбрасывается до 0%. Нижнее число = более частые появления, более высокое число = менее частые. (Рекомендуется: 1200-2700, По умолчанию: 1200)
DZAI_maxSpawnTime = 1200;

// Время (в секундах), чтобы каждый игрок мог сохранить максимальную вероятность появления. (По умолчанию: 1200).
DZAI_keepMaxSpawnTime = 1200;

// Вероятность AI активно охотиться на целевого игрока. Если проверка вероятности не удалась, AI будет патрулировать область вместо охоты (По умолчанию: 0.50)
DZAI_huntingChance = 0.50;

// Шанс подкрепления для AI группы. Не работает если DZAI_maxHeliPatrols = 0. (По умолчанию: 0.50)
DZAI_heliReinforceChance = 0.50;

// Массив зон, где AI не будут спавниться или преследовать игрока (Пример: ["BlacklistArea1","BlacklistArea2","BlacklistArea3"])
// Epoch: DZAI Добавляет 200м-радиус blacklist зон рядом с торговыми зонами.
DZAI_dynAreaBlacklist = [];

// Время (в секундах) ДоСпавна AI, если игрока нет рядом. (По умолчанию: 120)
DZAI_dynDespawnWait = 120;

// Включить Спавн AI рядом с точкой спавна игрока (600м). (По умолчанию: false)
DZAI_freshSpawnSafeArea = false;


/* Дополнительные настройки AI (Дополение в разработке) */		

// Максимальное количество ботов на карте
DZAI_maxRandomSpawns = 50;

// Время (в секундах) ДоСпавна AI, если игрока нет рядом. (По умолчанию: 120)
DZAI_randDespawnWait = 300;

// Массив зон, где AI не будут спавниться или преследовать игрока (Пример: ["BlacklistArea1","BlacklistArea2","BlacklistArea3"])
// Epoch: DZAI Добавляет 200м-радиус blacklist зон рядом с торговыми зонами.
// Tip: DZAI_randAreaBlacklist = DZAI_dynAreaBlacklist;
DZAI_randAreaBlacklist = [];


/*	AI Воздушный патруль*/		

// Количество вертолетов по карте. 0 - отключить (По умолчанию: 0).							
DZAI_maxHeliPatrols = 0;

// Установите Мин/макс (в секундах) значение Спавна нового вертолета. Когда прошлый вертолет был Уничтожен или обездвижен. (По умолчанию: Min 600, Max 900).
DZAI_respawnTMinA = 1800;
DZAI_respawnTMaxA = 3600;

// Classnames воздушной техники, укажите сколько мест в технике для ботов.
DZAI_heliList =
[
	 ["UH1H_DZ",5]
	,["Mi17_DZ",5]
];

// Уровень воздушного патруля. Уровень влияет на loadout и loot. Значение: 0 до 3 (По умолчанию: 3)
DZAI_heliUnitLevel = 3;

// Maximum number of gunner units per air vehicle. Лимит. (По умолчанию: 2)
DZAI_heliGunnerUnits = 3;

//Specify vehicle weapon for air vehicles that are unarmed by default. DZAI will arm these air vehicles with the specified weapons upon spawning each vehicle.
//Weapon classnames are verified. If the classname is invalid (banned or nonexistent), it will not be added to the vehicle.
//Format: Each row containing a vehicle classname will be equipped with the weapon from the corresponding row in weapon classnames section. DZAI will automatically select ammo type.
DZAI_airWeapons = [
	//Air vehicle classnames (Remember: no comma for last entry! Otherwise, separate each string with commas)
	["Helicopter1_Example_Classname","Helicopter2_Example_Classname"]
	,
	//Corresponding weapon classnames (Remember: no comma for last entry! Otherwise, separate each string with commas)
	["Helicopter1_Example_Weapon","Helicopter2_Example_Weapon"]
];


/*AI Land vehicle patrol settings. These AI vehicles will randomly travel between different cities and towns.
--------------------------------------------------------------------------------------------------------------------*/	

//Global maximum number of active AI land vehicle patrols. Set at 0 to disable (По умолчанию: 0).	
DZAI_maxLandPatrols = 2;

//Set minimum and maximum wait time in seconds to respawn an AI vehicle patrol after vehicle is destroyed or disabled. (По умолчанию: Min 600, Max 900).
DZAI_respawnTMinL = 600;
DZAI_respawnTMaxL = 900;

//Classnames of land vehicle types to use, with the maximum amount of each type to spawn.
DZAI_vehList = [
	["Tractor",1]
	,["tractorOld",1]
	,["Skoda",4]
	,["SkodaBlue",2]
	,["SkodaRed",2]
	,["SkodaGreen",3]
];

//Difficulty level of land vehicle patrol units. Difficulty level also affects unit loadout and loot. Possible values: 0 to 3 (По умолчанию: 3)
DZAI_vehUnitLevel = 3;

//Maximum number of gunner units per land vehicle. Limited by actual number of available gunner positions. (По умолчанию: 1)
DZAI_vehGunnerUnits = 2;

//Maximum number of cargo units per land vehicle. Limited by actual number of available cargo positions. (По умолчанию: 3)
DZAI_vehCargoUnits = 3;


/*	AI Vehicle (Air & Land) Settings
--------------------------------------------------------------------------------------------------------------------*/

//Array of area blacklist markers. Areas covered by marker will not be used as waypoints for vehicle patrols. (Example: ["BlacklistArea1","BlacklistArea2","BlacklistArea3"])
//Note: Vehicles may still pass through these areas but will not make stops unless enemies are encountered.
DZAI_waypointBlacklist = [];


/*	AI weapon selection settings
--------------------------------------------------------------------------------------------------------------------*/

//True: Dynamically generate AI weapon list from CfgBuildingLoot (DayZ loot tables). False: Use preset weapon tables located near the end of this file. (По умолчанию: true).
//Highly recommended to enable DZAI_verifyTables if this option is set to false. 
DZAI_dynamicWeaponList = true;

//Determines whether DZAI reads from default DayZ loot tables for dynamic AI weapon generation or from user-installed custom loot tables. (По умолчанию: false)
//No effect if DZAI_dynamicWeaponList is 'false'. If DZAI is unable to find custom loot tables installed, default loot tables will be used instead. If no loot tables are found, DZAI will use prebuilt weapon tables.
DZAI_customLootTables = false;

//List of classnames of weapons that AI should never use. By default, AI may carry any lootable weapon. (Only if DZAI_dynamicWeaponList = true)  
//Example: DZAI_banAIWeapons = ["M107_DZ","BAF_AS50_scoped"] will remove the M107 and AS50 from AI weapon tables if dynamic weapon list is enabled.								
//Note: It is recommended to add all melee weapon classnames into this list as AI have issues using melee weapons. 
//Pre-banned weapons by DZAI: "Crossbow_DZ","Crossbow","MeleeHatchet","MeleeCrowbar","MeleeMachete","MeleeBaseball","MeleeBaseBallBat","MeleeBaseBallBatBarbed","MeleeBaseBallBatNails"
DZAI_banAIWeapons = [];										

//List of launcher-type weapons for mid/high-level AI to use (by default, weapongrade 1/2/3), example: ["M136"]. If left empty, AI will not use launcher weapons. (По умолчанию: [])
//If AI encounter an armored player vehicle, they will switch to a randomly-selected launcher-type weapon to engage.
//Weapon classnames added here are verified if DZAI_verifyTables is set to true. Note: Launcher weapons are removed from the AI unit upon death.
DZAI_launcherTypes = [];	

//List of AI weapongrades that are permitted to use launcher-type weapons. Individual custom weapongrade levels may be added to allow launcher use (По умолчанию: [1,2,3])
DZAI_launcherLevels = [1,2,3];								

//Limit of number of launcher-type weapons to add to each AI group. Groups cannot have more launcher weapons than their weapongrade value (По умолчанию: 1).
DZAI_launchersPerGroup = 1;


/*	AI loot quantity settings
--------------------------------------------------------------------------------------------------------------------*/

//Number of selections of medical items (Inventory)
DZAI_invmedicals = 2;

//Number of selections of edible items (Inventory) 										
DZAI_invedibles = 1;	

//Number of selections of medical items (Backpack)									
DZAI_bpmedicals = 4; 	

//Number of selections of edible items (Backpack)									
DZAI_bpedibles = 3;	

//Maximum number of items to select from DZAI_MiscItemS table.										
DZAI_numMiscItemS = 5;						

//Maximum number of items to select from DZAI_MiscItemL table.				
DZAI_numMiscItemL = 5;										


/*	AI loot probability settings
--------------------------------------------------------------------------------------------------------------------*/

//Chance to add each medical item.
DZAI_chanceMedicals = 0.70;	

//Chance to add each edible item.								
DZAI_chanceEdibles = 0.70;

//Chance to add each random item from DZAI_MiscItemS table.									
DZAI_chanceMiscItemS = 0.60;

//Chance to add each random item from DZAI_MiscItemL table.								
DZAI_chanceMiscItemL = 0.15;								


/*AI weapon/skill probabilities (gradeChances should add up to 1.00) - [Civilian, Military, MilitarySpecial, HeliCrash] - Note: AI with higher grade weaponry will also have higher skill settings.
--------------------------------------------------------------------------------------------------------------------*/

//equipType level 0 - most AI will have basic pistols or rifles, and occasionally common military weapons.
DZAI_gradeChances0 = [0.90,0.10,0.00,0.00];	

//equipType level 1 - most AI will have common rifles, many will have common military weapons. Very rarely, AI will spawn with high-grade military or helicrash weapons.				
DZAI_gradeChances1 = [0.65,0.30,0.04,0.01];	

//equipType level 2 - most AI carry military weapons, and occasionally high-grade military weapons.				
DZAI_gradeChances2 = [0.15,0.65,0.15,0.05];

//equipType level 3 - All AI will carry at least a military-grade weapon. Many will be carrying high-grade military weapons. Note: Air and land vehicle patrols use equipType level 3.					
DZAI_gradeChances3 = [0.00,0.50,0.35,0.15];	

//equipType level "dynamic" - Weapongrade chances for dynamic-spawned AI. Majority of dynamic AI will be carrying low-grade military weapons, some will carry high-grade military.			
DZAI_gradeChancesDyn = [0.00,0.88,0.09,0.03];				


/*
	AI skill settings
	Skill Level: Description
	0-1: Low to medium-skilled AI. Most common type of AI encountered. Intended to challenge players.
	2-3: High-skilled AI. Uncommon/rare type of AI found in places with military loot. Intended to kill players.
	Hint: The best way to quickly adjust AI difficulty is by modifying aimingAccuracy value. For all skill types, higher number = better skill.
*/

//AI skill settings level 0 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.50
DZAI_skill0 = [	
	["aimingAccuracy",0.10,0.125],
	["aimingShake",0.50,0.59],
	["aimingSpeed",0.50,0.59],
	["endurance",0.50,0.59],
	["spotDistance",0.50,0.59],
	["spotTime",0.50,0.59],
	["courage",0.50,0.59],
	["reloadSpeed",0.50,0.59],
	["commanding",0.60,0.69],
	["general",0.60,0.69]
];

//AI skill settings level 1 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.60
DZAI_skill1 = [	
	["aimingAccuracy",0.125,0.15],
	["aimingShake",0.60,0.69],
	["aimingSpeed",0.60,0.69],
	["endurance",0.60,0.69],
	["spotDistance",0.60,0.69],
	["spotTime",0.60,0.69],
	["courage",0.60,0.69],
	["reloadSpeed",0.60,0.69],
	["commanding",0.70,0.79],
	["general",0.70,0.79]
];

//AI skill settings level 2 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.70
DZAI_skill2 = [	
	["aimingAccuracy",0.175,0.225],
	["aimingShake",0.70,0.79],
	["aimingSpeed",0.70,0.79],
	["endurance",0.70,0.79],
	["spotDistance",0.70,0.79],
	["spotTime",0.70,0.79],
	["courage",0.70,0.79],
	["reloadSpeed",0.70,0.79],
	["commanding",0.80,0.89],
	["general",0.80,0.89]
];

//AI skill settings level 3 (Skill, Minimum skill, Maximum skill). Baseline skill level: 0.80
DZAI_skill3 = [	
	["aimingAccuracy",0.225,0.250],
	["aimingShake",0.80,0.89],
	["aimingSpeed",0.80,0.89],
	["endurance",0.80,0.89],
	["spotDistance",0.80,0.89],
	["spotTime",0.80,0.89],
	["courage",0.80,0.89],
	["reloadSpeed",0.80,0.89],
	["commanding",0.90,0.99],
	["general",0.90,0.99]
];


/*
	Additional AI skill settings can be defined (DZAI_skill4 - DZAI_skill9) for the corresponding custom weapongrade level using the same format above.
	Note: If a custom weapongrade is used without defining the corresponding custom skill settings, DZAI_skill3 settings will be used instead.
	Instructions: replace "nil" with the skill array. Refer to the above preset skill arrays for examples.
	Custom AI skill settings can only be used with custom-defined spawns (spawns created using the DZAI_spawn function).
*/

//weapongrade 4 skills
DZAI_skill4 = nil; 

//weapongrade 5 skills
DZAI_skill5 = nil; 

//weapongrade 6 skills
DZAI_skill6 = nil; 

//weapongrade 7 skills
DZAI_skill7 = nil; 

//weapongrade 8 skills
DZAI_skill8 = nil;

//weapongrade 9 skills
DZAI_skill9 = nil; 


/*
	AI weapon, loot, and equipment settings
	
	DZAI will first load the classname tables defined below, the modify the settings according to the DayZ map/mod being run.
	
	Example: DZAI will always first load the classname tables defined below, then if DayZ Epoch is detected, DZAI will add or overwrite settings specified by \world_classname_configs\epoch\dayz_epoch.sqf. 
	
*/

//Default weapon classname tables - DZAI will ONLY use these tables if the dynamic weapon list (DZAI_dynamicWeaponList) is disabled, otherwise they are ignored and overwritten if it is enabled.
//Note: Low-level AI (weapongrade 0) may use pistols listed in DZAI_Pistols0 or DZAI_Pistols1. Mid/high level AI (weapongrade 1+) will carry pistol weapons but not use them - they will use rifle weapons instead.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_Pistols0 = ["Makarov_DZ","M1911_DZ","Revolver_DZ"]; 				//Weapongrade 0 pistols
DZAI_Pistols1 = ["M9_DZ","M9_SD_DZ","Makarov_SD_DZ","PDW_DZ","G17_FL_DZ"]; 	//Weapongrade 1 pistols
DZAI_Pistols2 = ["M9_SD_DZ","Makarov_SD_DZ","PDW_DZ","G17_FL_DZ"]; 		//Weapongrade 2 pistols
DZAI_Pistols3 = ["M9_SD_DZ","Makarov_SD_DZ","PDW_DZ","G17_FL_DZ"]; 		//Weapongrade 3 pistols

DZAI_Rifles0 = ["LeeEnfield_DZ","Winchester1866_DZ","MR43_DZ","CZ550_DZ","LeeEnfield_DZ","Winchester1866_DZ","MR43_DZ"]; //Weapongrade 0 rifles
DZAI_Rifles1 = ["M16A2_DZ","M16A2_GL_DZ","AK74_DZ","M4A1_CCO_DZ","AK74_Kobra_DZ","AKS74U_DZ","AKM_DZ","M24_DZ","M1014_DZ","DMR_DZ","M4A1_DZ","M14_CCO_DZ","Remington870_FL_DZ","MP5_DZ","MP5_SD_DZ","M4A3_CCO_EP1"]; //Weapongrade 1 rifles
DZAI_Rifles2 = ["M16A2_DZ","M16A2_GL_DZ","M249_DZ","AK74_DZ","M4A1_CCO_DZ","AK74_Kobra_DZ","AKS74U_DZ","AKM_DZ","M24_DZ","SVD_Gh_DZ","M1014_DZ","DMR_DZ","M4A1_DZ","M14_CCO_DZ","Remington870_FL_DZ","M240_DZ","M4A1_AIM_SD_camo","M16A4_ACOG_DZ","M4A1_HWS_GL_camo","Mk48_CCO_DZ","M4A3_CCO_EP1","Sa58V_RCO_EP1","Sa58V_CCO_EP1","M40A3_Gh_DZ","SA58_DZ","SA58_DZ"]; //Weapongrade 2 rifles
DZAI_Rifles3 = ["FNFAL_DZ","FN_FAL_ANPVS4_DZE","Mk48_CCO_DZ","M249_DZ","L85_Holo_DZ","G36C_DZ","G36C_camo","G36A_Camo_DZ","G36K_Camo_DZ","AKM_DZ","AKS74U_DZ","M14_CCO_DZ","Bizon_SD_DZ","DMR_DZ","RPK74_DZ"]; //Weapongrade 3 rifles
DZAI_Rifles4 = nil; //weapongrade 4 weapons
DZAI_Rifles5 = nil; //weapongrade 5 weapons
DZAI_Rifles6 = nil; //weapongrade 6 weapons
DZAI_Rifles7 = nil; //weapongrade 7 weapons
DZAI_Rifles8 = nil; //weapongrade 8 weapons
DZAI_Rifles9 = nil; //weapongrade 9 weapons

// Скины ботов
DZAI_BanditTypes = ["Survivor2_DZ", "SurvivorW2_DZ", "Bandit1_DZ", "BanditW1_DZ", "Camo1_DZ", "Sniper1_DZ"];


// Рюкзаки для AI по их уровню
DZAI_Backpacks0 = ["DZ_Patrol_Pack_EP1","DZ_Czech_Vest_Pouch","DZ_Assault_Pack_EP1"];
DZAI_Backpacks1 = ["DZ_Patrol_Pack_EP1","DZ_Czech_Vest_Pouch","DZ_Assault_Pack_EP1","DZ_British_ACU","DZ_TK_Assault_Pack_EP1","DZ_CivilBackpack_EP1","DZ_ALICE_Pack_EP1"];
DZAI_Backpacks2 = ["DZ_CivilBackpack_EP1","DZ_British_ACU","DZ_Backpack_EP1"];
DZAI_Backpacks3 = ["DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];


//AI Food/Medical item types. DZAI_Edibles: Drinkable and edible items. DZAI_Medicals1: List of common medical items to be added to AI inventory. DZAI_Medicals2: List of all medical items available only in hospitals to be added to AI backpack.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_Edibles = ["ItemSodaCoke", "ItemSodaPepsi", "ItemWaterbottle", "FoodCanSardines", "FoodCanBakedBeans", "FoodCanFrankBeans", "FoodCanPasta", "ItemWaterbottleUnfilled","ItemWaterbottleBoiled","FoodmuttonCooked","FoodchickenCooked","FoodBaconCooked","FoodRabbitCooked","FoodbaconRaw","FoodchickenRaw","FoodmuttonRaw","foodrabbitRaw","FoodCanUnlabeled","FoodPistachio","FoodNutmix","FoodMRE"];
DZAI_Medicals1 = ["ItemBandage", "ItemPainkiller"];
DZAI_Medicals2 = ["ItemPainkiller", "ItemMorphine", "ItemBandage", "ItemBloodbag", "ItemAntibiotic","ItemEpinephrine"];


//AI Miscellaneous item types. DZAI_MiscItemS: List of random low-value items. DZAI_MiscItemL: List of random semi-valuable/useful items
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_MiscItemS = ["ItemHeatpack", "HandRoadFlare", "HandChemBlue", "HandChemRed", "HandChemGreen","SmokeShell","TrashTinCan","TrashJackDaniels","ItemSodaEmpty"];
DZAI_MiscItemL = ["ItemJerrycan", "PartWheel", "PartEngine", "PartFueltank", "PartGlass", "PartVRotor","PartWoodPile"];


//AI toolbelt item types. Toolbelt items are added to AI inventory upon death. Format: [item classname, item probability]
//Weapongrade level 0-1 AI will use DZAI_tools0 table, weapongrade level 2-3 AI will use DZAI_tools1 table. Custom-spawned AI will use DZAI_tools1 table.
//NOTE: Do not delete any elements from this list, set its chance to zero intead. Only add elements to the end of the array, not in the middle.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_tools0 = [["ItemFlashlight",0.65],["ItemWatch",0.65],["ItemKnife",0.50],["ItemHatchet",0.40],["ItemCompass",0.40],["ItemMap",0.35],["ItemToolbox",0.15],["ItemMatchbox",0.15],["ItemFlashlightRed",0.05],["ItemGPS",0.005],["ItemRadio",0.005],["ItemCrowbar",0.15]];
DZAI_tools1 = [["ItemFlashlight",0.75],["ItemWatch",0.75],["ItemKnife",0.75],["ItemHatchet",0.70],["ItemCompass",0.75],["ItemMap",0.70],["ItemToolbox",0.35],["ItemMatchbox",0.40],["ItemFlashlightRed",0.10],["ItemGPS",0.10],["ItemRadio",0.075],["ItemCrowbar",0.35]];


//AI-useable toolbelt item types. These items are added to AI inventory at unit creation and may be used by AI. Format: [item classname, item probability]
//Weapongrade level 0-1 AI will use DZAI_gadgets0 table, weapongrade level 2-3 AI will use DZAI_gadgets1 table. Custom-spawned AI will use DZAI_gadgets1 table.
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DZAI_gadgets0 = [["binocular",0.40],["NVGoggles",0.00]];
DZAI_gadgets1 = [["binocular",0.60],["NVGoggles",0.05]];


//NOTHING TO EDIT BEYOND THIS POINT
diag_log "[DZAI] DZAI configuration file loaded.";
