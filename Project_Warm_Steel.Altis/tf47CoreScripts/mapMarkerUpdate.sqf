/*
* Updates Mapmarkers
* 
* Long Description
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clientside & Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/

if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
private ["_pathToScripts", "_statusMarkers"];
waitUntil { !isNil "cfgTF47" };
call cfgTF47;

_unitname = "unknown";
if(count(_this) > 0) then {
	_unitname = format["%1", _this select 0];
};

_statusMarkersLine = [_statusMarkers, _unitname] call CBA_fnc_hashGet;
_statusMarkersLineCount = count _statusMarkersLine;
if(_statusMarkersLineCount == 0) exitWith {true};

_marker = _statusMarkersLine select 0;
_icon = _statusMarkersLine select 1;
_color = _statusMarkersLine select 2;
_text = _statusMarkersLine select 3;
_isslot = _statusMarkersLine select 4;
_isonline = false;

if(isNil {(call compile _unitname)}) exitWith {};

_unit = objNull;
call compile format["_unit = %1;", _unitname];

_emptyHash = [[], [false, false, false]] call CBA_fnc_hashCreate;
_vehMemory = missionNamespace getVariable ["vehicleMarkerMemory", _emptyHash];
_thisVehMemory = [_vehMemory, _unitname] call CBA_fnc_hashGet;

_wasinitialized = _thisVehMemory select 0;
_wasonline = _thisVehMemory select 1;
_wasdestroyed = _thisVehMemory select 2;

if(!_wasinitialized) then {
	_marker setMarkerType _icon;
	_marker setMarkerColor "ColorBlack";
	_marker setMarkerAlpha 0.3;
	_marker setMarkerText format["%1: N/A", _text];
	_thisVehMemory set [0, true];
};

// Check if Unit even exists
if (!isNil _unitname) then {

	// If Unit is a Vehicle, we need to check the driver, not the unit itself
	_status = 0;
	if (!_isslot) then {
		_status = getDammage _unit;
		_unit = driver _unit;
	};

	// Checking if the Unit is a Player, thus marking Unit as online
	if (isPlayer _unit) then {
		_isonline = true;
	};		

	// If this is the first time running this, make sure there is a change
	if (!_wasinitialized || _wasdestroyed) then {
		_wasonline = !_isonline;
	};
	
	// Check if there has been a change
	if((!_wasonline && _isonline) || (_wasonline && !_isonline)) then {
	
		// Slot/Vehicle is in use by a player
		if (_isonline) then {
			_playername = name _unit;
			_marker setMarkerColor _color;
			_marker setMarkerAlpha 1;
			_marker setMarkerText format["%1: %2", _text, _playername];

		} else {
			// Slot is used, but not by a player
			if(_isslot) then {
				_marker setMarkerColor "ColorBlack";
				_marker setMarkerAlpha 0.2;
				_marker setMarkerText format["%1: N/A", _text];

			// Vehicle exists, but is not used by a player
			} else {
				if(_status <= 0.8) then {
					_marker setMarkerColor "ColorBlack";
					_marker setMarkerAlpha 0.6;
					_marker setMarkerText format["%1: Not in use", _text];
				} else {
					_marker setMarkerColor "ColorBlack";
					_marker setMarkerAlpha 0.2;
					_marker setMarkerText format["%1: N/A", _text];						
				};
			};
		};
		
		_thisVehMemory set [1, _isonline];
		_thisVehMemory set [2, false];
	};

// Unit does not exist
} else {

	// Slot is not used
	if(_isslot) then {
		_marker setMarkerColor "ColorBlack";
		_marker setMarkerAlpha 0.2;
		_marker setMarkerText format["%1: N/A", _text];

	// Vehicle is missing
	} else {
		_marker setMarkerColor "ColorBlack";
		_marker setMarkerAlpha 0.2;
		_marker setMarkerText format["%1: N/A", _text];
	};

	_thisVehMemory set [1, false];
	_thisVehMemory set [2, true];
};

[_vehMemory, _unitname, _thisVehMemory] call CBA_fnc_hashSet;
missionNamespace setVariable ["vehicleMarkerMemory", _vehMemory];