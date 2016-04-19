////////////////////////////////////////////////////////////////////////////////
/*	
 *	Name: apply_Loadout.sqf
 *	Author:	DerZade
 *	Description: Apply loadout to vehicle
 *	
 *	Parameter: NONE
 *
 *	Return Value: NONE
 */
////////////////////////////////////////////////////////////////////////////////
disableSerialization;

private ["_caller","_vehicle","_dialog","_loadout","_code"];

_caller = player; 
_vehicle = vehicle _caller;
_dialog = uiNamespace getVariable "ZadeServicePoint_LoadoutDialog";

//Check if vehicle is already beeing serviced
if (_vehicle getVariable ["ZadeServicePoint_VehStatus","Ready"] != "Ready") then {
	["ServicePoint | This Vehicle is already beeing serviced.","systemChat",_caller,false] call BIS_fnc_MP;
};
if (_vehicle getVariable ["ZadeServicePoint_VehStatus","Ready"] != "Ready") exitWith {};

//Get Loadout
_loadout = ZadeServicePoint_Loadouts select (lbcursel (_dialog displayCtrl 1500)); 

//Close Dialog
closeDialog 0;

_code = {
	private ["_caller","_vehicle","_loadout","_time","_name","_fuel"];

	_caller = _this select 0;
	_loadout = _this select 1;
	
	_vehicle = vehicle _caller;
	_name = _loadout select 1;
	_time = _loadout select 2;
	
	//Set Status to servicing
	_vehicle setVariable ["ZadeServicePoint_VehStatus","Servicing",true];

	// Start Hint
	[format ["ServicePoint | %1 is beeing loaded into your vehicle.",_name],"systemChat",_caller,false] call BIS_fnc_MP;
	[format ["ServicePoint | This will take %1 seconds.",_time],"systemChat",_caller,false] call BIS_fnc_MP;


	[[[_time,_caller],"ZadeServicePoint\Scripts\progress.sqf"],"BIS_fnc_execVM",_caller,false] call BIS_fnc_MP;

	//Set fuel to 0
	_fuel = fuel _vehicle;
	[[_vehicle,0],"setFuel",_vehicle,false] call BIS_fnc_MP;

	//Clear Load if nedded
	if (_loadout select 0) then {
		clearWeaponCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
	};

	//STANDBY 
	sleep _time;

	//ADD STUFF
		//Add Weapons
		{
			if (_vehicle canAdd (_x select 0)) then {
				_vehicle addWeaponCargoGlobal [_x select 0,_x select 1];
			};
		} forEach (_loadout select 3);

		//Add Mags
		{
			if (_vehicle canAdd (_x select 0)) then {
				_vehicle addMagazineCargoGlobal [_x select 0,_x select 1];
			};
		} forEach (_loadout select 4);

		//Add Items
		{
			if (_vehicle canAdd (_x select 0)) then {
				_vehicle addItemCargoGlobal [_x select 0,_x select 1];
			};
		} forEach (_loadout select 5);

		//Add BackPacks
		{
			if (_vehicle canAdd (_x select 0)) then {
				_vehicle addBackpackCargoGlobal [_x select 0,_x select 1];
			};
		} forEach (_loadout select 6);

	//Set Status to Ready
	[[_vehicle,_fuel],"setFuel",_vehicle,false] call BIS_fnc_MP;
	_vehicle setVariable ["ZadeServicePoint_VehStatus","Ready",true];

	["ServicePoint | Service complete.","systemChat",_caller,false] call BIS_fnc_MP;
};

//Spawn _code on Server
[[[_caller,_loadout], _code],"BIS_fnc_spawn",false, false, false] call BIS_fnc_MP;


if (true) exitWith {true};