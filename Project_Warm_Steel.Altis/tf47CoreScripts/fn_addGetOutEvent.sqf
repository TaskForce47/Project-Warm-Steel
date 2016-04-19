/* ----------------------------------------------------------------------------
		file:
		======

		Description:
		add GetOut event handler to a given unit

		Parameters:
		unit: the unit to add the event
		licence: which licence type

		Optional:

		Example:

		Returns:

		Author: funkrusha (ofpectag:TF47_)

---------------------------------------------------------------------------- */

private ["_unit", "_licenceType"];
_unit = _this select 0;
_licenceType = _this select 1;

call compile ("_unit addEventHandler [""GetOut"", { [_this, " + str (_licenceType) + "] execVM ""tf47CoreScripts\vehicleOnExit.sqf""; } ];");