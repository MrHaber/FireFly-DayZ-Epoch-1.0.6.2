dayz_enableRules 	=	false;		// Новости, правила и т.п. при логине
dayz_quickSwitch 	= 	false; 		// Переключать оружие (ХотКей 1,2,3) False = Вкл Анимацию / True = Выкл

// Изменение температуры
dayz_temperature_override 	= 	false; 		// Отключить изменение температуры
// [Техника +, Костер +, Постройка +, Движение +, Солнце +, Грелка +, Вода -, Стоячий -, Дождь -, Ветер -, Ночь -]
// Вода -, Стоячий -, Дождь -, Ветер -, Ночь - сильно влияют на температуру. Чем больше значение для них, тем быстрее игрок мерзнет.
DZE_TempVars = [4, 10, 3, 1, 2, 4, 5, 1, 0.35, 0.75, 0.5];

// Динамичная техника
MaxVehicleLimit 			= 	150; 	// Всего рандомной техники на карте
DynamicVehicleDamageLow 	= 	70; 	// Мин. урон по технике при спавне (% = 0 - 100)
DynamicVehicleDamageHigh 	= 	100; 	// Макс. урон по технике при спавне (% = 0 - 100)
DynamicVehicleFuelLow 		= 	5; 		// Мин. бензина в технике при спавне (% = 0 - 100)
DynamicVehicleFuelHigh 		= 	20; 	// Макс. бензина в технике при спавне (% = 0 - 100)

MaxDynamicDebris 			=	0;		// Мусор рандом на карте
MaxAmmoBoxes 				=	0; 		// Ящики рандом на карте
MaxMineVeins 				=	0; 		// Руды рандом на карте

DZE_NameTags				=	1; 			// Отображать ник когда игрок рядом:  0 = Выкл, 1 = Вкл, 2 = Игрок сам выбирает
DZE_ForceNameTagsInTrader	=	true; 		// Отображать ник в торговой зоне (Игнорирует выбор игрока)
DZE_HumanityTargetDistance	=	15; 		// Дистанция отображения имени (Красный - Бандит, Синий - Герой, Зеленый - Друг)

dayz_knifeDulling 			=	true; 		// Охотничий нож может ломаться
dayz_matchboxCount 			=	true; 		// Спички могут закончиться
dayz_toolBreaking 			=	true; 		// Кувалда, Кирка и Ломик могут ломаться
dayz_waterBottleBreaking 	=	true; 		// Фляга может сломаться при нагревании и требует Скотча (ленты)

dayz_tameDogs 				=	false;		// Приручать собак (Баганный скрипт)
dayz_randomMaxFuelAmount	=	500;		// Значение бензина на заправках
DZE_HeartBeat 				=	true; 		// Ваше сердце бьется, если на вас смотрит Бандит (<= -3000 человечности)
DZE_HeliLift 				=	false; 		// Стандартная система Транспортировки техники (Плохая)
DZE_salvageLocked 			=	true; 		// Взлом техники
DZE_NoVehicleExplosions 	=	false; 		// Отключить взрыв техники
DZE_TwoPrimaries 			= 	2;			// 0 - Нельзя осн. оружие на спину. 1 - Можно оружие на спину, но нельзя держать в руках. 2 - Можно два оружие. Осн. + на спине
DZE_AntiWallLimit 			= 	3;			// Число предупреждении для player_antiWall перед убийством за багоюз со стенками. Меньше - строже, но может быть ложным
DZE_BackpackAntiTheft		=	false; 		// Защита Рюкзаков в торг.зонах (Плохая)

DZE_RestrictSkins = []; 		// Запрещенные скины для переодевания.

DZE_UI = "vanilla"; 				// "vanilla","epoch","dark"  UI Иконки. "dark" ночью плохо видно.
DZE_VanillaUICombatIcon = false; 	// Спрятать Иконку (в бою!) (Если DZE_UI = "vanilla"; Не сработает).

dayz_paraSpawn				=	false; 		// HALO Спавн (С прыжка НЕ ПРИВЯЗАН К СКРИПТУ HALO)
spawnArea					=	1400;		// Радиус от точки спавна, где игрок может быть отспавнен (динамичный спавн)
spawnShoremode				=	1;			// Динамичный спавн (1 - Поиск от точки / 0 - В точку)

DZE_PlayerZed				=	false; 		// При заражении игрок после смерти станет Зомби
DZE_ZombieSpeed				=	[0,0];		// Стандартная скорость агра зомби в конфиге 6, установите значение элементов 0 и 1 для non-variable speed, установите 0 для отключения. array формат = [мин, макс];  Пример: [2, 6]; результат приводит к диапазону скоростей от 2 до 6 (2 это старый DZE_slowZombies тяжелый сложный код)
dayz_DamageMultiplier		=	3;			// Множитель урона Зомби (1 и 0 - Выкл)
dayz_maxGlobalZeds			=	500;		// Общее кол-во Зомби на Сервере

DZE_R3F_WEIGHT				=	true; 		// Система Веса

DZE_SelfTransfuse			=	false;				// Самозаливка крови
DZE_selfTransfuse_Values	=	[12000,15,120]; 	// [Сколько дать крови, Шанс заражения %, Время до новой заливки]

DZE_SafeZonePosArray =
[
	 [[7665,  11765, 0], 100]
	,[[15930, 10400, 0], 100]
	,[[3160,  12110, 0], 300]
	,[[9670,  2955,  0], 300]
	,[[10580, 13110, 0], 300]
	,[[13155, 6395,  0], 300]
];
DZE_SafeZoneNoBuildItems		=	["VaultStorageLocked","LockboxStorageLocked","Plastic_Pole_EP1_DZ"];		// Что нельзя размещать в торг. зонах. Пример: ["VaultStorageLocked","LockboxStorageLocked","Plastic_Pole_EP1_DZ"]
DZE_SafeZoneNoBuildDistance		=	150;	// Дистанция запрета

DZE_StaticConstructionCount 	= 	0; 			// Сколько шагов стройки. 0 = по умолчанию / 0 > Применяется ко всем.
DZE_requireplot 				= 	1; 			// Требуется ли Плот 1 - Да / 0 - Нет
DZE_PlotPole 					= 	[30,45]; 	// Радиус Плота для Базы [Сколько база, через сколько можно поставить новый плот]
DZE_BuildOnRoads 				= 	false; 		// Можно ли строить на дорогах?
DZE_BuildingLimit 				= 	1000; 		// Сколько построек можно в зоне DZE_PlotPole
DZE_BuildHeightLimit			=	0;			// Допустимая высота стройки (м)
DZE_NoBuildNear 				= 	[]; 		// Рядом с какими Постройками НЕЛЬЗЯ строить. Пример: ["Land_Mil_ControlTower","Land_SS_hangar"].
DZE_NoBuildNearDistance 		= 	150; 		// Дистанция запрета.
DZE_GodModeBase 				= 	false; 		// Защита построенных баз от урона
DZE_GodModeBaseExclude 			= 	[]; 		// Что не будет защищено Бессмертием построек. Пример: ["VaultStorageLocked"].
DZE_DamageBeforeMaint			= 	0.09;		// Минимальный урон, для починки построек внутри зоны.

// Пресет
dayz_presets = "Custom";	//"Custom","Classic","Vanilla","Elite"

if (dayz_presets == "Custom") then
{
	dayz_enableGhosting 					= 	false;		// Спектатор при смерти
	dayz_ghostTimer 						= 	60; 		// Время спектатора (после autologin)
	dayz_spawnselection 					= 	0; 			// Выбор спавна (Только для черно). Мне это нахрен не надо
	dayz_spawncarepkgs_clutterCutter 		= 	0; 			// Ящики: 0 = лут в траве, 1 = поднят, 2 = без травы
	dayz_spawnCrashSite_clutterCutter 		= 	0;			// ХелиКраш: 0 = лут в траве, 1 = поднят, 2 = без травы
	dayz_spawnInfectedSite_clutterCutter 	= 	0; 			// Зараж. лагеря: 0 = лут в траве, 1 = поднят, 2 = без травы
	dayz_bleedingeffect 					= 	2; 			// Эффект крови: 1 = кровь на земле (Сажает ФПС), 2 = только частицы, 3 = Оба
	dayz_OpenTarget_TimerTicks 				= 	60 * 10; 	// Как долго можно свободно атаковать игрока, который был не спровоцирован (В БОЮ!)
	dayz_nutritionValuesSystem 				= 	true; 		// Система питания
	dayz_classicBloodBagSystem 				= 	false; 		// Исп. старую систему крови (без групп)
	dayz_enableFlies 						= 	false; 		// Добавлять Мух на трупы (Сажает ФПС) Надо потестить
};

DZE_NutritionDivisor = [1, 1, 1, 1]; //Массивы для Жажды/Пищи. [Каллории, Жажда, Голод, Температура] если используется "working" (Температура повышается) - Мин. значение - 0.1

timezoneswitch = 0;
DZE_DisabledChannels = [(localize "str_channel_side"),(localize "str_channel_global"),(localize "str_channel_command")]; //List of disabled voice channels. Other channels are: "str_channel_group","str_channel_direct","str_channel_vehicle"

// Snap Build и Build Vectors
DZE_modularBuild 			= 	true; 								// Включить Snap Building и Build Vectors?
DZE_snapExtraRange 			= 	0; 									// Увеличить значение насколько можно "Связывать" объекты
DZE_noRotate 				= 	["ItemVault"]; 						// Что нельзя крутить/наклонять. Пример: ["ItemVault","ItemTent","ItemDomeTent","ItemDesertTent"];
DZE_vectorDegrees 			= 	[0.01, 0.1, 1, 5, 15, 45, 90]; 		// Углы поворота, которые будут использованы в Скролл Меню
DZE_curDegree 				= 	45; 								// Начальный угол поворота
DZE_dirWithDegrees 			= 	true; 								// Можно использовать поворот через Q&E при значении из DZE_curDegree
DZE_buildMaxMoveDistance 	= 	5; 									// Макс. расстояние которое может пройти игрок при стройке. Любое зачение >= абузит DZE_PlotPole значение (Уходят за зону и строят)
DZE_buildMaxHeightDistance 	= 	5; 									// Макс. расстояние которое игрок может вытянуть постройку по высоте

// Сообщение о смерти
DZE_DeathMsgChat 			= 	"none";		// "none","global","side","system" Отображать сообщения о смерти в каналах
DZE_DeathMsgDynamicText 	= 	false; 		// Сообщения о смерти внизу слева
DZE_DeathMsgRolling 		= 	false; 		// Сообщения о смерти по центру
DZE_DeathScreen 			= 	true; 		// Экран смерти: True = Epoch / False = DayZ
//DZE_ServerLogHits 		= 	true; 		// Логгировать в RPT урон

// Door Management
DZE_doorManagement 					=	true; 		// Использовать Door Management?
DZE_doorManagementMustBeClose 		= 	true; 		// Чтобы добавить игрока в Дверь он должен быть рядом (10м)
DZE_doorManagementAdmins 			= 	[]; 		// UID Администрации для доступа ко всем Дверям
DZE_doorManagementAllowManualCode 	= 	true; 		// Открыть дверь можно и Комбинацией. Если - false, то требуется только Сканнер глаз
DZE_doorManagementMaxFriends 		= 	10; 		// Всего друзей за 1 Дверь. Меньше - лучше для Базы Данных (setVariable)
DZE_doorManagementHarderPenalty 	= 	true; 		// Запрещать доступ к Дверь на время после неудачной попытки

// HALO Jump
DZE_HaloAltitudeMeter 		= 	false; 		// Отображать Высоту и скорость на экране при прыжке
DZE_HaloOpenChuteHeight 	= 	-1; 		// Высота для автооткрытия парашюта. (-1 = Выкл)
DZE_HaloSpawnHeight 		= 	2000; 		// Высота откуда будет прыжок
DZE_HaloJump 				= 	true; 		// HALO Прыжок с технки если высота > 400м

// Групповая система (Баганная)
dayz_groupSystem 	= 	false; 	// Включить DZGM (Групповую систему)?
dayz_markGroup 		= 	2; 		// Игроки могут видеть своих членов группы на карте 	0=Никогда, 1=Всегда, 2=Только с GPS
dayz_markSelf 		= 	0; 		// Игроки могут видеть себя на карте 					0=Никогда, 1=Всегда, 2=Только с GPS
dayz_markBody 		= 	0; 		// Игроки могут видеть свои трупы на карте 				0=Никогда, 1=Всегда, 2=Только с GPS
dayz_requireRadio 	= 	false; 	// Требуется ли Радио?

// Торговля
DZE_ConfigTrader 		= 	true; 		// Откуда брать конфиг торговли. True - Работает быстрее и использует Интернет-Трафик / False - Брать из Базы Данных
DZE_serverLogTrades 	= 	true; 		// Логгировать Торговлю (Использует: publicVariableServer)

DZE_GemOccurance = 						// Редкость руды (Только цельное число)
[
];

DZE_GemWorthArray =						// Цены руд. Используйте: DZE_GemWorthArray=[]; чтобы убрать настройки
[
];

DZE_SaleRequiresKey 	= 	true; 				// Для продажи покупной техники всегда нужен ключ. Ключ должен быть или: Инветарь, Рюкзак, Техника
DZE_keepVehicleKey		=	false;				// Оставлять ключ игроку после продажи (полезно есть стоит скрипт на смену ключей!)
DZE_TRADER_SPAWNMODE 	= 	false; 				// При покупке техники она появляется на парашюте

Z_VehicleDistance 				= 	50; 		// Дистанция продажи техники от торгоша (м)
Z_AllowTakingMoneyFromBackpack 	= 	true; 		// Брать деньги из Рюкзака
Z_AllowTakingMoneyFromVehicle 	= 	true; 		// Брать деньги из Техники

Z_SingleCurrency 			= 	true; 						// Используется ли ZSC?
Z_globalBanking				=	false;						// Использовать Глобальные банки?
Z_globalBankingTraders		=	false;						// Использовать Глобальные банки у торговцев?
CurrencyName 				= 	"Рублей"; 					// Название валюты в ZSC
Z_MoneyVariable 			= 	"Rubles";					// Переменная валюты в ZSC
Z_bankVariable				=	"moneySpecial";				// Переменная валюты в ZSC (Банк)
Z_globalVariable			=	"GlobalMoney";				// Переменная валюты в ZSC (Глобальная)

ZSC_defaultStorageMultiplier		=	200; 				// Сколько мест будет в тех предметах, которые изначально не имеют слотов для подсчета (Например: Suitcase, Info_Board_EP1, Plastic_Pole_EP1_DZ)
ZSC_MaxMoneyInStorageMultiplier		=	500; 				// Множитель денег под слоты техники/построек (Например: 200*50000=10м рублей)

DZE_MoneyStorageClasses				=	[];					// Массив объектов, где можно хранить деньги.

// Plot Management и Plot for Life
DZE_permanentPlot 				= 	true; 		// Использовать Plot Management и P4L?
DZE_plotManagementMustBeClose 	= 	true; 		// Чтобы добавить игрока в Плот он должен быть рядом (10м)
DZE_PlotManagementAdmins 		= 	[]; 		// UID Администрации для доступа ко всем Плотам
DZE_MaxPlotFriends 				= 	10; 		// Всего друзей за 1 плот. Меньше - лучше для Базы Данных (setVariable)
DZE_maintainCurrencyRate 		= 	100; 		// Множитель Оплаты построек: Если 100, то при 10 Постройках будет 1000 (1 10oz gold или 1k coins). Смотрите actions/maintain_area.sqf для большей инфы

/*
	Предметы которые могут быть убраны без Хозяев или Доступа.
	(Обратное: DZE_restrictRemoval)
	Нет необходимости добавлять ID что уже хранятся в 'BuiltItems'
*/
DZE_isRemovable =
[
	"Plastic_Pole_EP1_DZ"
];

/*
	Предметы которые могут быть убраны только с Хозяеами или Доступом.
	(Обратное: DZE_isRemovable)
	Нет необходимости добавлять ID что уже хранятся в 'ModularItems'
	Элементы из 'BuiltItems' можно добавить сюда при необходимости
*/
DZE_restrictRemoval =
[
	"Fence_corrugated_DZ"
	,"M240Nest_DZ"
	,"ParkBench_DZ"
	,"FireBarrel_DZ"
	,"Scaffolding_DZ"
	,"CanvasHut_DZ"
	,"LightPole_DZ"
	,"DeerStand_DZ"
	,"MetalGate_DZ"
	,"StickFence_DZ"
];

DZE_limitPlots = true;		// Включить лимит 1 плот на 1 человека, UIDы в DZE_PlotManagementAdmins игнорируют этот параметр.

DZE_modularConfig = [];
/*
	Массив модульных объектов которые, по умолчанию, не возвращают предметы при ДеКонстракции или ДеАпгрейде.

	Пример:
	DZE_modularConfig =
	[
		[
			"CinderWall_DZ", [["CinderBlocks",7],["MortarBucket",2]]
		],
		[
			"CinderWallDoor_DZ", [["CinderBlocks",7],["MortarBucket",2],["ItemTankTrap",3],["ItemPole",[1,3]]]
		]
	];
	
	1. CinderWall_DZ вернет 7 CinderBlocks и 2 MortarBucket
	2. CinderWallDoor_DZ вернет 7 CinderBlocks, 2 MortarBucket, 3 ItemTankTrap и рандомно от 1 до 3 ItemPole.
*/