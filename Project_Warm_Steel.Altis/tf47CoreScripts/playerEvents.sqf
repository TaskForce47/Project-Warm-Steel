if (isServer) exitWith {};

["tf47_player_message", {
			//["tf47_player_message", [player, "taskFailed", "test message"]] call CBA_fnc_globalEvent;
			_player 		= _this select 0;
			_messageType 	= _this select 1;
			_message 		= _this select 2;

			if( player == _player ) then {
				taskHint [_message, [1, 0, 0, 1], _messageType];
				// [_messageType,["TEST",_message]] call BIS_fnc_showNotification; //todo: if we can redefine the size of our custom task windows, let's use this one
			};
		}
] call CBA_fnc_addEventHandler;

["tf47_player_hint", {
			//["tf47_player_message", [player, "message"]] call CBA_fnc_globalEvent;
			_player 		= _this select 0;
			_message 		= _this select 1;

			if( player == _player ) then {
				hint parseText _message;
			};
		}
] call CBA_fnc_addEventHandler;

//todo: should be used in the future
PV_taskhint = [];
"PV_taskhint" addPublicVariableEventHandler {

	diag_log format ["** received PV (args: %1) **", _this];

	_player = (_this select 1) select 0;
	_message = (_this select 1) select 1;

	if( _player == player ) then {
		taskHint [_message, [1, 0, 0, 1], "taskFailed"];
	};
};