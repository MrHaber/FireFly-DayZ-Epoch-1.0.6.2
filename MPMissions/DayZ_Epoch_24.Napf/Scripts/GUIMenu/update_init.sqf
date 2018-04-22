disableSerialization;
///////////////////
//////Config//////
/////////////////

_update1title = "Обновления за 30.03.2018";
_update1text = "testing";

nexts2cript = {((ctrlParent (_this select 0)) closeDisplay 7779); execvm 'Scripts\GUIMenu\update2_init.sqf';};
previous2script = {((ctrlParent (_this select 0)) closeDisplay 7779); execvm 'Scripts\GUIMenu\menu_init.sqf';};


createDialog "Update";


////////////////////////////////
//DO NOT EDIT BELLOW THIS LINE//
////////////////////////////////


fnc_update_all_text = {
_finddialog = findDisplay 7779;
(_finddialog displayCtrl 1001) ctrlSetText format["%1",_rule1title];
(_finddialog displayCtrl 1100) ctrlSetText format["%1",_rule1text];
/*
	(_finddialog displayCtrl 1002) ctrlSetText format["%1",_rule2title];
	(_finddialog displayCtrl 1101) ctrlSetText format["%1",_rule2text];
	(_finddialog displayCtrl 1003) ctrlSetText format["%1",_rule3title];
	(_finddialog displayCtrl 1102) ctrlSetText format["%1",_rule3text];
	(_finddialog displayCtrl 1004) ctrlSetText format["%1",_rule4title];
	(_finddialog displayCtrl 1103) ctrlSetText format["%1",_rule4text];
	(_finddialog displayCtrl 1005) ctrlSetText format["%1",_rule5title];
	(_finddialog displayCtrl 1104) ctrlSetText format["%1",_rule5text];
*/
};

call fnc_update_all_text;




