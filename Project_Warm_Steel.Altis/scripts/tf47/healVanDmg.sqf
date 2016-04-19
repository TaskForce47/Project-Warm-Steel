
_med = _this select 0;

_object = cursorTarget;

if (!(isNull _object) && _object isKindOf "ParachuteBase" || _object isKindOf "Man") then {
	if(((position player) distance cursorTarget) > 2) exitWith {};
	if (!alive _object) exitWith {};
	if(!([_object] call tf47_fnc_isStable)) then {
		hint "Player isn't stabilized!";
	} else {
		if(damage _object == 0) then {
			hint "Player is fully healed!";
		} else {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			_object setDamage 0;
		};
	};
};