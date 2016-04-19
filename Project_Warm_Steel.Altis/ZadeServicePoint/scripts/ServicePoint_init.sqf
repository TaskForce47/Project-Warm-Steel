////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ServicePoint_init.sqf
 *	Author:	DerZade
 *	Description: Initializes the Service Point  
 *
 *	Parameter: NONE
 *
 *	Return Value: NONE
 */
////////////////////////////////////////////////////////////////////////////////

if !(isServer) exitWith {};

//Initialize Functions
_script = execVM "ZadeServicePoint\scripts\functions.sqf";
waitUntil {scriptDone _script};

//Initialize Configuration of SP
_script = execVM "ZadeServicePoint\configure.sqf";
waitUntil {scriptDone _script};

//Initialize Variables
ZadeServicePoint_Trigger = [];
publicVariable "ZadeServicePoint_Time_Refuel";
publicVariable "ZadeServicePoint_Time_Repair";
publicVariable "ZadeServicePoint_Time_Rearm";
publicVariable "ZadeServicePoint_Time_Clear";
publicVariable "ZadeServicePoint_AirMultiplier";
publicVariable "ZadeServicePoint_BeforeRespawnCode";
publicVariable "ZadeServicePoint_DisallowLoadouts";
publicVariable "ZadeServicePoint_Loadouts";


ZadeServicePoint_initDone = true;
publicVariable "ZadeServicePoint_initDone";

//Bye
if (true) exitWith {};