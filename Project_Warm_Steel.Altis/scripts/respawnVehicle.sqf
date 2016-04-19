/*///////////////////////////////////////////////////////////////////////////////

	Name: respawn.sqf
	Description: Respawns a vehicle 
	Author:	DerZade
	
	Parameter:
		0: vehicle

	Return Value: NONE
	
*////////////////////////////////////////////////////////////////////////////////

_vehicle = _this;

//hint "test";

if (isMultiplayer and !isServer) exitWith {};

//Disable Vehicle 
_vehicle setFuel 0;
_vehicle lock false;

_vehicle setVariable ["ZadeSP_VehStatus","Servicing",true];

//Get Out Motherfucker
{
	_x action ["Eject", _vehicle];
} foreach (crew _vehicle);

//All Guys out?
if (count (crew _vehicle) > 0) then {
	while {count (crew _vehicle) > 0} do {
		sleep 2;	
		{
			_x action ["Eject", _vehicle];
		} foreach (crew _vehicle);
	};
};

waitUntil {sleep 1; count (crew _vehicle) == 0 and isNull (driver _vehicle)};

_vehicle lock true;

_vehicle setVariable ["debugRespawn", true];

sleep 15;

//Respawn 
_vehicle setPos[0,0,0];
sleep 1;
_vehicle setDamage 1;



if (true) exitWith{true};