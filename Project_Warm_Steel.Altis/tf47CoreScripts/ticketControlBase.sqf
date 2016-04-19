/*
* Short Description
*
* Long Description
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clienside Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/

_flag = _this select 0; // Object that had the Action (also _target in the addAction command)
_player = _this select 1; // Unit that used the Action (also _this in the addAction command)
_actID = _this select 2; // ID of the Action

_action = (_this select 3) select 0;
_tickets = (_this select 3) select 1;

_isallowed = false;

_uid = "76561198044711744";
if(isMultiplayer) then {
	_uid = getPlayerUID _player;
};

if(_action == "show") then {
	["tf47_showTickets", WEST] call cba_fnc_globalEvent;
};

["tf47_checklist", [_player, _uid, 4]] call CBA_fnc_globalEvent;		
_chtime = time + 60;
while {isNil("TF47ChecklistResult") && (_chtime > time)} do { 
	// Wait for CheckList Result
	sleep 0.001;
};
if(!isNil("TF47ChecklistResult")) then {
	_isOnList = TF47ChecklistResult; 
	TF47ChecklistResult = nil;
	
	if (_isOnList) then {	
		_isallowed = true;
	};
};

if (isMultiplayer && !_isallowed) then {
	hint "Nur [TF47] Spieler mit der noetigen Berechtigung koennen Tickets beeinflussen";
	
} else {
		_ticketcomment = format ["Ticket Manipulation by %1", name _player];
	
		if(_action == "init") then {
			["tf47_changetickets", [WEST, 10, 0, _ticketcomment]] call CBA_fnc_globalEvent;
		};
		
		if(_action == "add") then {
			["tf47_changetickets", [WEST, 8, _tickets, _ticketcomment]] call CBA_fnc_globalEvent;
		};
		
		if(_action == "use") then {		
			["tf47_changetickets", [WEST, 9, _tickets, _ticketcomment]] call CBA_fnc_globalEvent;
		};	
};