////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: create_ServicePoint_Trigger.sqf
 *	Author:	DerZade
 *	Description: Makes a Trigger to a ServicePont Trigger 
 *
 *	Parameter:
 *		0: Object (this)
 *		1: Allowed Classes (ARRAY)
 *
 *	Return Value: NONE
 */
////////////////////////////////////////////////////////////////////////////////
private ["_Object","_size","_classes","_pos","_condition","_activation"];

//WaitUntil ServicePoint Init is done
waitUntil {!isNil "ZadeServicePoint_initDone"};

_Trigger = _this select 0;
_classes = _this select 1;

//Execute on Server if it isn't
if (isMultiplayer and !isServer) then {[[_this,"ZadeServicePoint\scripts\create_ServicePoint_Trigger.sqf"],"BIS_fnc_execVM",false,false] call BIS_fnc_MP;};
if (isMultiplayer and !isServer) exitWith {};

_Trigger setTriggerStatements [	"this","",""];
_Trigger setVariable ["ZadeServicePoint_Classes",_classes,true];
_trigger setTriggerActivation ["ANY", "PRESENT", false];

if !(_Trigger in ZadeServicePoint_Trigger) then {
	ZadeServicePoint_Trigger pushBack _Trigger;
	publicVariable "ZadeServicePoint_Trigger";
};

//Bye
if (true) exitWith {true};