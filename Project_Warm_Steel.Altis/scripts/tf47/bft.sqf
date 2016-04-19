_allMarker = [""];
//create Marker
for "_x" from 1 to 25 do {
	_MarkerName = format ["M_BFT_%1",_x];
	_Marker = createMarker [_MarkerName, [0,0,0]];
	_MarkerName setMarkerShape "ICON";
	_MarkerName setMarkerType "b_inf"; 
	_MarkerName setMarkerColor "ColorBLUFOR";
	_MarkerName setMarkerAlpha 0;
	_allMarker = _allMarker + [_markerName];
};

while {true} do {
//get all BLUEFOR Groups
_allgrps = allGroups;
_bftunits = [];
{
	_leader = leader _x;
    if (side _leader == east) then {
    	_allgrps = _allgrps - [_x];
    };

    if (count (units _x) == 0) then {
    	_allgrps = _allgrps - [_x];
    };
} forEach _allgrps;

//get all units with a radiobackpack
{
	{
		_backpack = backpack _x;
		if (_backpack == "clf_nicecomm2_coy") then {_bftunits = _bftunits + [_x];};
		if (_backpack == "clf_nicecomm2_multi") then {_bftunits = _bftunits + [_x];};
	} forEach (units _x);
} forEach _allgrps;

//reset all Marker
{
	_x setMarkerAlpha 0;
	_x setMarkerText "";
	_x setMarkerPos [0,0,0];
}forEach _allMarker;
//setMarker to group Pos anf give them teh right text
if (count _bftunits != 0) then {
	{
		_MarkerName = format ["M_BFT_%1",(_foreachindex + 1)];
		_group = group _x;
		_groupID = groupID _group;
		_groupID = format ["%1",_groupID];
		_markerName setMarkerPos getPos _x;
		_markerName setMarkerText _groupID;
		_MarkerName setMarkerAlpha 1;
	}forEach _bftunits;
};
//standby for a short time
sleep 30;
};