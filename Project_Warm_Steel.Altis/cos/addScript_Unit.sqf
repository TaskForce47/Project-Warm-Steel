/*
Add Script to individual units spawned by COS.
_unit = unit. Refer to Unit as _unit.
*/

_unit =(_this select 0);
//_unit addAction ["Hello", {hint "Open AddScript_Unit.sqf to apply pedestrian scripts"}];// EXAMPLE SCRIPT

_unit addEventHandler ["Killed", { 
//hint "1";
//hint str (side (_this select 1));
	if(side (_this select 1) == west && (isPlayer (_this select 1))) then 
	{
	//hint "2";
		["tf47_changetickets", [WEST, 6, 1, format ['Ein Zivilist wurde von %1 getötet!',
	name (_this select 1)], name (_this select 1), format ['Ein Zivilist wurde von %1 getötet!',
	name (_this select 1)]]] call CBA_fnc_globalEvent;
	};
}];