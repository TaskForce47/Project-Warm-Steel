_keyCode = _this select 1;
_ctrlKey = _this select 3;
_player = Player;
_tickets = 0;

if (_ctrlKey and (_keyCode == 22) and !(dialog)) then {
	
	if (TF47_UMenu_showTickets) then {
		createDialog "TF47_UMenu_Dialog_UMenu_Tickets";
	} else {
		createDialog "TF47_UMenu_Dialog_UMenu";
	};

	_dialog = uiNamespace getVariable "TF47_UMenu_Dialog_UMenu";
	_name = name _player;
	
	_ctrl = _dialog displayCtrl 1001;
	_ctrl ctrlSetText _name;
	
	if (leader (group _player) != _player) then {
		_ctrl = _dialog displayCtrl 1003;
		_ctrl ctrlEnable false;
		_ctrl ctrlSetTooltip "You have to be the group leader to change your BFT-Name";
	};

	if (TF47_UMenu_showTickets) then {
		_ctrl = _dialog displayCtrl 1002;
		_ctrl ctrlSetText format ["%1",_tickets];
	};
};
