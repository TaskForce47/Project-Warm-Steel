/*
* This script watches driver seat changes to make sure the LastDriver and LastCommander stored for TF47CoreScripts' Ticketsystem is always correctly set.     
* 
* LastDriver:    Last one to sit in driver seat
* LastCommander: The Person responsible for the wellbeing of this vehicle. If commander slot is used, this is the LastCommander, otherwise its the driver.    
* Attention: Script is currently run on first driver, and thus will break when the driver goes offline while vehicle is still in active use. Should be run on server instead |
*
* TODO: 
*  - Add Slot&Whitelist Recheck
*  - Move to Server
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

if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
private ["_pathToScripts", "_vehicleRestrictions", "_vehiclePurchase"];
waitUntil { !isNil "cfgTF47" };
call cfgTF47;

_vehicle = _this select 0;
_vehicleIdentifier = format["%1", _vehicle];
_vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle  >> "displayName");
_crew = crew _vehicle;

// Will be run when somebody enteres an empty vehicle
		
if(isMultiplayer) then {
	_vehicle allowDamage true;
	// todo:
	//_vehicle setVehicleInit "this allowDamage true;";
};
_vehicle setVariable ["vehicleSeated", 1, true];
// todo:
//processInitCommands;

// Will be run while somebody is in this vehicle
while {(count _crew) > 0} do {
	_kickout = false;
	_whitelistId = 0;
	
	// Check Driver	
	_previousLastDriverName = _vehicle getVariable ["lastDriver", "Unknown"];
	_previousLastDriverId = _vehicle getVariable ["lastDriverId", ""];
	
	_driver = driver _vehicle;
	
	if (!isNull _driver) then {
		_lastDriverName = format["%1", name _driver];		
		_lastDriverId = "7412934";		
		if(isMultiplayer) then {
			_lastDriverId = getPlayerUID _driver;
		};
		
		if(_previousLastDriverId != _lastDriverId) then {
			_vehicle setVariable ["lastDriver", _lastDriverName, true];
			_vehicle setVariable ["lastDriverId", _lastDriverId, true];
			
			if(_previousLastDriverId != "" || !isMultiplayer) then {
				diag_log format ["Driver of Vehicle %1 has changed from %2 to %3", _vehicleName, _previousLastDriverName, _lastDriverName];		
				
				// TODO: Recheck Slot & Whitelist
			};
		};
	};	
	
	if(true) then {
		// Find out who is responsible for the wellbeing of this vehicle	
		_previousLastCommanderName = _vehicle getVariable ["lastCommander", "Unknown"];
		_previousLastCommanderId = _vehicle getVariable ["lastCommanderId", ""];
		
		_commander = commander _vehicle;
		if(isNull _commander && !_kickout) then {
			_commander = _driver;
		};
		
		if (!isNull _commander) then {
			_lastCommanderName = format["%1", name _commander];		
			_lastCommanderId = "7412934";		
			if(isMultiplayer) then {
				_lastCommanderId = getPlayerUID _commander;
			};
			
			if(_previousLastCommanderId != _lastCommanderId) then {
				_vehicle setVariable ["lastCommander", _lastCommanderName, true];
				_vehicle setVariable ["lastCommanderId", _lastCommanderId, true];
				
				if(_previousLastCommanderId != "" || !isMultiplayer) then {
					diag_log format ["Commander of Vehicle %1 has changed from %2 to %3", _vehicleName, _previousLastCommanderName, _lastCommanderName];		
				};
			};		
		};
	};
	
	sleep 60;
	_crew = crew _vehicle;
};
_vehicle setVariable ["vehicleSeated", 0, true];