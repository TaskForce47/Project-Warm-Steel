/* ----------------------------------------------------------------------------
		file:
		======

		Description:
		tiny helper function for setFuel to be executed over bis_fnc_mp
		to prevent using bis_fnc_execVM

		Parameters:
		unit: the unit
		fuel: 0-1

		Optional:

		Example:

		Returns:

		Author: funkrusha (ofpectag:TF47_)

---------------------------------------------------------------------------- */

private ["_fuel", "_unit"];

_unit = _this select 0;
_fuel = _this select 1;

_unit setFuel _fuel;