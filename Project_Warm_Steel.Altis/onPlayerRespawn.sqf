/*
@filename: onPlayerRespawn.sqf
Author:
	
	Quiksilver

Last modified:

	12/04/2014
	
Description:

	Client scripts that should execute after respawn.
	
______________________________________________________*/

/*
if(typeOf (_this select 0) == "rhsusf_army_ucp_medic" || typeOf (_this select 0) == "rhsusf_army_ocp_medic") then {
	//_cpr = ["HLW/CPR","HLW/CPR","",{_sup = [_this select 0] execVM "scripts\tf47\CPR.sqf";},{[player cursorTarget] call tf47_fnc_isStable) && (player cursorTarget getvariable ["ACE_isUnconscious", false])},{},[], [0,0,0], 2] call ace_interact_menu_fnc_createAction;
	//[_this select 0, 0, ["ACE_Actions", "Medical_Menu"], _cpr] call ace_interact_menu_fnc_addActionToObject;
	(_this select 0) addAction["<t color='#FF0000'>HLW/CPR</t>", "scripts\tf47\CPR2.sqf", _this select 0];
};
*/
//(_this select 0) addAction["<t color='#FF0000'>HLW/CPR</t>", "scripts\tf47\CPR.sqf", _this select 0];

waitUntil {sleep 0.1; !isNil "sideMissionUp" };
if (sideMissionUp) then
{
	waitUntil {sleep 0.5; !isNil "sideObj" };
	"sideMarker" setMarkerPosLocal (getPos sideObj);
	"sideCircle" setMarkerPosLocal (getPos sideObj);
	waitUntil {sleep 0.5; !isNil "sideMarkerText" };
	"sideMarker" setMarkerTextLocal format["Side Mission: %1",sideMarkerText];
} else {
	"sideMarker" setMarkerPosLocal [0,0,0];
	"sideCircle" setMarkerPosLocal [0,0,0];
};