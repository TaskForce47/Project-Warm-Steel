////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: onLoad_ServiceVehicle.sqf
 *	Author:	DerZade
 *	Description: Sets all Dialog-Values
 *	
 *	Parameter:
 *		0: ServiceVehicle-Dialog 
 *
 *	Return Value: NONE	
 */
////////////////////////////////////////////////////////////////////////////////

disableSerialization;

uiNamespace setVariable ["ZadeServicePoint_ServiceVehicleDialog",_this select 0];

private ["_vehicle","_fuel","_damage","_VehStatus"];

_vehicle = vehicle player;

//Fuel
_Fuel = Fuel _vehicle;
_Fuel = _Fuel * 100;
_fuel = round _fuel;
_fuel = format["%1 %2",_fuel,"%"];

//Disable refuel if fuel == 100%
if (_fuel == "100 %") then {
	ctrlEnable [2800, false];
	((_this select 0) displayCtrl 2781) ctrlSetTextColor [0.3,0.3,0.3,1];
};

//Get Damage
_damage = [_vehicle] call ZadeServicePoint_fnc_getDamage;
_damage = _damage * 100;
_damage = round _damage;
_damage = format["%1 %2",_damage,"%"];

//Disable Repair if Damage == 0 %
if (_damage == "0 %") then {
	ctrlEnable [2801, false];
	((_this select 0) displayCtrl 2782) ctrlSetTextColor [0.3,0.3,0.3,1];
};

//Get Ammo
_ammo = [_vehicle] call ZadeServicePoint_fnc_getAmmo;
if (_ammo == -1) then {
	_ammo = "n/a";
} else {
	_ammo = _ammo * 100;
	_ammo = round _ammo;
	_ammo = format["%1 %2",_ammo,"%"];
};

//Disable Rearm if Ammo == 100 %
if (_ammo == "---" or (_ammo == "100 %")) then {
	ctrlEnable [2802, false];
	((_this select 0) displayCtrl 2783) ctrlSetTextColor [0.3,0.3,0.3,1];
};


//Disable the Loadout Button
if ((typeOf _vehicle) in ZadeServicePoint_DisallowLoadouts) then {
	ctrlEnable [1600, false];
};

_VehStatus = _vehicle getVariable ["ZadeServicePoint_VehStatus","Ready"];
//set Status-Value
if (_VehStatus == "Ready") then {
	((_this select 0) displayCtrl 1006) ctrlSetTextColor [0, 1, 0, 1];
	ctrlSetText [1006, "Ready"];
} else {
	((_this select 0) displayCtrl 1006) ctrlSetTextColor [1, 0, 0, 1];
	ctrlSetText [1006, "Servicing"];
};

//set the values for fuel,dam
	ctrlSetText [1003, _fuel];
	ctrlSetText [1004, _damage];
	ctrlSetText [1005, _ammo];
	ctrlSetText [1007, getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "DisplayName")];
	ctrlSetText [1200, getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Picture")];


if (true) exitWith {true};