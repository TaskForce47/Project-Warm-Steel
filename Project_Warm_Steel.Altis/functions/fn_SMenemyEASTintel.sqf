/*
@filename: QS_fnc_SMenemyEASTintel.sqf
Author: 

	Quiksilver
	
Last modified:

	25/04/2014

Description:

	Spawn OPFOR enemy around intel objectives
	Enemy should have backbone AA/AT + random composition.
	Smaller number of enemy due to more complex objective.
	
___________________________________________*/

//---------- CONFIG

#define INF_TEAMS "IRG_InfSentry","IRG_InfSquad","IRG_InfSquad_Weapons","IRG_InfTeam","IRG_InfTeam_AT","IRG_InfTeam_MG","IRG_InfSentry","IRG_InfSquad","IRG_InfSquad_Weapons","IRG_InfTeam","IRG_InfTeam_AT","IRG_InfTeam_MG","IRG_ReconSentry","IRG_SniperTeam_M"
#define VEH_TYPES "rhs_btr70_chdkz","rhs_bmd2_chdkz","rhs_t72bb_chdkz","UAZ_AGS30","UAZ_SPG9"
private ["_x","_pos","_flatPos","_randomPos","_unitsArray","_enemiesArray","_infteamPatrol","_SMvehPatrol","_SMveh","_SMaaPatrol","_SMaa"];
_enemiesArray = [grpNull];
_x = 0;

//---------- INFANTRY

for "_x" from 0 to (1 + (random 3)) do {
	_infteamPatrol = createGroup east;
	_randomPos = [[[getPos _intelObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_infteamPatrol = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "rhs_faction_insurgents" >> "Infantry" >> [INF_TEAMS] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_infteamPatrol, getPos _intelObj, 100] call BIS_fnc_taskPatrol;
	[(units _infteamPatrol)] call QS_fnc_setSkill2;
				
	_enemiesArray = _enemiesArray + [_infteamPatrol];

	// {
		// _x addCuratorEditableObjects [units _infteamPatrol, false];
	// } foreach adminCurators;

};

//---------- RANDOM VEHICLE

_SMvehPatrol = createGroup east;
_randomPos = [[[getPos _intelObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh};
if(typeOf _SMveh == "UAZ_AGS30" || typeOf _SMveh == "UAZ_SPG9" || typeOf _SMveh == "UAZ_MG") then {
	_helperGroup = createGroup east;
	"rhs_g_engineer_F" createUnit [_randomPos, _helperGroup];
	"rhs_g_engineer_F" createUnit [_randomPos, _helperGroup];
	((units _helperGroup) select 0) assignAsDriver _SMveh;
	((units _helperGroup) select 0) moveInDriver _SMveh;
	((units _helperGroup) select 0) addWeapon "NVGoggles_INDEP";
	((units _helperGroup) select 1) assignAsGunner _SMveh;
	((units _helperGroup) select 1) moveInGunner _SMveh;
	((units _helperGroup) select 1) addWeapon "NVGoggles_INDEP";
} else {
[_SMveh, _SMvehPatrol] call BIS_fnc_spawnCrew;
};
[_SMvehPatrol, getPos _intelObj, 150] call BIS_fnc_taskPatrol;
[(units _SMvehPatrol)] call QS_fnc_setSkill2;
_SMveh lock 3;
if (random 1 >= 0.5) then {
	_SMveh allowCrewInImmobile true;
};
	
_enemiesArray = _enemiesArray + [_SMvehPatrol];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMveh];

// {
	// _x addCuratorEditableObjects [[_SMveh], false];
	// _x addCuratorEditableObjects [units _SMvehPatrol, false];
// } foreach adminCurators;

_enemiesArray