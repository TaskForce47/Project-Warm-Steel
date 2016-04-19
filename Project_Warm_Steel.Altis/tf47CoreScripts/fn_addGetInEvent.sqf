/* ----------------------------------------------------------------------------
		file: fnc_addGetInEvent.sqf
		================================

		Description:
		add GetIn event handler to a given unit

		Parameters:
		unit: the unit to attach the event
		licenceType: which licence is required

		Optional:

		Example:

		Returns:


		Author: funkrusha (ofpectag:TF47_)

---------------------------------------------------------------------------- */

private ["_unit", "_licenceType"];
_unit = _this select 0;
_licenceType = _this select 1;

call compile ("_unit addEventHandler [""GetIn"", { [_this, "+ str _licenceType + "] execVM ""tf47CoreScripts\vehicleOnEnter.sqf""; } ];");