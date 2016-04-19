

_pos = getMarkerPos "pat20";

_vic = "rhs_btr70_chdkz" createVehicle _pos;
createVehicleCrew _vic;

[_vic,"pat2","NOWAIT","NOSLOW","TRACK"] execVM "ups_hc.sqf"; 