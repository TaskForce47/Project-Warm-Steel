// [vehicle classname, can carry troops, armed, size of crew]
_vehicles = [["RHS_Mi8mt_Cargo_vdv",1,0,1],["RHS_Mi8mt_Cargo_vdv",1,0,1],["RHS_Mi8mt_Cargo_vdv",1,0,1],["RHS_Mi8mt_Cargo_vdv",1,0,1],["RHS_Mi8MTV3_FAB_vvsc",0.5,1,5],["RHS_Mi8AMTSh_UPK23_vvsc",0.5,1,5],["RHS_Mi24P_CAS_vvs",0.5,1,2],["RHS_Mi24V_UPK23_vvsc",0.5,1,2]];
 
_inf = ["rhs_msv_emr_junior_sergeant","rhs_msv_emr_grenadier","rhs_msv_emr_machinegunner","rhs_msv_emr_medic","rhs_msv_emr_at","rhs_msv_emr_aa","rhs_msv_emr_rifleman","rhs_msv_emr_grenadier"];
 
_r = 1000 + random 1000;
_phi = random 360;
 
_para = 0;
 
_posSpawn = [(getMarkerPos "aoMarker" select 0) + _r*cos(_phi), (getMarkerPos "aoMarker" select 1) + _r*sin(_phi)];
_posLand = [(getMarkerPos "aoMarker" select 0) + (random 400) - 200, (getMarkerPos "aoMarker" select 1) + (random 400) - 200];
 
_driver = createGroup east;
_units = "Honecker";
 
// Move to position
_posChange = getMarkerPos "aoMarker";
_posChange set [2, 500];
_wp = _driver addWaypoint [_posChange, 0];
[_driver, 0] setWaypointType "MOVE";
[_driver, 0] setWaypointBehaviour "SAFE";
[_driver, 0] setWaypointFormation "COLUMN";
[_driver, 0] setWaypointCompletionRadius 200;
[_driver, 0] setWaypointSpeed "NORMAL";
 
// Unload infantery
_wp = _driver addWaypoint [getMarkerPos "aoMarker", 1];
[_driver, 1] setWaypointType "TR UNLOAD";
[_driver, 1] setWaypointCompletionRadius 200;
 
        // Spawn random vehicle
        _veh = round (random ((count _vehicles)-1));
 
        _heli = [createVehicle [((_vehicles select _veh) select 0),_posSpawn, [], 50, "FLY"],((_vehicles select _veh) select 2)];
		(_heli select 0) flyInHeight 500;
        // Add vehicle crew
        if ((_vehicles select _veh) select 3 > 0) then
        {
                _pilot = _driver createUnit ["rhs_pilot_transport_heli", [0,0], [], 0, "FLY"];
                _pilot moveInDriver (_heli select 0);
        };
        if ((_vehicles select _veh) select 3 > 1) then
        {
                _pilot = _driver createUnit ["rhs_pilot_transport_heli", [0,0], [], 0, "FLY"];
                _pilot moveInTurret [(_heli select 0), [0]];
        };
        if ((_vehicles select _veh) select 3 > 2) then
        {
                _pilot = _driver createUnit ["rhs_pilot_transport_heli", [0,0], [], 0, "FLY"];
                _pilot moveInTurret [(_heli select 0), [1]];
        };
        if ((_vehicles select _veh) select 3 > 3) then
        {
                _pilot = _driver createUnit ["rhs_pilot_transport_heli", [0,0], [], 0, "FLY"];
                _pilot moveInTurret [(_heli select 0), [2]];
        if ((_vehicles select _veh) select 3 > 4) then
        {
                _pilot = _driver createUnit ["rhs_pilot_transport_heli", [0,0], [], 0, "FLY"];
                _pilot moveInTurret [(_heli select 0), [3]];
        };
        };
 
        // Add infantery to cargo
        if ((_vehicles select _veh) select 1 >= random 1) then
        {
                _units = createGroup east;
                {
                        _unit = _units createUnit [_x, [0,0], [], 0, "FLY"];
                        _unit moveInCargo (_heli select 0);
 
                        _para = round (random 1);
                        if (_para == 1) then
                        {
                                _unit addBackpack "B_Parachute";
                                [_driver, 1] setWaypointType "MOVE";
                                //hint "para"; ///////////////////////////////////////
                        };
                } forEach _inf;
                [_units, getmarkerpos "aoMarker", 500] call bis_fnc_taskPatrol;
        };
 
_wp = _driver addWaypoint [_posSpawn, 2];
[_driver, 2] setWaypointType "MOVE";
 
while {currentWaypoint _driver == 1} do
{
        sleep 10;
};
 
// Leave the area after units dismounted
if (_para == 1) then
{
        (_heli select 0) flyInHeight 200;
        {
                moveOut _x;
                unassignVehicle _x;
                sleep 1.5;
        } forEach units _units;
};
 
// Armed vehicles will patrol in the area
if (_heli select 1 > 0.25) then
{
        _armed = createGroup east;
        (crew (_heli select 0)) join _armed;
        [_armed, getmarkerpos "aoMarker", (250 + random 500)] call bis_fnc_taskPatrol;
};
 
// Delete units that drive back to their spawn location
while {count (units _driver) > 0} do
{
        {
                if ([getPos (_x)] call TF47_reinf_fnc_nearestPlayer >500) then
                {
                        deleteVehicle (assignedVehicle _x);
                        deleteVehicle _x;
                };
        } forEach units _driver;
        sleep 30;
};