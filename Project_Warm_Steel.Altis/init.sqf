/*
@filename: init.sqf
Author:
	
	Quiksilver

Last modified:

	12/05/2014
	
Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/

//["Initialize"] call BIS_fnc_dynamicGroups;

for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};

//west setFriend [resistance, 0];
//resistance setFriend [west, 0];
groupIDstatic = 2000;
DAC_Basic_Value = 0;
mainCount = 0;

//execVM "DAC\DAC_Config_Creator.sqf";

//check if HC1 is present
HC1Present = if(isNil "headlessclient") then{False} else{True};
publicVariable "HC1Present";


// HC2Present = if(isNil "headlessclient2") then{False} else{True};
// publicVariable "headlessclient2";


//spawn units on HC1 if present
if(HC1Present && isMultiplayer) then {
    if(!isServer && !hasInterface) /* && ((str formatText["%1",player]) == "headlessclient") ) */ then {
        diag_log "HC: Spawning AI on the HC";
		//diag_log ((str formatText["%1",player]) == "headlessclient");
        [] execVM "mission\main\missionControl.sqf";
		[] execVM "mission\side\missionControl.sqf";
    };
} else { //spawn units on server
    if(isServer) then {
        diag_log "HC: Spawning AI the SERVER";
        [] execVM "mission\main\missionControl.sqf";
		[] execVM "mission\side\missionControl.sqf";
    };
};

//spawn units on HC1 if present
// if(HC2Present && isMultiplayer) then {
    // if(!isServer && !hasInterface && ((str formatText["%1",player]) == "headlessclient2")) then {
        // diag_log "HC: Spawning AI on the HC 2";
		// diag_log ((str formatText["%1",player]) == "headlessclient2");
        // [] execVM "mission\side\missionControl.sqf";
    // };
// } else { //spawn units on server
    // if(isServer) then {
        // diag_log "HC: Spawning AI the SERVER";
        // [] execVM "mission\side\missionControl.sqf";
    // };
// };


[false,"ColorBlufor","ColorGreen","ColorOrange"] call TF47_UMenu_fnc_EnableUMenu;
#include "ZadeServicePoint\include\init.hpp"



// patrols
// [p1,"patSs","NOWAIT","NOSLOW"] execVM "ups.sqf"; 

// [p1_3,"patSs","NOWAIT","NOSLOW"] execVM "ups.sqf";
// [pa3,"patSw","NOWAIT","NOSLOW"] execVM "ups.sqf";


// [p3,"patSw","NOWAIT","NOSLOW"] execVM "ups.sqf";


// [p1_3_1,"patSw","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_2,"patSw","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_3,"patNn","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [pa4,"PatNn","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p4,"patNn","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_4,"patNn","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [pa6,"PatNn","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_5,"patNn","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [pa7,"PatNe","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_7,"patNe","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p5,"PatNe","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_6,"patNe","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [pa8,"PatNe","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [pa9,"PatSe","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_9,"patSe","NOWAIT","NOSLOW"] execVM "ups.sqf"; 

// [p6,"PatSe","NOWAIT","NOSLOW"] execVM "ups.sqf";

// [p1_3_8,"patSe","NOWAIT","NOSLOW"] execVM "ups.sqf";
// [pa10,"PatSe","NOWAIT","NOSLOW"] execVM "ups.sqf"; 

//[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";};

_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
//Service Points by [TF47] DerZade
//[] execVM "Zade_ServicePoint\ServicePoint_Init.sqf";
//Should the UMenu be enabled? Params: [showTickets (BOOL)]
//[false] call TF47_UMenu_fnc_EnableUMenu;

//BLUFOR TRACKING SYSTEM
//_null = [] execVM "scripts\tf47\bft.sqf";
//IED`s
//[] spawn {call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";};

//L_suppress_active = true;

waitUntil { isServer || !isNull player };
cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
private "_pathToScripts";
call cfgTF47;

tf47_fnc_vehicleOnEnter 	= compileFinal preprocessFileLineNumbers format ["%1vehicleOnEnter.sqf", _pathToScripts];
tf47_fnc_unitMarkerInit 	= compileFinal preprocessFileLineNumbers format ["%1unitMarkerInit.sqf", _pathToScripts];
tf47_fnc_vehicleOnSpawn 	= compileFinal preprocessFileLineNumbers format ["%1vehicleOnSpawn.sqf", _pathToScripts];

//"rot_trans_spawn_mark_1" setMarkerText format ["%1playerEvents.sqf", _pathToScripts];;

// client event handler
//hint "player eevnts";
execVM format ["%1playerEvents.sqf", _pathToScripts];

// DB Functionality & Ticket System
execVM format ["%1serverEvents.sqf", _pathToScripts];

// Special Markers
execVM format ["%1mapMarkerInit.sqf", _pathToScripts];

// Base Cleanup
// In dem Script steht jackshit drin
//execVM format ["%1baseCleanupInit.sqf", _pathToScripts];

//call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// revive
enableEngineArtillery false;
