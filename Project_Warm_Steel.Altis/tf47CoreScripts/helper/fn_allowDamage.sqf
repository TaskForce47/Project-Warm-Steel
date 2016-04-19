/* ----------------------------------------------------------------------------
		file:
		======

		Description:
		tiny helper function for allowDamage to be executed over bis_fnc_mp
		to prevent using bis_fnc_execVM

		Parameters:
		unit: the unit
		dmg: bool allow damage

		Optional:

		Example:

		Returns:

		Author: funkrusha (ofpectag:TF47_)

---------------------------------------------------------------------------- */

private ["_dmg", "_unit"];

_unit = _this select 0;
_dmg  = _this select 1;

_unit allowDamage _dmg;