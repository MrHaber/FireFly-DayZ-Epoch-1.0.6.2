disableSerialization;

while{1 == 1}do
{
	waitUntil {uiSleep 0.1;!isNull findDisplay 49};
	_display = findDisplay 49;

	if(!isNull _display)then
	{
		_btnSave = _display displayCtrl 103;
		_btnSave ctrlShow true;
		_btnSave ctrlEnable false;
		_btnSave ctrlSetScale 0.8;
		_btnSave ctrlSetText 'Ваш SteamID:';
		_btnSave ctrlCommit 0;

		_btnRestart = _display displayCtrl 119;
		_btnRestart ctrlShow true;
		_btnRestart ctrlEnable false;
		_btnRestart ctrlSetScale 0.9;
		_btnRestart ctrlSetText (format['%1',getPlayerUID player]);
		_btnRestart ctrlCommit 0;

		_btnRespawn = _display displayCtrl 1010;
		_btnRespawn ctrlShow true;
		_btnRespawn ctrlEnable true;
		_btnRespawn ctrlSetScale 0.9;
		_btnRespawn ctrlSetText 'Меню игрока';
		_btnRespawn ctrlSetTextColor [0.6,0,0,1];
		_btnRespawn buttonSetAction '
			[player,''btnRespawn''] execVM "Scripts\GUIMenu\menu_init.sqf";
		';
		_btnRespawn ctrlCommit 0;

		_btnTitle0 = _display displayCtrl 523;
		_btnTitle0 ctrlSetText (format['%1',name player]);
		_btnTitle0 ctrlSetTextColor [0.6,0,0,1];
		_btnTitle0 ctrlSetScale 0.9;
		_btnTitle0 ctrlCommit 0;

		_btnTitle1 = _display displayCtrl 121;
		_btnTitle1 ctrlSetText 'FireFly DayZ Epoch';
		_btnTitle1 ctrlSetTextColor [0.6,0,0,1];
		_btnTitle1 ctrlSetScale 0.9;
		_btnTitle1 ctrlCommit 0;

		_btnTitle2 = _display displayCtrl 120;
		_btnTitle2 ctrlSetText 'Приятной игры!';
		_btnTitle2 ctrlSetTextColor [0.6,0,0,1];
		_btnTitle2 ctrlSetScale 0.9;
		_btnTitle2 ctrlCommit 0;
	};
};