////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: applyService.sqf
 *	Author:	DerZade
 *	Description: Apply Service to vehicle (Rearm,Refuel,Repair,Respawn) 
 *
 *	
 *	Parameter: NONE
 *
 *	Return Value: NONE
 */
////////////////////////////////////////////////////////////////////////////////

disableSerialization;
private ["_caller","_vehicle","_dialog","_refuel","_repair","_rearm","_respawn","_code"];

_caller = player;
_vehicle = vehicle _caller;

_dialog = uiNamespace getVariable "ZadeServicePoint_ServiceVehicleDialog";
_refuel = cbChecked (_dialog displayCtrl 2800);
_repair = cbChecked (_dialog displayCtrl 2801);
_rearm = cbChecked (_dialog displayCtrl 2802);
_respawn = cbChecked (_dialog displayCtrl 2803);

//Check if any Service is selected
if (!(_rearm or _refuel or _repair or _respawn)) exitWith {true};

//Check if vehicle is already beeing serviced
if (_vehicle getVariable ["ZadeServicePoint_VehStatus","Ready"] != "Ready") then {
	["ServicePoint | This Vehicle is already beeing serviced.","systemChat",_caller,false] call BIS_fnc_MP;
	
};
if (_vehicle getVariable ["ZadeServicePoint_VehStatus","Ready"] != "Ready") exitWith {};

//Everything is OK so close the dialog and start working
closeDialog 0;

_code = {
	private ["_caller","_vehicle","_refuel","_repair","_rearm","_respawn","_time","_value","_fuel"];
	_caller = _this select 0;
	_vehicle = vehicle _caller;
	_refuel = _this select 1;
	_repair = _this select 2;
	_rearm = _this select 3;
	_respawn = _this select 4;

	_vehicle setVariable ["ZadeServicePoint_VehStatus","Servicing",true];
	
	//Respawn 
	if (_respawn) then {
		//Hint
		["ServicePoint | This vehicle will respawn soon.","systemChat",_caller,false] call BIS_fnc_MP;

		//Disable Vehicle 
		[[_vehicle,0],"setFuel",_vehicle,false] call BIS_fnc_MP;
		_vehicle lock false;


		//kick out all passenger
		{
			_x action ["GetOut", _vehicle];
		} foreach (crew _vehicle);

		//Lock Vehicle
		waitUntil {count (crew _vehicle) == 0};
		_vehicle lock true;

		//Call custom respawn Code
		_vehicle call ZadeServicePoint_BeforeRespawnCode;

		//Sleep 15 seconds
		sleep 15;

		_vehicle setVariable ["debugRespawn", true];
		
		
		//Respawn 
		_vehicle setPos[0,0,0];
		sleep 1;
		_vehicle setDamage 1;
	};
	if (_respawn) exitWith {};
		
	//Calculate Service Time
	_time = 0;
		
	//Refuel Time
	if (_refuel) then {
		_value = fuel _vehicle;
		_time = _time + (ZadeServicePoint_Time_Refuel * (1 - _value));
	};
	//Repair Time
	if (_repair) then {
		_value = [_vehicle] call ZadeServicePoint_fnc_getDamage;
		_time = _time + (ZadeServicePoint_Time_Repair * _value);
	};
	//Rearm Time
	if (_rearm) then {
		_value = [_vehicle] call ZadeServicePoint_fnc_getAmmo;
		_time = _time + (ZadeServicePoint_Time_Rearm * (1 - _value));
	};
	_time = round _time;

	if (_vehicle isKindOf "AIR") then {
		_time = _time * ZadeServicePoint_AirMultiplier;
	};
	
	//Start Hint	
	["ServicePoint | Your Vehicle is beeing serviced.","systemChat",_caller,false] call BIS_fnc_MP;
	[format ["ServicePoint | This will take %1 seconds.",_time],"systemChat",_caller,false] call BIS_fnc_MP;

	//set Fuel to 0
	_fuel = fuel _vehicle;
	[[_vehicle,0],"setFuel",_vehicle,false] call BIS_fnc_MP;

	//Standby
	[[[_time,_caller],"ZadeServicePoint\Scripts\progress.sqf"],"BIS_fnc_execVM",_caller,false] call BIS_fnc_MP;
	sleep _time;

	//Service
	if (_repair) then {_vehicle setDamage 0};
	if (_rearm) then {[_vehicle] call ZadeServicePoint_fnc_rearmVehicle};
	if (_refuel) then {[[_vehicle,1],"setFuel",_vehicle,false] call BIS_fnc_MP;
			   } else {[[_vehicle,_fuel],"setFuel",_vehicle,false] call BIS_fnc_MP;};


	//Set Status to Ready
	_vehicle setVariable ["ZadeServicePoint_VehStatus","Ready",true];

	//End Hint
	["ServicePoint | Service complete.","systemChat",_caller,false] call BIS_fnc_MP;

	if (true) exitWith {};
};

//Spawn _code on Server
[[[_caller,_refuel,_repair,_rearm,_respawn], _code],"BIS_fnc_spawn",false, false, false] call BIS_fnc_MP;

//GOOD LUCK OUT THERE SOLIDER
if (true) exitWith {};