disableSerialization;

_rule1title = "Общие правила сервера";
_rule1text = "НЕЗНАНИЕ ПРАВИЛ НЕ ОСВОБОЖДАЕТ ОТ ОТВЕТСТВЕННОСТИ\n
1.1 Не увлекаться флудом в голосовом канале.\n
1.2 Запрещена реклама любых товаров, услуг и пиаринга.\n
1.3 Запрещено выдавать себя за администрацию/модерацию, угрожать от имени администрации/модерации.\n
1.4 Запрещено выпрашивание у администрации/модерации каких-либо услуг.\n
1.5 Разговаривать матом, заниматься траллингом, оскорблять и тому подобное.\n
1.6 Запрещена насильная бомбардировка техникой. Камикадзе!\n
";

_rule2title = "Баги, читы, игровой процесс";
_rule2text = "2.1 ЗАПРЕЩЕНО использовать читы и стороннее программное обеспечение, дающее преимущество в игровом процессе.\n
2.2 ЗАПРЕЩЕНА продажа игровых предметов за реальные деньги.\n
2.3 ЗАПРЕЩЕНО использовать дюпы.\n
2.4 ЗАПРЕЩЕНО Релогаться в бою (Создается бот!).\n
2.5 РАЗРЕШЕНО Кемперство миссии так как это игровой процесс.
";

_rule3title = "Сейв-Зоны";
_rule3text = "Rule";

_rule4title = "Rule #4 Title"; //Text that will be the title of rule #4
_rule4text = "Rule"; //Text that will go in rule # 4 Box, maximum of Approx 300 characters

_rule5title = "Rule #5 Title"; //Text that will be the title of rule #5
_rule5text = "Rule"; //Text that will go in rule # 5 Box, maximum of Approx 300 characters

nextscript = {((ctrlParent (_this select 0)) closeDisplay 7778); execvm 'custom\menu\rules2_init.sqf';};
//previousscript = {((ctrlParent (_this select 0)) closeDisplay 7778); execvm 'custom\menu\YOUR_MENU_INIT.sqf';};


createDialog "rules";

fnc_update_all_text =
{
	_finddialog = findDisplay 7778;
	(_finddialog displayCtrl 1001) ctrlSetText format["%1",_rule1title];
	(_finddialog displayCtrl 1100) ctrlSetText format["%1",_rule1text];
	(_finddialog displayCtrl 1002) ctrlSetText format["%1",_rule2title];
	(_finddialog displayCtrl 1101) ctrlSetText format["%1",_rule2text];
	(_finddialog displayCtrl 1003) ctrlSetText format["%1",_rule3title];
	(_finddialog displayCtrl 1102) ctrlSetText format["%1",_rule3text];
	(_finddialog displayCtrl 1004) ctrlSetText format["%1",_rule4title];
	(_finddialog displayCtrl 1103) ctrlSetText format["%1",_rule4text];
	(_finddialog displayCtrl 1005) ctrlSetText format["%1",_rule5title];
	(_finddialog displayCtrl 1104) ctrlSetText format["%1",_rule5text];
};

call fnc_update_all_text;