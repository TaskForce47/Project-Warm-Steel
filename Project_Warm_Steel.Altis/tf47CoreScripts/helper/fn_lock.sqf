/* ----------------------------------------------------------------------------
		file:
		======

		Description:
		tiny helper function for lock to be executed over bis_fnc_mp
		to prevent using bis_fnc_execVM

		Parameters:
		unit: the unit
		lock: bool locked or unlocked

		Optional:

		Example:

		Returns:

		Author: funkrusha (ofpectag:TF47_)

---------------------------------------------------------------------------- */

private ["_lock", "_unit"];

_unit = _this select 0;
_lock = _this select 1;

_unit lock _lock;