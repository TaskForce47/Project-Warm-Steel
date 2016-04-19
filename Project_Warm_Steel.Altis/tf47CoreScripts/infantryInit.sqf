/*
* Init file for Infantry Units
* Checks Whitelist
* Long description for file (if any)...
*
* Tested with :
* Arma 3 1.23
*
* @category   Clientside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @author     [TF47] meat
* @website	  http://taskforce47.de/
* @version    1.0
*/

if(isNil "cfgTF47") then { cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf"; };
private ["_pathtoscripts", "_infantryStaminaClass", "_secureSlots", "_defaultLoadouts"];
call cfgTF47;

_unit = _this select 0;
_unitslot = format["%1", _unit];

// Stamina anpassen an die eines Delta Force Soldaten
#ifdef ACE3
_unit setVariable ["ACE_STAMINA_CLASS", _infantryStaminaClass, true];
#endif


if(isMultiplayer) then {

	if (_unit == player) then {

		// Send Player Data to Database
		["tf47_loginlog", player] call CBA_fnc_globalEvent;

		// Secure Slots
		_slotname = format["%1", player];
		{
			_thisslot = _x select 0;

			if(_slotname == _thisslot) then {

				_uid = "7412934";
				if(isMultiplayer) then {
					_uid = getPlayerUID player;
				};

				_listid = _x select 1;
				["tf47_checklist", [player, _uid, _listid]] call CBA_fnc_globalEvent;

				_chtime = time + 30;
				_gotResult = true;
				while {isNil("TF47ChecklistResult") && (_chtime > time)} do {
					// Wait for CheckList Result
					sleep 0.001;
				};
				if(isNil("TF47ChecklistResult")) then {
					_gotResult = false;
					TF47ChecklistResult = false;
				};

				_isOnList = TF47ChecklistResult;
				TF47ChecklistResult = nil;
				if (!_isOnList) then {
					diag_log format ["Player %1 not on Whiteist for Slot %2", name player, _slotname];
					taskhint ["Du hast keine Genehmigung, diesen Slot zu benutzen.\n\nYou are not allowed to use this slot.", [1, 0, 0, 1], "taskFailed"];
					if(!_gotResult) then {
						hint parseText format ["Timeout bei Whitelist Authorisierungsanfrage. Bitte versuche es erneut.<br/><br/>Whitelist Authorization Request timed out. Please try again."];
					};
					sleep 5;
					endmission "LOSER";
				};
			};
		} forEach _secureSlots;
	};
};
