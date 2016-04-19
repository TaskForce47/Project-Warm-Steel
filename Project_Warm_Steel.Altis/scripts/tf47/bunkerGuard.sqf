/////////////////////////////
/*
Script: Bunker Guard Script

Author: [TF47] Chris [MISFIT]
Version 0.1
*/
//////////////////////////////

#define INF_TYPE "ISIS_reg_squad_ld"
/*Script Begin */
private ["_bunkerGuardArray","_guardGroup_1","_guardGroup_2","_guardGroup_3","_randomPos"];
_bunkerGuardArray = [grpNull];
_x = 0;

for "_x" from 1 to PARAMS_GuardGroups do {
	_guardGroup_1 = createGroup east;
	_randomPos = [[[getMarkerPos "m_bunker_1", 100],[]],["water","out"]] call BIS_fnc_randomPos;
	_guardGroup_1 = [_randomPos, EAST, (configfile >> "CfgGroups" >> "East" >> "ISIS" >> "Infantry" >> [INF_TYPE] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_guardGroup_1, getMarkerPos "m_bunker_1", 180] call BIS_fnc_taskPatrol;

	_bunkerGuardArray = _bunkerGuardArray + [_guardGroup_1];

	// {
		// _x addCuratorEditableObjects [units _guardGroup_1, false];
	// } foreach adminCurators;

};
for "_x" from 1 to PARAMS_GuardGroups do {
	_guardGroup_2 = createGroup east;
	_randomPos = [[[getMarkerPos "m_bunker_2", 100],[]],["water","out"]] call BIS_fnc_randomPos;
	_guardGroup_2 = [_randomPos, EAST, (configfile >> "CfgGroups" >> "East" >> "ISIS" >> "Infantry" >> [INF_TYPE] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_guardGroup_2, getMarkerPos "m_bunker_2", 180] call BIS_fnc_taskPatrol;

	_bunkerGuardArray = _bunkerGuardArray + [_guardGroup_2];

	// {
		// _x addCuratorEditableObjects [units _guardGroup_2, false];
	// } foreach adminCurators;

};
for "_x" from 1 to PARAMS_GuardGroups do {
	_guardGroup_3 = createGroup east;
	_randomPos = [[[getMarkerPos "m_bunker_3", 100],[]],["water","out"]] call BIS_fnc_randomPos;
	_guardGroup_3 = [_randomPos, EAST, (configfile >> "CfgGroups" >> "East" >> "ISIS" >> "Infantry" >> [INF_TYPE] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_guardGroup_3, getMarkerPos "m_bunker_3", 180] call BIS_fnc_taskPatrol;

	_bunkerGuardArray = _bunkerGuardArray + [_guardGroup_3];

	// {
		// _x addCuratorEditableObjects [units _guardGroup_3, false];
	// } foreach adminCurators;

};

[(units _guardGroup_1)] call QS_fnc_setSkill3;
[(units _guardGroup_2)] call QS_fnc_setSkill2;
[(units _guardGroup_3)] call QS_fnc_setSkill2;

if (true) exitWith {};