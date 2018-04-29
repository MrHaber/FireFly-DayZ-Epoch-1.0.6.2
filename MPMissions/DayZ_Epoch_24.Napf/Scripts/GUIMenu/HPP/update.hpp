class Update
{
    idd = 7779;
    movingenable=false;
	class Controls
	{ 
class eslk_frame: slkRscFrame
{
	idc = 1801;

	x = 0.215375 * safezoneW + safezoneX;
	y = 0.1304 * safezoneH + safezoneY;
	w = 0.567187 * safezoneW;
	h = 0.748 * safezoneH;
};
class slk_bgl1: slkIGUIBack
{
	idc = 10000;

	x = 0.210219 * safezoneW + safezoneX;
	y = 0.1172 * safezoneH + safezoneY;
	w = 0.5775 * safezoneW;
	h = 0.088 * safezoneH;
	colorBackground[] = {0,0,0,1};
};
class eslk_bgl1: slkIGUIBack
{
	idc = 10000;

	x = 0.210219 * safezoneW + safezoneX;
	y = 0.1172 * safezoneH + safezoneY;
	w = 0.5775 * safezoneW;
	h = 0.77 * safezoneH;
	colorBackground[] = {0,0,0,0.8};
};
class eslk_UpdateHUD: slkRscText
{
	idc = 1105;
	text = "Обновления"; //--- ToDo: Localize;
	x = 0.457719 * safezoneW + safezoneX;
	y = 0.1304 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.055 * safezoneH;
	sizeEx = 0.050;
	style = 2;
};
class slk_title1: slkRscText
{
	idc = 2001;

	text = ""; //--- ToDo: Localize;
	x = 0.425719 * safezoneW + safezoneX;
	y = 0.1304 * safezoneH + safezoneY;
	w = 0.518594 * safezoneW;
	h = 0.105 * safezoneH;
	colorText[] = {0.882,0.02,0.176,1};
};
class slk_UpdateHUD1: slkRscStructuredText
{
	idc = 2100;

	text = ""; //--- ToDo: Localize;
	x = 0.226718 * safezoneW + safezoneX;
	y = 0.2078 * safezoneH + safezoneY;
	w = 0.646562 * safezoneW;
	h = 0.8 * safezoneH;
};
class slk_title2: slkRscText
{
	idc = 1002;

	text = ""; //--- ToDo: Localize;
	x = 0.226719 * safezoneW + safezoneX;
	y = 0.3614 * safezoneH + safezoneY;
	w = 0.118594 * safezoneW;
	h = 0.022 * safezoneH;
	colorText[] = {0.882,0.02,0.176,1};
};
class slk_rules2: slkRscStructuredText
{
	idc = 1101;
	text = ""; //--- ToDo: Localize;
	x = 0.226719 * safezoneW + safezoneX;
	y = 0.3878 * safezoneH + safezoneY;
	w = 0.546562 * safezoneW;
	h = 0.566 * safezoneH;
};
class slk_return: slkRscButton
{
	idc = 1601;
	text = "Вернуться в меню"; //--- ToDo: Localize;
	x = 0.226719 * safezoneW + safezoneX;
	y = 0.808 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.025;
	style = 2;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 7779); ExecVM 'Scripts\GUIMenu\menu_init.sqf';";
};
class slk_close_menu: slkRscButton
{
	idc = 1603;
	text = "Закрыть меню"; //--- ToDo: Localize;
	x = 0.685615 * safezoneW + safezoneX;
	y = 0.8102 * safezoneH + safezoneY;
	w = 0.0876563 * safezoneW;
	h = 0.044 * safezoneH;
	sizeEx = 0.025;
	style = 2;
	colorBackground[] = {0.047,0.376,0.776,1};
	onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 7779);";
};
};
};
