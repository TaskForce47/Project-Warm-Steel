/////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: onLoad_Loadout.sqf
 *	Author:	DerZade
 *	Description: Sets all Dialog-Values 
 *	
 *	Parameter:
 *		0: Loadout-Dialog 
 *	
 *	Return Value: NONE
 */	
/////////////////////////////////////////////////////////////////////////////////

disableSerialization;

uiNamespace setVariable ["ZadeServicePoint_LoadoutDialog",_this select 0];

private ["_varname","_text","_curSel","_loadout","_class","_amount","_name"];

//Add Loadouts
{
	_varName = _x;
	_text = _varName select 1;
	lbAdd [1500,_text];
} forEach ZadeServicePoint_Loadouts;

//Select 1st Loadut
lbSetCurSel [1500,0];

//Update Content
while {dialog} do {
	_curSel = lbCurSel 1500;
	
	if (_curSel == -1) exitWith {};

	lbClear 1501;

	//Selected Loadout
	_loadout = ZadeServicePoint_Loadouts select _curSel; 

	//Clear Load Text
	if (_loadout select 0) then {
		ctrlSetText [1502, "Yes"];
	} else {
		ctrlSetText [1502, "No"];
	};

	//Add Weapons 
	{
		_class = _x select 0;
		_amount = _x select 1;
		_name = getText (configFile >> "CfgWeapons" >> _class >> "DisplayName");

		_text = format ["%1x %2", _amount,_name];
		lbAdd [1501,_text];
	} forEach (_loadout select 3);

	//Add Magazines
	{
		_class = _x select 0;
		_amount = _x select 1;
		_name = getText (configFile >> "CfgMagazines" >> _class >> "DisplayName");

		_text = format ["%1x %2", _amount,_name];
		lbAdd [1501,_text];
	} forEach (_loadout select 4);

	//Add Items
	{
		_class = _x select 0;
		_amount = _x select 1;
		_name = getText (configFile >> "CfgWeapons" >> _class >> "DisplayName");

		_text = format ["%1x %2", _amount,_name];
		lbAdd [1501,_text];
	} forEach (_loadout select 5);

	//Add Backpacks
	{
		_class = _x select 0;
		_amount = _x select 1;
		_name = getText (configFile >> "CfgVehicles" >> _class >> "DisplayName");

		_text = format ["%1x %2", _amount,_name];
		lbAdd [1501,_text];
	} forEach (_loadout select 6);

	//WaitUntil Player selected another Loadout
	waitUntil {sleep 0.2; _curSel != lbCurSel 1500 or isNull ((_this select 0) displayCtrl 1500)};
};
	

if (true) exitWith {true};