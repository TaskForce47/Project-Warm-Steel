_type = _this select 3;
_spawner = _this select 0;
_spawnerdir = direction _spawner;
_spawnpos = getPos _spawner getPos[3, _spawnerdir + 180];
_near = nearestObjects [_spawnpos, ["ReammoBox_F","ACE_Wheel","ACE_Track"], 5];
 // hint str _near;
if(count _near > 0) then {
	{
		deleteVehicle _x;
	} forEach _near;
};

_obj = _type createVehicle [0,0,1000];
_obj setDir 0;
_obj setPos _spawnpos;

if(_type == "Box_NATO_Ammo_F") then {
	clearWeaponCargoGlobal _obj; 
	clearMagazineCargoGlobal _obj; 
	clearBackpackCargoGlobal _obj; 
	clearItemCargoGlobal _obj;
};