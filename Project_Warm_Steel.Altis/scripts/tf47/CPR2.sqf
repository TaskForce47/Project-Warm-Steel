
_med = _this select 0;

_object = cursorTarget;

if (!(isNull _object) && _object isKindOf "ParachuteBase" || _object isKindOf "Man") then {
	if(((position player) distance _object) > 2) exitWith {};
	if (!alive _object) exitWith {};
	if(!([_object] call tf47_fnc_isStable)) then {
		hint "Player isn't stabilized!";
	} else {
		if (_object getvariable ["ACE_isUnconscious", false]) then {
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 3;
			player playMove "AinvPknlMstpSlayWrflDnon_medic";
			sleep 3;
			if((round random 5) <= 1) then {
			// player playMove "AinvPknlMstpSlayWrflDnon_medic";
			// sleep 3;
				[_object, false] call ace_medical_fnc_setUnconscious;
				_hrtr = (random 10) + 40;
				_object setvariable ["ace_medical_inCardiacArrest", nil,true];
				//_object setvariable [QGVAR(bloodPressure), [50,70]];
				_object setVariable ["ace_medical_heartRate", _hrtr, true];
				_object setvariable ["ace_medical_isUnconscious", false, true]; 
				_object setvariable ["ace_medical_inReviveState", false, true];
				// cursorTarget setvariable ["ace_medical_inCardiacArrest", nil,true];      
				// cursorTarget setvariable ["ace_medical_heartRate", 40, true];      
				// cursorTarget setvariable ["ace_medical_isUnconscious", false, true]; 
				// cursorTarget setvariable ["ace_medical_inReviveState", false, true];
			};
	};
		};
};