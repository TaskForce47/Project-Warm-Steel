////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: clearLoad.sqf
 *	Author:	DerZade
 *	Description: Clears Gear of a vehicle
 *	
 *	Parameter:
 *		0: ServiceVehicle-Dialog 
 *
 *	Return Value: NONE	
 */
////////////////////////////////////////////////////////////////////////////////

disableSerialization;

private ["_caller","_vehicle","_code"];

_caller = player;
_vehicle = vehicle _caller;

//Check if vehicle is already beeing serviced
if (_vehicle getVariable ["ZadeServicePoint_VehStatus","Ready"] != "Ready") then {
	["ServicePoint | This Vehicle is already beeing serviced.","systemChat",_caller,false] call BIS_fnc_MP;
};
if (_vehicle getVariable ["ZadeServicePoint_VehStatus","Ready"] != "Ready") exitWith {};

//Everything is OK so close the fucking dialog and start working
closeDialog 0;

_code = {
	private ["_Caller","_vehicle","_time","_fuel"];

	_caller = _this select 0;
	_vehicle = vehicle _caller;
	_time = ZadeServicePoint_Time_Clear;

	//Set Status to Servicing
	_vehicle setVariable ["ZadeServicePoint_VehStatus","Servicing"];

	//hint
	["ServicePoint | Your Vehicle-Gear is beeing cleared.","systemChat",_caller,false] call BIS_fnc_MP;
	[format ["ServicePoint | This will take %1 seconds.",_time],"systemChat",_caller,false] call BIS_fnc_MP;

	//Service Vehicle
	_fuel = fuel _vehicle;
	[[_vehicle,0],"setFuel",_vehicle,false] call BIS_fnc_MP;
	[[[_time,_caller],"ZadeServicePoint\Scripts\progress.sqf"],"BIS_fnc_execVM",_caller,false] call BIS_fnc_MP;
	sleep _time;
	clearItemCargoGlobal _vehicle;
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearBackpackCargoGlobal _vehicle;
	
	[[_vehicle,_fuel],"setFuel",_vehicle,false] call BIS_fnc_MP;

	//Set Status to Ready
	_vehicle setVariable ["ZadeServicePoint_VehStatus","Ready"];

	//hint
	["ServicePoint | Service complete.","systemChat",_caller,false] call BIS_fnc_MP;

	if (true) exitWith {};
};

//Spawn _code on Server
[[[_caller], _code],"BIS_fnc_spawn",false, false, false] call BIS_fnc_MP;

//GOOD LUCK OUT THERE SOLIDER
if (true) exitWith {};