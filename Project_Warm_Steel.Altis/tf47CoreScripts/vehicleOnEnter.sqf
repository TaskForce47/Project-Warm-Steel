/*
* This script kicks in when somebody enters a vehicle
* It makes sure that the person is authorized to use this vehicle slot
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

if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
private ["_pathToScripts", "_vehicleRestrictions"];
waitUntil { !isNil "cfgTF47" };
call cfgTF47;


_params = _this select 0;
_vehicle = _params select 0;
_vehicleIdentifier = format["%1", _vehicle];
_position = _params select 1;
_player = _params select 2;
_playerSlot = format["%1", _player];

// Let Dustoff become Dustoff
if(typeOf _vehicle == "RHS_UH60M_MEV2") then {
	[[_player,civilian],"tf47_fnc_changePlayerSide"] call BIS_fnc_MP;
};

_playerid = "7412934";
if(isMultiplayer) then {
	_playerid = getPlayerUID _player;
};

_licenceType = _this select 1;
_validSlots = [];
_whitelistId = 0;

_kickout = false;

// we add a eventhandler for the clients to send them messages
if (_player == player) then {
//if ( true ) then {

	["tf47_diaglog", format["Player %1 (UID %2) is trying to enter Position %3 of Vehicle %4", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;

	// Enemy Vehicles
	if (!_kickout AND (side _player != EAST) AND (_player == player) AND (_licenceType == "eastveh")) then {
		["tf47_diaglog", format["Player %1 was trying to enter Position %2 of Vehicle %3: FAILED (Enemy Vehicle)", _player, _position, _vehicle]] call CBA_fnc_globalEvent;
		["tf47_player_message", [_player, "taskFailed", "Es ist nicht erlaubt, dieses Feindfahrzeug zu verwenden.\n\nIt is not allowed to use this enemy vehicle."]] call CBA_fnc_globalEvent;
		_kickout = true;
	};

	// No Vehicle Usage without ACRE
	#ifdef ACRE
	if (!_kickout AND (isNil "acre_sys_core_ts3id") OR (acre_sys_core_ts3id == -1) AND isMultiplayer) then {
		["tf47_diaglog", format["Player %1 was trying to enter Position %2 of Vehicle %3: FAILED (No ACRE)", _player, _position, _vehicle]] call CBA_fnc_globalEvent;
		["tf47_player_message", [_player, "taskFailed", "Dieses Fahrzeug darfst du nur mit aktivem ACRE verwenden.\n\nThis Vehicle can only be used with an active ACRE connection."]] call CBA_fnc_globalEvent;
		_kickout = true;
	};
	#endif

	// Check Slots and get WhitelistID
	if(!_kickout) then {
		_vehicleRestrictionLine = [_vehicleRestrictions, _vehicleIdentifier] call CBA_fnc_hashGet;
		_vehicleRestrictionLineCount = count _vehicleRestrictionLine;
		if(_vehicleRestrictionLineCount > 0) then {
			["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: Found Vehicle Restrictions for %5", _player, _playerid, _position, _vehicle, _vehicleIdentifier]] call CBA_fnc_globalEvent;

			_vrList = [];
			_vrDriversWhitelistId = _vehicleRestrictionLine select 0;
			_vrGunnersWhitelistId = _vehicleRestrictionLine select 1;
			_vrDrivers = _vehicleRestrictionLine select 2;
			_vrGunners = _vehicleRestrictionLine select 3;

			if (_position == "driver") then {
				_whitelistId = _vrDriversWhitelistId;
				_vrList = _vrDrivers;
			};

			if (_position in ["gunner", "commander"]) then {
				_whitelistId = _vrGunnersWhitelistId;
				_vrList = _vrGunners;
			};

			if ((count(_vrList)>0) && !(_playerSlot in _vrList)) then {
				["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: FAILED (Slot)", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;
				["tf47_player_message", [_player, "taskFailed", "Diese Fahrzeugposition darfst du nur mit bestimmten Slot verwenden.\n\nThis Vehicle Position can only be used by certain slots."]] call CBA_fnc_globalEvent;

				//pv_taskhint = [_player, "Diese Fahrzeugposition darfst du nur mit bestimmten Slot verwenden.\n\nThis Vehicle Position can only be used by certain slots."];
				//publicVariable "pv_taskhint";

				_kickout = true;
			} else {
				["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: Whitelist ID is %5", _player, _playerid, _position, _vehicle, _whitelistId]] call CBA_fnc_globalEvent;
			};
		};
	};

	// if (!isMultiplayer) then {
		// ["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: FAIL and Whitelist ignored in Singleplayer", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;
		// _kickout = false;
		// _whitelistId = 0;
	// };

	// Check Vehicle Debug Respawn
	if (!_kickout && (_vehicle getVariable ["debugRespawn", false])) then {
		["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: FAILED (Debug Respawn)", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;
		["tf47_player_message", [_player, "taskFailed", "Dieses Fahrzeug wird in Kuerze respawnen.\n\nThis Vehicle will respawn soon."]] call CBA_fnc_globalEvent;
		_kickout = true;
	};

	// Check Whitelist
	if (!_kickout AND (_whitelistId > 0)) then {
		["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: Checking Whitelist... ", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;

		// Check if Player is on Whitelist
		["tf47_checklist", [_player, _playerid, _whitelistId]] call CBA_fnc_globalEvent;

		_chtime = time + 10;
		while {isNil("TF47ChecklistResult") && (_chtime > time) && (vehicle _player == _vehicle)} do {
			// Wait for CheckList Result
			sleep 0.001;
		};

		_isOnList = false;
		_gotResult = false;
		if(!isNil("TF47ChecklistResult")) then {
			["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: Got Whitelist Result: %5", _player, _playerid, _position, _vehicle, TF47ChecklistResult]] call CBA_fnc_globalEvent;
			_isOnList = TF47ChecklistResult;
			TF47ChecklistResult = nil;
			_gotResult = true;
		};

		if ((vehicle _player == _vehicle) && !_isOnList) then {

			["tf47_player_message", [_player, "taskFailed", "Diese Fahrzeugposition steht nur ausgewaehlten Spielern zur Verfuegung. Details bzw. Anmeldung dazu im Forum.\n\nThis Vehicle Position may only be used by selected players."]] call CBA_fnc_globalEvent;

			//todo: should be used in the future to send messages directly to the client
			//PV_taskhint = [_player, "Diese Fahrzeugposition steht nur ausgewaehlten Spielern zur Verfuegung. Details bzw. Anmeldung dazu im Forum.\n\nThis Vehicle Position may only be used by selected players."];
			//(owner _player) publicVariableClient "PV_taskhint";

			if(!_gotResult) then {
				["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: FAILED (Whitelist Timeout)", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;
				["tf47_player_hint", [_player, format ["<t color=""#FF0000"">Timeout bei Whitelist Authorisierungsanfrage. Bitte versuche es erneut.<br/><br/>Whitelist Authorization Request timed out. Please try again.</t>"]]] call CBA_fnc_globalEvent;
			} else {
				["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: FAILED (Not on Whitelist)", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;
			};
			_kickout = true;
		};
	};


	// Player is not allowed in this slot, kick him out
	if (_kickout) then {

		_fuel = fuel _vehicle;
		_vehicle setFuel 0;
		unAssignVehicle _player;
		_player action ["getOut", _vehicle];
		waitUntil {sleep 1; (fuel _vehicle) == 0};
		_vehicle setFuel _fuel;

	// Player is allowed to be in this slot
	} else {
		["tf47_diaglog", format["Player %1 (UID %2) was trying to enter Position %3 of Vehicle %4: SUCCESS", _player, _playerid, _position, _vehicle]] call CBA_fnc_globalEvent;

		if (_position in ["driver", "gunner"]) then {
			["tf47_player_hint", [_player, format ["Dieses Fahrzeug kostet:<br/>This Vehicle costs:<br/><t color=""#CCCCFF"">%1 Tickets</t>", _vehicle getVariable ["ticketCost", 0]]]] call CBA_fnc_globalEvent;
		};

		if (!isMultiplayer) then {
			//hint parseText format ["Entering Slot: %1", _position];
		};

		if (_position == "driver") then {
			if (_licenceType != "") then {
				[_vehicle] execVM format["%1mapMarkerUpdate.sqf", _pathToScripts];
			};
		};

		_isSeated = _vehicle getVariable ["vehicleSeated", 0];
		if (_isSeated == 0) then {
			_vehicle setVariable ["vehicleSeated", 1, true];
			[_vehicle] execVM format["%1vehicleSeated.sqf", _pathToScripts];
		};
	};
};