/*
	GrenadeStop v0.8 for ArmA 3 Alpha
	
AUTHOR:
	
	Bake (tweaked slightly by Chris)
	
DESCRIPTION:
	
	Stops players from throwing grenades and firing weapons in safety zones. Does not prevent vehicles firing.
	
CONFIGURATION:

	Edit the #defines below.
	
_______________________________________________________________________*/

#define SAFETY_ZONES	[["respawn_west", 300], ["despawn_prev01", 300], ["fob1_safezone",250], ["fob2_safezone",250]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "Firing and placing / throwing items at base is STRICTLY PROHIBITED!"
#define SNIPER_MSG "Only Snipers may use this weapon system. Sniper rifle removed."

waitUntil {!isNull player};

player addEventHandler ["Fired", {
	if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
	{
		_player = _this select 0;
		_player setVariable["TF47_SAFEZONE_COUNTER", (_player getVariable["TF47_SAFEZONE_COUNTER", 0]) + 1];
		_counter = _player getVariable["TF47_SAFEZONE_COUNTER", 0];
		if(_counter >= 6) then {
			// bye bye
			endMission "LOSER";
		};
		deleteVehicle (_this select 6);
		hint MESSAGE;
	};
	if (({(_this select 0) hasWeapon _x} count ["UK3CB_BAF_L115A3_Desert","UK3CB_BAF_L115A3_Desert_Ghillie","UK3CB_BAF_L115A3","UK3CB_BAF_L115A3_Ghillie","UK3CB_BAF_L82A1",
			"rhs_weap_XM2010","rhs_weap_XM2010_wd","rhs_weap_XM2010_wd","rhs_weap_XM2010_d"]) > 0) then {
		if (({(_this select 0) isKindOf _x} count ["rhsusf_army_ucp_marksman"]) < 1) then {
			(_this select 0) removeWeapon (primaryWeapon (_this select 0));
			titleText [SNIPER_MSG,"PLAIN",3];
		};
	};
}];