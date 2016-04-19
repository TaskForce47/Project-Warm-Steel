/*
Author: 

	Quiksilver
	
Last modified:

	25/04/2014

Description:

	Spawn OPFOR enemy around side objectives.
	Enemy should have backbone AA/AT + random composition.
	
___________________________________________*/

//---------- CONFIG

#define INF_TEAMS "IRG_InfTeam_AT","IRG_InfTeam_MG","IRG_SniperTeam_M","IRG_InfSquad_Weapons","IRG_InfSquad","IRG_InfSquad","IRG_InfSquad"
#define VEH_TYPES "rhs_btr70_chdkz","rhs_bmd2_chdkz","rhs_t72bb_chdkz","rhs_zsu234_chdkz"
private ["_x","_pos","_flatPos","_randomPos","_enemiesArray","_infteamPatrol","_SMvehPatrol","_SMveh","_SMaaPatrol","_SMaa","_smSniperTeam"];
_enemiesArray = [grpNull];
_x = 0;

//---------- GROUPS
	
_infteamPatrol = createGroup east;
_smSniperTeam = createGroup east;
_SMvehPatrol = createGroup east;
_SMaaPatrol = createGroup east;

//---------- INFANTRY RANDOM
	
for "_x" from 0 to (3 + (random 4)) do {
	_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_infteamPatrol = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "rhs_faction_insurgents" >> "Infantry" >> [INF_TEAMS] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_infteamPatrol, getPos priorityObj1, 100] call BIS_fnc_taskPatrol;
				
	_enemiesArray = _enemiesArray + [_infteamPatrol];
};

//---------- SNIPER

for "_x" from 0 to 1 do {
	_randomPos = [getPos priorityObj1, 500, 100, 20] call BIS_fnc_findOverwatch;
	_smSniperTeam = [_randomPos, EAST, (configfile >> "CfgGroups" >> "Indep" >> "rhs_faction_insurgents" >> "IRG_SniperTeam_M")] call BIS_fnc_spawnGroup;
	_smSniperTeam setBehaviour "COMBAT";
	_smSniperTeam setCombatMode "RED";
		
	_enemiesArray = _enemiesArray + [_smSniperTeam];
};
	
//---------- VEHICLE RANDOM
	
_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh1 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
//waitUntil {sleep 0.5; !(isNil "_SMveh1")};
waitUntil {sleep 0.5; !isNull _SMveh1};
[_SMveh1, _SMvehPatrol] call BIS_fnc_spawnCrew;

_SMveh1 lock 3;
[_SMvehPatrol, getPos priorityObj1, 75] call BIS_fnc_taskPatrol;
sleep 0.1;
	
_enemiesArray = _enemiesArray + [_SMveh1];
	
//---------- VEHICLE RANDOM	
	
_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh2 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh2};
[_SMveh2, _SMvehPatrol] call BIS_fnc_spawnCrew;

_SMveh2 lock 3;
[_SMvehPatrol, getPos priorityObj1, 150] call BIS_fnc_taskPatrol;
sleep 0.1;
	
_enemiesArray = _enemiesArray + [_SMveh2];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMvehPatrol];

//---------- VEHICLE AA
	
_randomPos = [[[getPos priorityObj1, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMaa = "rhs_zsu234_chdkz" createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMaa};
[_SMaa, _SMaaPatrol] call BIS_fnc_spawnCrew;

_SMaa lock 3;
[_SMaaPatrol, getPos priorityObj1, 150] call BIS_fnc_taskPatrol;
	
_enemiesArray = _enemiesArray + [_SMaaPatrol];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMaa];

//---------- COMMON

[(units _infteamPatrol)] call QS_fnc_setSkill2;
[(units _smSniperTeam)] call QS_fnc_setSkill3;
[(units _SMaaPatrol)] call QS_fnc_setSkill4;
[(units _SMvehPatrol)] call QS_fnc_setSkill2;
	
//---------- GARRISON FORTIFICATIONS
	
	{
		_newGrp = [_x] call QS_fnc_garrisonFortEAST;
		if (!isNull _newGrp) then { 
		_enemiesArray = _enemiesArray + [_newGrp]; };
	} forEach (getPos priorityObj1 nearObjects ["House", 150]);
	
_enemiesArray