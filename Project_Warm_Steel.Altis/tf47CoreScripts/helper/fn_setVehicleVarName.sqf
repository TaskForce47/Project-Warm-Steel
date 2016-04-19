/* ----------------------------------------------------------------------------
		file:
		======

		Description:
		tiny helper function for setVehicleVarName to be executed over bis_fnc_mp
		to prevent using bis_fnc_execVM

		Parameters:
		unit: the unit
		name: the name as string

		Optional:

		Example:

		Returns:

		Author: funkrusha (ofpectag:TF47_)

---------------------------------------------------------------------------- */

private ["_name", "_unit"];

_unit = _this select 0;
_name = _this select 1;

_unit setVehicleVarName _name;