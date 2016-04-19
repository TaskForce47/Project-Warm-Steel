


_allHCs = allMissionObjects "HeadlessClient_F";
_allHPs = allPlayers - _allHCs;

if(count _allHPs <= 6) exitWith {};

_qrfText = "<t align='center' size='2.2'>Feindliche Verstärkung</t><br/>____________________<br/>Feindliche Verstärkung nähert sich!<br/>Der Radiotower muss unbedingt zerstört werden!</t><br/>";
GlobalHint = _qrfText; hint parseText GlobalHint; publicVariable "GlobalHint";
showNotification = ["NewSub", "Feindliche Verstärkung nähert sich!"]; publicVariable "showNotification";


call tf47_reinf_fnc_reinfAir;
testvar1337 = "Lolololol";

// groupIDstatic = groupIDstatic + 1;
// _aoMarker = _this select 0;
// nul = [_aoMarker, 3, true, false, 10000, "random", true, 500, 200, 12, 1, 130, true, false, false, true, _aoMarker, true, 0.75, nil, nil, groupIDstatic,false] execVM "LV\heliParadrop.sqf";

// sleep 60;

// showNotification = ["EnemyJet","Enemy reinforcements approaching!"]; publicVariable "showNotification";

// _group = call compile format ["LVgroup%1",groupIDstatic];

// waitUntil {sleep 120; (({alive _x} count units group1) < 1)};

// {deleteVehicle _x} forEach (units _group);

