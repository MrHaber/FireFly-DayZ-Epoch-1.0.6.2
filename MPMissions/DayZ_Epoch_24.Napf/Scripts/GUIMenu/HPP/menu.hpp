class menu
{
    idd = 7777;
    movingenable=false;
	class Controls
	{ 
class slk_frame: slkRscFrame
{
	idc = 1801;
	text = ""; //--- ToDo: Localize;
	x = 0.216406 * safezoneW + safezoneX;
	y = 0.1304 * safezoneH + safezoneY;
	w = 0.567187 * safezoneW;
	h = 0.748 * safezoneH;
};
class slk_bg: slkIGUIBack
{
	idc = 2200;
	text = ""; //--- ToDo: Localize;
	x = 0.212281 * safezoneW + safezoneX;
	y = 0.1194 * safezoneH + safezoneY;
	w = 0.5775 * safezoneW;
	h = 0.77 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
};
class slk_bgl1: slkIGUIBack
{
	idc = 2201;

	x = 0.212281 * safezoneW + safezoneX;
	y = 0.1106 * safezoneH + safezoneY;
	w = 0.5775 * safezoneW;
	h = 0.132 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class slk_title: slkRscText
{
	idc = 1000;
	text = "Server Name"; //--- ToDo: Localize;
	x = 0.37522 * safezoneW + safezoneX;
	y = 0.126 * safezoneH + safezoneY;
	w = 0.2475 * safezoneW;
	h = 0.033 * safezoneH;
	sizeEx = 0.050;
	style = 2;
};
class slk_web: slkRscText
{
	idc = 1001;
	text = "Website"; //--- ToDo: Localize;
	x = 0.377281 * safezoneW + safezoneX;
	y = 0.1766 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.022 * safezoneH;
	sizeEx = 0.035;
	style = 2;
};
class slk_ts3: slkRscText
{
	idc = 1002;
	text = "Teamspeak"; //--- ToDo: Localize;
	x = 0.535349 * safezoneW + safezoneX;
	y = 0.176733 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.022 * safezoneH;
	sizeEx = 0.035;
	style = 2;
};
class slk_view_title: slkRscText
{
	idc = 1003;
	text = "Дальность прорисовки"; //--- ToDo: Localize;
	x = 0.424 * safezoneW + safezoneX;
	y = 0.2382 * safezoneH + safezoneY;
	w = 0.15 * safezoneW;
	h = 0.033 * safezoneH;
	sizeEx = 0.040;
	style = 2;
};
class slk_picl: slkRscPicture
{
	idc = 1200;
	text = "";
	x = 0.221562 * safezoneW + safezoneX;
	y = 0.137 * safezoneH + safezoneY;
	w = 0.128906 * safezoneW;
	h = 0.077 * safezoneH;
};
class slk_action_title: slkRscText
{
	idc = 1004;
	text = "Действия"; //--- ToDo: Localize;
	x = 0.265 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.1 * safezoneW;
	h = 0.033 * safezoneH;
	sizeEx = 0.040;
	style = 2;
};
class slk_view1: slkRscButton
{
	idc = 1600;
	text = "500"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.291 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setViewDistance 500; systemChat('Дальность прорисовки: 500 метров');";
};
class slk_view2: slkRscButton
{
	idc = 1601;
	text = "1000"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.335 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setViewDistance 1000; systemChat('Дальность прорисовки: 1000 метров');";
};
class slk_view3: slkRscButton
{
	idc = 1602;
	text = "1500"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.379 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setViewDistance 1500; systemChat('Дальность прорисовки: 1500 метров');";
};
class slk_view4: slkRscButton
{
	idc = 1603;
	text = "2000"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.423 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setViewDistance 2000; systemChat('Дальность прорисовки: 2000 метров');";
};
class slk_view5: slkRscButton
{
	idc = 1604;
	text = "2500"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.467 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setViewDistance 2500; systemChat('Дальность прорисовки: 2500 метров');";
};
class slk_view6: slkRscButton
{
	idc = 1605;
	text = "3000"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.511 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setViewDistance 3000; systemChat('Дальность прорисовки: 3000 метров');";
};
class slk_grass_title: slkRscText
{
	idc = 1030;
	text = "Дальность травы"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.599 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.033 * safezoneH;
	sizeEx = 0.040;
	style = 2;
};

class slk_grasslow: slkRscButton
{
	idc = 1606;
	text = "Малая"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.643 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setTerrainGrid 40; systemChat('Дальность травы: Малая');";
};
class slk_grassstd: slkRscButton
{
	idc = 1607;
	text = "Стандарт"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.687 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setTerrainGrid 25; systemChat('Дальность травы: Обычная')";
};
class slk_grassfull: slkRscButton
{
	idc = 1608;
	text = "Дальняя"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.731 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "setTerrainGrid 12.5; systemChat('Дальность травы: Дальняя')";
};
class slk_act: slkRscButton
{
	idc = 1609;
	text = "Беруши"; //--- ToDo: Localize;
	x = 0.26 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call action1script;";
};
class slk_act2: slkRscButton
{
	idc = 1610;
	text = "UI"; //--- ToDo: Localize;
	x = 0.26 * safezoneW + safezoneX;
	y = 0.357 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call action2script;";
};
class slk_info: slkRscText
{
	idc = 1005;
	text = "Информация"; //--- ToDo: Localize;
	x = 0.252 * safezoneW + safezoneX;
	y = 0.4428 * safezoneH + safezoneY;
	w = 0.12 * safezoneW;
	h = 0.033 * safezoneH;
	sizeEx = 0.040;
	style = 2;
};
class slk_info1: slkRscButton
{
	idc = 1651;
	text = "Rules"; //--- ToDo: Localize;
	x = 0.26 * safezoneW + safezoneX;
	y = 0.5022 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call info1script;";
};
class slk_info2: slkRscButton
{
	idc = 1652;
	text = "Guide"; //--- ToDo: Localize;
	x = 0.26 * safezoneW + safezoneX;
	y = 0.5792 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call info2script;";
};
class slk_info3: slkRscButton
{
	idc = 1653;
	text = "Update"; //--- ToDo: Localize;
	x = 0.26 * safezoneW + safezoneX;
	y = 0.6606 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call info3script;";
};

class slk_info4: slkRscButton
{
	idc = 1654;
	text = "About"; //--- ToDo: Localize;
	x = 0.26 * safezoneW + safezoneX;
	y = 0.742 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call info4script;";
};

class slk_filters: slkRscText
{
	idc = 1006;
	text = "Фильтры экрана"; //--- ToDo: Localize;
	x = 0.619 * safezoneW + safezoneX;
	y = 0.247 * safezoneH + safezoneY;
	w = 0.12 * safezoneW;
	h = 0.033 * safezoneH;
	sizeEx = 0.040;
	style = 2;
};
class slk_filter_1: slkRscButton
{
	idc = 1614;
	text = "ARMA MISSIONS"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter1script;";
};
class slk_filter_2: slkRscButton
{
	idc = 1615;
	text = "BLUE"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.32 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter2script;";
};

class slk_filter_3: slkRscButton
{
	idc = 1616;
	text = "CLEAR CONTRAST";  //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.36 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter3script;";
};

class slk_filter_4: slkRscButton
{
	idc = 1617;
	text = "DEMONIC"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.40 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter4script;";
};
class slk_filter_5: slkRscButton
{
	idc = 1618;
	text = "OPERATION FP"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.44 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter5script;";
};

class slk_filter_6: slkRscButton
{
	idc = 1619;
	text = "OLD PHOTO";  //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.48 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter6script;";
};
class slk_filter_7: slkRscButton
{
	idc = 1620;
	text = "SAND"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.52 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter7script;";
};
class slk_filter_8: slkRscButton
{
	idc = 1621;
	text = "SEPIA"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.56 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter8script;";
};

class slk_filter_9: slkRscButton
{
	idc = 1622;
	text = "SMOOTH";  //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.60 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter9script;";
};

class slk_filter_10: slkRscButton
{
	idc = 1623;
	text = "SUMMER"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.64 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter10script;";
};
class slk_filter_11: slkRscButton
{
	idc = 1624;
	text = "TROPICAL"; //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.68 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter11script;";
};

class slk_filter_12: slkRscButton
{
	idc = 1625;
	text = "WAR";  //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.72 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter12script;";
};
class slk_filter_13: slkRscButton
{
	idc = 1626;
	text = "INFECTED";  //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.76 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filter13script;";
};
class slk_filter_clear: slkRscButton
{
	idc = 1630;
	text = "СБРОС ФИЛЬТРА";  //--- ToDo: Localize;
	x = 0.626853 * safezoneW + safezoneX;
	y = 0.82 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "call filterClearscript;";
};
class slk_close: slkRscButton
{
	idc = 1617;
	text = "Закрыть меню"; //--- ToDo: Localize;
	x = 0.443281 * safezoneW + safezoneX;
	y = 0.8124 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.030;
	style = 2;
	colorBackground[] = {0.047,0.376,0.776,1};
	OnButtonClick = "((ctrlParent (_this select 0)) closeDisplay 7777)";
};
class eslk_bgl2: slkIGUIBack
{
	idc = 2202;

	x = 0.213312 * safezoneW + safezoneX;
	y = 0.434 * safezoneH + safezoneY;
	w = 0.190781 * safezoneW;
	h = 0.011 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl3: slkIGUIBack
{
	idc = 2203;

	x = 0.399969 * safezoneW + safezoneX;
	y = 0.2294 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.66 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl5: slkIGUIBack
{
	idc = 2204;

	x = 0.593844 * safezoneW + safezoneX;
	y = 0.4318 * safezoneH + safezoneY;
	w = 0.195937 * safezoneW;
	h = 0.011 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl4: slkIGUIBack
{
	idc = 2205;

	x = 0.589719 * safezoneW + safezoneX;
	y = 0.2294 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.66 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl6: slkIGUIBack
{
	idc = 2206;

	x = 0.593844 * safezoneW + safezoneX;
	y = 0.61 * safezoneH + safezoneY;
	w = 0.195937 * safezoneW;
	h = 0.011 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl7: slkIGUIBack
{
	idc = 2203;

	x = 0.212281 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.66 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl8: slkIGUIBack
{
	idc = 2205;

	x = 0.778437 * safezoneW + safezoneX;
	y = 0.225 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.66 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl9: slkIGUIBack
{
	idc = 2206;

	x = 0.212281 * safezoneW + safezoneX;
	y = 0.8674 * safezoneH + safezoneY;
	w = 0.5775 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
	};
};
