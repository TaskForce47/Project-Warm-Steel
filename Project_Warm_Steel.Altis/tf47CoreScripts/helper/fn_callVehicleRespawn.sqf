/* ----------------------------------------------------------------------------
		file:
		======

		Description:
		tiny helper function vehicleRespawn

		Parameters:
		0-10 like in vehicleRespawn.sqf

		Optional:

		Example:

		Returns:

		Author: Willard

---------------------------------------------------------------------------- */

private ["_name", "_unit"];

_veh = [_this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 5, _this select 6, _this select 7, _this select 8, _this select 9, _this select 10] execVM "tf47CoreScripts\vehicleRespawn.sqf"; 

_veh