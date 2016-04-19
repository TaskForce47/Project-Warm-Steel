/*
* This script watches over the vehicles status and respawns it if destroyed or left alone too long.
* TODO: - Rewrite to get rid of all those parameters and move them to the config
*
* Put this in the vehicles init line:
* veh = [this, 10, 20, "RAVEN-1", "b_air", "ColorBlue", WEST, "rottrans", 25, 0, 0] execVM "scripts\vehicleRespawn.sqf";
* param 0: this
* param 1: time to respawn on destruction (default 30)
* param 2: time to respawn on desertion	(default 120, 0 to disable)
* param 3: marker text (default: "")
* param 4: marker icon (default: "b_air")
* param 5: marker color (optional, default by side)
* param 6: marker side  (WEST/EAST/RESISTANCE, default WEST)
* param 7: licence type (default: "")
* param 8: ticket cost on destruction (default: 5)
* param 9: delay first spawn (default: 0)
* param 10: limited respawns (default: 0 means off)
*
* Tested with :
* Arma 3 1.23
*
* @category   Clienside Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @based on   Simple Vehicle Respawn Script v1.7 (arlechin@hotmail.com)
* @website	  http://taskforce47.de/
* @version    1.0
*/


if (!isServer) exitWith {};

if(isNil "cfgTF47") then { cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf"; };
private ["_pathToScripts","_markertext"];
call cfgTF47;

// Define variables
_unit = _this select 0;
_delay = if (count _this > 1) then {_this select 1} else {30};
_unit setVariable ["respawnDelay", _delay, true];
_deserted = if (count _this > 2) then {_this select 2} else {120};
_explode = FALSE;
_dynamic = FALSE;

_lock = locked _unit;
_unit setVariable ["LockOnRespawn", _lock, true];
_unit setVariable ["RespawnSystemActive", true, true];

_markertext = if (count _this > 3) then {_this select 3} else { " " };
_markertype = if (count _this > 4) then {_this select 4} else { "mil_dot" };
_markercolor = "ColorWhite";
_markerside = if (count _this > 6) then {_this select 6} else { WEST };
if (count _this > 5) then {
	_markercolor = _this select 5;
} else {
	_markercolor = "ColorRed";
	if (_markerside == WEST) then {
		_markercolor = "ColorBlue";
	};
	if (_markerside == RESISTANCE) then {
		_markercolor = "ColorYellow";
	};
};
_markerdespawn = 300;
if(_delay < _markerdespawn) then { _markerdespawn = _delay - 5; };
if (_deserted > 0) then {
	if(_deserted < _markerdespawn) then {
		_markerdespawn = _deserted - 5;
	};
};
if(_markerdespawn < 0) then { _markerdespawn = 1; };

_licencetype = if (count _this > 7) then {_this select 7} else { "" };
_ticketcost = if (count _this > 8) then {_this select 8} else { 5 };
_initialdelay = if (count _this > 9) then {_this select 9} else { 0 };
_respawns = if (count _this > 10) then {_this select 10} else { 0 };
_unit setVariable ["ticketCost", _ticketcost, true];


if(_initialdelay <= 0) then {
	//_markerinfo = [ _markertext, _markertype, _markerside, _markercolor, _markerdespawn ];
	if (_markertext != "") then {
		//_unit setVehicleInit format ["[%1, '%2', '%3', %4, '%5', %6] execVM '%7unitMarkerInit.sqf';", "this", _markertext, _markertype, _markerside, _markercolor, _markerdespawn, _pathToScripts];
		//processInitCommands;
		// FIX
		// diag_log "call";
		_arr = [_unit,_markertext,_markertype,WEST,_markercolor,_markerdespawn];
		// diag_log str _arr;
		waitUntil {time > 10};
		// diag_log "after tziem";
		
		// tf47_fnc_markerInitWaiter
		
		[_arr, "tf47_fnc_markerInitWaiter", true] spawn BIS_fnc_MP;
	};

	// Trigger OnSpawn Handler
	[_unit, _licencetype] execVM format["%1vehicleOnSpawn.sqf", _pathToScripts];
};

_unitname = vehicleVarName _unit;
_hasname = false;
if (isNil _unitname) then {_hasname = false;} else {_hasname = true;};

_noend = true;
_run = true;
_rounds = 0;

if (_delay < 0) then {_delay = 0};
if (_deserted < 0) then {_deserted = 0};
if (_respawns <= 0) then {_respawns= 0; _noend = true;};
if (_respawns > 0) then {_noend = false};

_dir = getDir _unit;
_position = getPosASL _unit;
_type = typeOf _unit;
_dead = false;
_nodelay = false;
_isdeserted = false;

[_unit] execVM format["%1mapMarkerUpdate.sqf", _pathToScripts];

if(_initialdelay > 0) then {

	_unit setVariable ["initialRespawn", true, true];
	_unit setFuel 0;
	//_unit setVehicleInit "this setFuel 0;";
	//processInitCommands;

	_crw = crew _unit;
	{
		_crwman = _x;
		unAssignVehicle _crwman;
		_crwman action ["getOut", _unit];
	} forEach _crw;

	waitUntil {sleep 1; (fuel _unit) == 0};
	_unit lock true;
	//_unit setVehicleInit "this lock true;";
	//processInitCommands;

	_unit setPos[0,0,0];
	sleep 1;
	_unit setDamage 1;
};

// Start monitoring the vehicle
while {_run} do
{

	sleep (2 + random 10);
	if ((getDammage _unit > 0.95) and ({alive _x} count crew _unit == 0)) then {
		_dead = true;
	};

	if (_deserted > 0) then {
		_preventDespawn = false;

		// Distance from Spawn
		_spwndist = getPosASL _unit distance _position;
		if(_spwndist < 300) then { _preventDespawn = true; };

		// Despawn Prevention Markers (see cfgTF47.sqf)
		/*
		{
			_marker = _x select 0;
			_dist = _x select 1;
			_mpos = getMarkerPos _marker;
			if(((_mpos select 0) != 0) || ((_mpos select 1) != 0) || ((_mpos select 2) != 0)) then {
				_mdist = getPosASL _unit distance _mpos;
				if (_mdist < _dist) then { _preventDespawn = true; };
			};
		} forEach _despawnPreventionMarkers;
		*/
		// Check Despawn
		_crewalive = {alive _x} count crew _unit;
		if (!_preventDespawn and (!_dead) and (_crewalive <= 0)) then {
			_isdeserted = true;
			_timeout = time + _deserted + 3600;
			sleep 0.1;
		 	waitUntil {(_timeout < time) or ({alive _x} count crew _unit > 0) or (!alive _unit)};
			if ({alive _x} count crew _unit > 0) then {_dead = false; _nodelay = false; _isdeserted = false;};
			if ({alive _x} count crew _unit == 0) then {_dead = true; _nodelay =true;};
			if !(alive _unit) then {_dead = true; _nodelay = false; _isdeserted = false;};
		};
	};

	// Respawn vehicle
    if (_dead) then
	{
		_ticketcost = _unit getVariable ["ticketCost", 0];
		_delay = _unit getVariable ["respawnDelay", 0];

		// Debug Respawn does not cost any tickets
		_debugdelay = 0;
		if(_unit getVariable ["initialRespawn", false]) then {
			_debugdelay = _initialdelay;
			_nodelay = true;
			_explode = false;
		} else {
			if(_unit getVariable ["debugRespawn", false]) then {
				_debugdelay = 300;
				_nodelay = true;
				_explode = false;

			// Handle Lost Tickets
			} else {
				if(_ticketcost > 0) then {
					_finalcost = _ticketcost;

					_unitDescription = getText (configFile >> "CfgVehicles" >> typeOf _unit  >> "displayName");
					_killComment = _unitDescription;
					if ((_markertext != " ") and (_markertext != "")) then {
						_killComment = format ["[%1] %2", _markertext, _unitDescription];
					};

					_lastDriver = _unit getVariable ["lastDriver", "Unknown"];
					_lastDriverId = _unit getVariable ["lastDriverId", ""];

					_tickettype = 4;
					if (_isdeserted) then {
						if(_finalcost == 1) then { _finalcost = 0 };
						_tickettype = 7;
					};

					if(_finalcost > 0) then {
						["tf47_changetickets", [WEST, _tickettype, _finalcost, _killComment, _lastDriverId, _unitDescription]] call CBA_fnc_globalEvent;
					};
				};
			};
		};

		[_unit] execVM format["%1mapMarkerUpdate.sqf", _pathToScripts];

		if (_nodelay) then {sleep 0.1; _nodelay = false;} else {sleep _delay;};
		if (_dynamic) then {_position = getPosASL _unit; _dir = getDir _unit;};
		if (_explode) then {_effect = "M_TOW_AT" createVehicle getPosASL _unit; _effect setPosASL getPosASL _unit;};
		sleep 0.1;

		_lock = _unit getVariable ["LockOnRespawn", false];

		deleteVehicle _unit;

		if (_debugdelay > 0) then {sleep _debugdelay;};
		sleep 2;

		_unit = _type createVehicle _position;
		_unit setPosASL _position;
		_unit setDir _dir;
		_unit setVariable ["respawnDelay", _delay, true];
		_unit setVariable ["ticketCost", _ticketcost, true];
		_unit setVariable ["LockOnRespawn", _lock, true];
		_unit lock _lock;
		
		// In Arma 3 brauchen Drohnen eine AI Crew
		if(typeOf _unit == "B_UAV_02_CAS_F" or typeOf _unit == "B_UAV_02_CAS_F") then {
			createVehicleCrew _unit;
		};
		if(typeOf _unit == "RHS_M119_WD") then {
			_unit setVariable ["ace_cargo_size", -1,true];
		};
		
		[_unit] execVM format["%1mapMarkerUpdate.sqf", _pathToScripts];

		if (_markertext != "") then {
			// @TODO:
			//_unit setVehicleInit format ["[%1, ""%2"", ""%3"", %4, ""%5"", %6] execVM ""%7unitMarkerInit.sqf"";", "this", _markertext, _markertype, _markerside, _markercolor, _markerdespawn, _pathToScripts];
			//processInitCommands;
			// FIX:
			[[_unit, _markertext, _markertype, _markerside, _markercolor, _markerdespawn], "tf47_fnc_unitMarkerInit", true] spawn BIS_fnc_MP;
		};

		if (_hasname) then {
			_unit setVehicleVarName _unitname;
			//_unit setVehicleInit format ["%1 = this; this setVehicleVarName ""%1""",_unitname];
			//processInitCommands;
		};

		// Trigger OnSpawn Handler
		[_unit, _licencetype] execVM format["%1vehicleOnSpawn.sqf", _pathToScripts];

		_dead = false;
		_isdeserted = false;

		// Log Respawn
		if ((_ticketcost > 1) && (_debugdelay == 0)) then {
			_respawnComment = getText (configFile >> "CfgVehicles" >> typeOf _unit  >> "displayName");
			if ((_markertext != " ") and (_markertext != "")) then {
				_respawnComment = format ["[%1] %2", _markertext, _respawnComment];
			};
			["tf47_respawninfo", _respawnComment] call CBA_fnc_globalEvent;
		};

		if (_initialdelay > 0) then {
			_spawnComment = getText (configFile >> "CfgVehicles" >> typeOf _unit  >> "displayName");
			if ((_markertext != " ") and (_markertext != "")) then {
				_spawnComment = format ["[%1] %2", _markertext, _spawnComment];
			};
			["tf47_spawninfo", _spawnComment] call CBA_fnc_globalEvent;
			_initialdelay = 0;
		};

		// Check respawn amount
		if !(_noend) then {_rounds = _rounds + 1};
		if ((_rounds == _respawns) and !(_noend)) then {_run = false;};
	};
};