	private ["_veh","_vehName","_vehVarname","_completeText","_reward","_GAU","_rabbit","_mortar"];

_completeText = format["<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#08b000'>COMPLETE</t><br/>____________________<br/>Fantastic job, lads! The OPFOR stationed on the island won't last long if you keep that up!<br/><br/>We've given you %1 to help with the fight. You'll find it at base.<br/><br/>Focus on the main objective for now; we'll relay this success to the intel team and see if there's anything else you can do for us. We'll get back to you in 10-15 minutes.</t>"];

GlobalHint = _completeText; publicVariable "GlobalHint"; hint parseText _completeText;
showNotification = ["CompletedSideMission", sideMarkerText]; publicVariable "showNotification";
//showNotification = ["Reward", format["Your team received %1!", _vehName]]; publicVariable "showNotification";

["tf47_changetickets", [WEST, 2, 15]] call CBA_fnc_globalEvent;