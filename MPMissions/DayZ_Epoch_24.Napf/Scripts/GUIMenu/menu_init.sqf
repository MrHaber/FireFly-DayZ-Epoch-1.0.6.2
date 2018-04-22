disableSerialization;

_serverName		=	"FireFly DayZ Epoch";
_ts3IP			=	"ts.a3mg.ru";
_websiteUrl		=	"ТeamSpeak Server:";

_action1Text = "Беруши";
action1script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777); call player_toggleSoundMute;
};

_action2Text = "Бля";
action2script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777);
};

_info1Text = "Правила";
info1script =
{
	((ctrlParent (_this select 0)) closeDisplay 7777);
	execvm 'Scripts\GUIMenu\rules_init.sqf';
};

_info2Text = "Гайды";
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

_info4Text		= "О сервере";
info4script		=
{
	((ctrlParent (_this select 0)) closeDisplay 7777); 
	execvm 'Scripts\GUIMenu\about_init.sqf';
};

_deployable1Text = "Bike"; //Text that will go on deployable button 1
_deploy1item1Text = "ToolBox"; //Text that will go in the number 1 item slot under the first deploy button 
_deploy1item2Text = ""; //Text that will go in the number 2 item slot under the first deploy button 
_deploy1item3Text = ""; //Text that will go in the number 3 item slot under the first deploy button 
_deploy1item4Text = ""; //Text that will go in the number 4 item slot under the first deploy button 
_deploy1item5Text = ""; //Text that will go in the number 5 item slot under the first deploy button 
deployable1script = {execvm 'Scripts\GUIMenu\scripts\deploy_bike.sqf';};//script that deploy button 1 will use

_deployable2Text = "Deploy Item 2"; //Text that will go on deployable button 2
_deploy2item1Text = ""; //Text that will go in the number 1 item slot under the Second deploy button 
_deploy2item2Text = ""; //Text that will go in the number 2 item slot under the Second deploy button 
_deploy2item3Text = ""; //Text that will go in the number 3 item slot under the Second deploy button 
_deploy2item4Text = ""; //Text that will go in the number 4 item slot under the Second deploy button 
_deploy2item5Text = ""; //Text that will go in the number 5 item slot under the Second deploy button 
deployable2script = {((ctrlParent (_this select 0)) closeDisplay 7777); execvm 'custom\menu\scripts\deploy_2.sqf';}; //script that deploy button 2 will use

_deployable3Text = "Deploy Item 3"; //Text that will go on deployable button 3
_deploy3item1Text = ""; //Text that will go in the number 1 item slot under the third deploy button 
_deploy3item2Text = ""; //Text that will go in the number 2 item slot under the third deploy button 
_deploy3item3Text = ""; //Text that will go in the number 3 item slot under the third deploy button 
_deploy3item4Text = ""; //Text that will go in the number 4 item slot under the third deploy button 
_deploy3item5Text = ""; //Text that will go in the number 5 item slot under the third deploy button 
deployable3script = {((ctrlParent (_this select 0)) closeDisplay 7777); execvm 'custom\menu\scripts\deploy_3.sqf';}; //script that deploy button 3 will use

createDialog "menu";

fnc_update_all_text =
{
	_finddialog = findDisplay 7777;
	(_finddialog displayCtrl 1609) ctrlSetText format["%1",_action1Text];
	(_finddialog displayCtrl 1610) ctrlSetText format["%1",_action2Text];
	(_finddialog displayCtrl 1611) ctrlSetText format["%1",_info1Text];
	(_finddialog displayCtrl 1612) ctrlSetText format["%1",_info2Text];
	(_finddialog displayCtrl 1613) ctrlSetText format["%1",_info3Text];
	(_finddialog displayCtrl 1618) ctrlSetText format["%1",_info4Text];
	(_finddialog displayCtrl 1614) ctrlSetText format["%1",_deployable1Text];
	(_finddialog displayCtrl 1615) ctrlSetText format["%1",_deployable2Text];
	(_finddialog displayCtrl 1616) ctrlSetText format["%1",_deployable3Text];
	(_finddialog displayCtrl 1007) ctrlSetText format["%1",_deploy1item1Text];
	(_finddialog displayCtrl 1008) ctrlSetText format["%1",_deploy1item2Text];
	(_finddialog displayCtrl 1009) ctrlSetText format["%1",_deploy1item3Text];
	(_finddialog displayCtrl 1010) ctrlSetText format["%1",_deploy1item4Text];
	(_finddialog displayCtrl 1011) ctrlSetText format["%1",_deploy1item5Text];
	(_finddialog displayCtrl 1012) ctrlSetText format["%1",_deploy2item1Text];
	(_finddialog displayCtrl 1013) ctrlSetText format["%1",_deploy2item2Text];
	(_finddialog displayCtrl 1014) ctrlSetText format["%1",_deploy2item3Text];
	(_finddialog displayCtrl 1015) ctrlSetText format["%1",_deploy2item4Text];
	(_finddialog displayCtrl 1016) ctrlSetText format["%1",_deploy2item5Text];
	(_finddialog displayCtrl 1017) ctrlSetText format["%1",_deploy3item1Text];
	(_finddialog displayCtrl 1018) ctrlSetText format["%1",_deploy3item2Text];
	(_finddialog displayCtrl 1019) ctrlSetText format["%1",_deploy3item3Text];
	(_finddialog displayCtrl 1020) ctrlSetText format["%1",_deploy3item4Text];
	(_finddialog displayCtrl 1021) ctrlSetText format["%1",_deploy3item5Text]; 
	(_finddialog displayCtrl 1001) ctrlSetText format["%1",_websiteUrl];
	(_finddialog displayCtrl 1002) ctrlSetText format["%1",_ts3IP];
	(_finddialog displayCtrl 10003) ctrlSetText format["%1",_ts3IP];
	(_finddialog displayCtrl 1000) ctrlSetText format["%1 Меню игрока",_serverName];
};

call fnc_update_all_text;