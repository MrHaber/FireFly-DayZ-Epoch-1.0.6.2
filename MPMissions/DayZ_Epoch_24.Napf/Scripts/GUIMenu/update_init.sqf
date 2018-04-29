disableSerialization;

_update1title = "Обновления за 28.04.2018";
_update1text = "Сегодня без обнов. Я устал. Дайте передышку.
";

createDialog "Update";

fnc_update_all_text =
{
	_finddialog = findDisplay 7779;
	(_finddialog displayCtrl 2001) ctrlSetText format["%1",_update1title];
	(_finddialog displayCtrl 2100) ctrlSetText format["%1",_update1text];
};

call fnc_update_all_text;




