_Ratio1 = 1;
_Ratio2 = 2;
_Ratio3 = 3;
_Ratio4 = 4;
_Ratio5 = 5;

/*
if (MaxVehicleLimit > 300) then
{
	_Ratio1 = round(MaxVehicleLimit * 0.0034);		// 1
	_Ratio2 = round(MaxVehicleLimit * 0.0067);		// 2
	_Ratio3 = round(MaxVehicleLimit * 0.01);		// 3
};
*/
AllowedVehiclesList =
[
	// Наземная техника
	 ["Tractor",	_Ratio4]	// Трактор
	,["tractorOld",	_Ratio5]	// Трактор старый
	
	,["TowingTractor",	_Ratio4]	// Тягачь
	 
	,["HMMWV_DZ",			_Ratio2]	// Хаммер
	,["HMMWV_Ambulace",		_Ratio2]	// Хаммер (медицинский)
	,["HMMWV_Armored_DZ",	_Ratio1]	// Хаммер (c М240)
	,["HMMWV_M2_DZ",		_Ratio1]	// Хаммер (с М2)
	
	,["HMMWV_M1035_DES_EP1",			_Ratio2]	// Хаммер
	,["HMMWV_M1151_M2_CZ_DES_EP1_DZE",	_Ratio1]	// Хаммер (с М2 бронь)
	,["HMMWV_M1151_M2_DES_EP1",			_Ratio1]	// Хаммер (с М2 бронь)
	,["HMMWV_M998_crows_M2_DES_EP1",	_Ratio1]	// Хаммер (с М2)
	
	,["Ural_CDF",		_Ratio1]	// Урал (CDF)
	,["UralOpen_CDF",	_Ratio1]	// Урал-Открытый (CDF)
	,["Ural_INS",		_Ratio1]	// Урал (INS)
	,["UralOpen_INS",	_Ratio1]	// Урал-Открытый (INS)
	,["UralCivil_DZE",		_Ratio1]	// Урал Гражданский Желтый
	,["UralCivil2_DZE",		_Ratio1]	// Урал Гражданский Синий
	
	,["Skoda",		_Ratio3]	// Школа Белая
	,["SkodaBlue",	_Ratio3]	// Школа Синий
	,["SkodaRed",	_Ratio3]	// Школа Красный
	,["SkodaGreen",	_Ratio3]	// Школа Зеленый
	
	,["UAZ_RU",		_Ratio2]	// УАЗ (РУ)
	,["UAZ_CDF",	_Ratio2]	// УАЗ (CDF)
	,["UAZ_MG_CDF",	_Ratio1]	// УАЗ (CDF с ДШКМ)
	,["UAZ_MG_INS",	_Ratio1]	// УАЗ (INS с ДШКМ)
	,["UAZ_INS",	_Ratio2]	// УАЗ (INS)
	
	,["datsun1_civil_1_open_DZE",	_Ratio2]	// Пикап Открытый
	,["datsun1_civil_2_cover_DZE",	_Ratio2]	// Пикап Крытый
	,["datsun1_civil_3_open_DZE",	_Ratio2]	// Пикап с трубой
	
	,["car_hatchback",	_Ratio3]	// Хэтчбэг
	,["car_sedan",		_Ratio3]	// Седан
	
	,["Lada1",	_Ratio3]	// Лада
	,["Lada2",	_Ratio3]	// Лада
	,["LadaLM",	_Ratio3]	// Лада
	
	,["hilux1_civil_1_open_DZE",	_Ratio2]	// ХайЛюкс Внежорожник Открытый
	,["hilux1_civil_2_cover_DZE",	_Ratio2]	// ХайЛюкс Внежорожник Крытый
	,["hilux1_civil_3_open_DZE",	_Ratio2]	// ХайЛюкс Внежорожник с трубой
	
	,["Pickup_PK_GUE_DZE",	_Ratio1]	// Пикап с ПКМ
	,["Pickup_PK_INS_DZE",	_Ratio1]	// Пикап с ПКМ
	
	,["Offroad_DSHKM_Gue_DZE",	_Ratio1]	// Оффроал с ДШКМ
	
	,["GLT_M300_LT",	_Ratio3]	// Такси Лада
	,["GLT_M300_ST",	_Ratio3]	// Такси Седан
	
	,["GAZ_Vodnik_MedEvac",	_Ratio1]	// Водник медицинский
	
	,["Ikarus",				_Ratio2]	// Автобус
	,["Ikarus_TK_CIV_EP1",	_Ratio2]	// Автобус
	
	,["Kamaz_DZE",		_Ratio2]	// Камаз
	,["KamazOpen_DZE",	_Ratio2]	// Камаз открытый
	,["KamazRefuel_DZ",	_Ratio1]	// Камаз открытый
	
	,["MTVR",		_Ratio2]	// Камаз
	
	,["V3S_Civ",	_Ratio2]	// V3S
	,["V3S_Gue",	_Ratio2]	// V3S
	,["V3S_TK_EP1",	_Ratio2]	// V3S
	,["V3S_TK_GUE_EP1",			_Ratio2]	// V3S
	,["V3S_Open_TK_EP1",		_Ratio2]	// V3S
	,["V3S_Open_TK_CIV_EP1",	_Ratio2]	// V3S
	
	,["VWGolf",	_Ratio3]	// Хэтчбэг
	
	,["M1030",		_Ratio4]	// Мотик (топ)
	,["TT650_Civ",	_Ratio4]	// Мотик TT650
	,["TT650_Ins",	_Ratio4]	// Мотик TT650
	,["TT650_Gue",	_Ratio4]	// Мотик TT650
	
	,["ATV_US_EP1",	_Ratio4]	// Квадрик
	,["ATV_CZ_EP1",	_Ratio4]	// Квадрик
	
	,["BTR40_TK_GUE_EP1",		_Ratio2]	// БТР-40
	,["BTR40_TK_INS_EP1",		_Ratio2]	// БТР-40
	,["BTR40_MG_TK_GUE_EP1",	_Ratio1]	// БТР-40 (c ДШКМ)
	,["BTR40_MG_TK_INS_EP1",	_Ratio1]	// БТР-40 (c ДШКМ)
	
	,["LandRover_TK_CIV_EP1",		_Ratio2]	// Военный оффроад
	,["LandRover_MG_TK_INS_EP1",	_Ratio1]	// Военный оффроад с М2
	,["LandRover_MG_TK_EP1_DZE",	_Ratio1]	// Военный оффроад с М2
	
	,["S1203_TK_CIV_EP1",		_Ratio3]	// Школа-1203
	,["S1203_ambulance_EP1",	_Ratio3]	// Школа-1203 (медицинский)
	
	,["Volha_1_TK_CIV_EP1",		_Ratio3]	// Волга Синий
	,["Volha_2_TK_CIV_EP1",		_Ratio3]	// Волга Серый
	,["VolhaLimo_TK_CIV_EP1",	_Ratio3]	// Волга Лимо
	
	,["SUV_DZ",			_Ratio1]	// Сув
	,["SUV_Camo",		_Ratio1]	// Сув
	,["SUV_Blue",		_Ratio1]	// Сув
	,["SUV_Green",		_Ratio1]	// Сув
	,["SUV_Yellow",		_Ratio1]	// Сув
	,["SUV_Red",		_Ratio1]	// Сув
	,["SUV_White",		_Ratio1]	// Сув
	,["SUV_Pink",		_Ratio1]	// Сув
	,["SUV_Charcoal",	_Ratio1]	// Сув
	,["SUV_Orange",		_Ratio1]	// Сув
	,["SUV_Silver",		_Ratio1]	// Сув
	
	,["Mi17_Civilian",		_Ratio1]	// Ми17 гражданский
	,["Mi17_medevac_RU",	_Ratio1]	// Ми17 медицинский РУ
	,["AH6X_EP1_DZ",		_Ratio1]	// Литл-мал
	,["MH6J_EP1_DZ",		_Ratio1]	// Литл-мал
	,["UH60M_MEV_EP1_DZ",	_Ratio1]	// UH60 медицинский
	,["BAF_Merlin_DZE",		_Ratio1]	// Merlin
	,["USEC_ch53_E",		_Ratio1]	// USEC_ch53_E
];

// Лодки мне не нужны...
/*
if (toLower worldName in ["caribou","chernarus","cmr_ovaron","dayznogova","dingor","dzhg","fallujah","fapovo","fdf_isle1_a","isladuala","lingor","mbg_celle2","namalsk","napf","oring","panthera2","ruegen","sara","sauerland","smd_sahrani_a2","tasmania2010","tavi","trinity","utes"]) then
{
	AllowedVehiclesList = AllowedVehiclesList + [
		["Fishing_Boat",_Ratio3],
		["JetSkiYanahui_Case_Blue",_Ratio1],
		["JetSkiYanahui_Case_Green",_Ratio1],
		["JetSkiYanahui_Case_Red",_Ratio1],
		["JetSkiYanahui_Case_Yellow",_Ratio1],
		["PBX",_Ratio3],
		["RHIB",_Ratio3],
		["Smallboat_1",_Ratio3],
		["Smallboat_2",_Ratio3],
		["Zodiac",_Ratio3]
	];
};
*/