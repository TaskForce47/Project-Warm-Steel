

_fobs = ["west_fob_1"];

_selFob = _fobs select floor random (count _fobs);

// Spawn FOB
hint str _selFob;
_marker = createMarker ["Enemy_FOB_w", getMarkerPos _selFob];
_marker setMarkerShape "ICON";

_marker setMarkerType "b_hq";
_marker setMarkerColor "ColorOPFOR";
_marker setMarkerText "Enemy FOB";
//_marker setMarkerSize [10,10];
_bmpGroup = createGroup east;
_veh = "LOP_ChDKZ_BMP1" createVehicle getMarkerPos _selFob;
	waitUntil {!isNull _veh};
		"LOP_ChDKZ_Infantry_Crewman" createUnit [getMarkerPos _selFob,_bmpGroup];
		"LOP_ChDKZ_Infantry_Crewman" createUnit [getMarkerPos _selFob,_bmpGroup];
		"LOP_ChDKZ_Infantry_Crewman" createUnit [getMarkerPos _selFob,_bmpGroup];
		((units _bmpGroup) select 0) assignAsDriver _veh;
		((units _bmpGroup) select 0) moveInDriver _veh;
		((units _bmpGroup) select 1) assignAsGunner _veh;
		((units _bmpGroup) select 1) moveInGunner _veh;
		((units _bmpGroup) select 2) assignAsCargo _veh;
		((units _bmpGroup) select 2) moveInCargo _veh;
	[_bmpGroup, getMarkerPos _selFob, 100] call BIS_fnc_taskPatrol;
//LOP_ChDKZ_Infantry_Crewman

_trg = createTrigger ["EmptyDetector", getMarkerPos _selFob];
_trg setTriggerArea [200, 200, 0, false];
_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
// TODO fix trigger
_trg setTriggerStatements ["this", "hint 'fob taken'; deleteVehicle _veh; _bsDef = 'RHS_M6' createVehicle (getMarkerPos _selFob); 'Enemy_FOB_w' setMarkerText 'FOB Wood';", "hint 'This should not happen ...';"];