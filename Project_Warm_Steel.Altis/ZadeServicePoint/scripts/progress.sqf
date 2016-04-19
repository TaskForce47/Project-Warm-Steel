////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: progress.sqf
 *	Author:	DerZade
 *	Description: Shows Servicing-Progress in the chat of the player
 *
 *	
 *	Parameter:
 *		0: Time
 *		1: Player
 *
 *	Return Value: NONE
 */
////////////////////////////////////////////////////////////////////////////////

_time = _this select 0;
_caller = _this select 1;

//_time = _time - (_time / 10);
_time = _time / 10;

for "_i" from 1 to 9 do {
	sleep _time;
	_text = format ["ServicePoint | %1 %2",_i*10,"%"];
	if (player == _caller) then {
		systemChat _text;
	};
};

if (true) exitWith {true};