disableSerialization;

_serverName		=	"FireFly DayZ Epoch";
_ts3IP			=	"ts.a3mg.ru";
_websiteUrl		=	"ТeamSpeak Server:";

_action1Text = "Беруши";
action1script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777);
	call player_toggleSoundMute;
};

_action2Text = "UI";
action2script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777);
	profileNamespace setVariable ["statusUI",(if (profileNamespace getVariable ["statusUI",1] == 1) then {0} else {1})];
	saveProfileNamespace;
	call ui_changeDisplay;
};

_info1Text = "*Правила*";
info1script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777);
	//execvm 'Scripts\GUIMenu\rules_init.sqf';
};

_info2Text = "*Помощь*";
info2script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777);
	createDialog "Guide";
};

_info3Text = "Обновления";
info3script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777);
	execvm 'Scripts\GUIMenu\update_init.sqf';
};

_info4Text		= "*О сервере*";
info4script		=
{
	((ctrlParent (_this select 0)) closeDisplay 7777); 
	execvm 'Scripts\GUIMenu\about_init.sqf';
};

_filter1text = "ARMA";
filter1script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\ArmaMission.sqf';};

_filter2text = "BLUE";
filter2script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\Blue.sqf';};

_filter3text = "CONTRAST";
filter3script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\ClearContrast.sqf';};

_filter4text = "DEMONIC";
filter4script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\DemonicDark.sqf';};

_filter5text = "OPERATION FP";
filter5script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\OFP.sqf';};

_filter6text = "OLD PHOTO";
filter6script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\OldPhoto.sqf';};

_filter7text = "SAND";
filter7script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\Sand.sqf';};

_filter8text = "SEPIA";
filter8script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\SepiaWasteland.sqf';};

_filter9text = "SMOOTH";
filter9script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\Smooth.sqf';};

_filter10text = "SUMMER";
filter10script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\SummerChernarus.sqf';};

_filter11text = "TROPICAL";
filter11script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\Tropical.sqf';};

_filter12text = "WAR";
filter12script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\War.sqf';};

_filter13text = "INFECTED";
filter13script = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\Infected.sqf';};

_filterCleartext = "СБРОС ФИЛЬТРА";
filterClearscript = {((ctrlParent (_this select 0))); execvm 'Scripts\ScreenFilters\Default.sqf';};


createDialog "menu";

fnc_update_all_text =
{
	_finddialog = findDisplay 7777;
	(_finddialog displayCtrl 1609) ctrlSetText format["%1",_action1Text];
	(_finddialog displayCtrl 1650) ctrlSetText format["%1",_action2Text];
	(_finddialog displayCtrl 1651) ctrlSetText format["%1",_info1Text];
	(_finddialog displayCtrl 1652) ctrlSetText format["%1",_info2Text];
	(_finddialog displayCtrl 1653) ctrlSetText format["%1",_info3Text];
	(_finddialog displayCtrl 1654) ctrlSetText format["%1",_info4Text];
	(_finddialog displayCtrl 1614) ctrlSetText format["%1",_filter1text];
	(_finddialog displayCtrl 1615) ctrlSetText format["%1",_filter2text];
	(_finddialog displayCtrl 1616) ctrlSetText format["%1",_filter3text];
	(_finddialog displayCtrl 1617) ctrlSetText format["%1",_filter4text];
	(_finddialog displayCtrl 1618) ctrlSetText format["%1",_filter5text];
	(_finddialog displayCtrl 1619) ctrlSetText format["%1",_filter6text];
	(_finddialog displayCtrl 1620) ctrlSetText format["%1",_filter7text];
	(_finddialog displayCtrl 1621) ctrlSetText format["%1",_filter8text];
	(_finddialog displayCtrl 1622) ctrlSetText format["%1",_filter9text];
	(_finddialog displayCtrl 1623) ctrlSetText format["%1",_filter10text];
	(_finddialog displayCtrl 1624) ctrlSetText format["%1",_filter11text];
	(_finddialog displayCtrl 1625) ctrlSetText format["%1",_filter12text];
	(_finddialog displayCtrl 1626) ctrlSetText format["%1",_filter13text];
	(_finddialog displayCtrl 1630) ctrlSetText format["%1",_filterCleartext];
	(_finddialog displayCtrl 1001) ctrlSetText format["%1",_websiteUrl];
	(_finddialog displayCtrl 1002) ctrlSetText format["%1",_ts3IP];
	(_finddialog displayCtrl 10003) ctrlSetText format["%1",_ts3IP];
	(_finddialog displayCtrl 1000) ctrlSetText format["%1 Меню игрока",_serverName];
};

call fnc_update_all_text;