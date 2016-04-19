



for "_i" from 0 to 8 do {
	if((random 1) <= 0.5) then {
		deleteVehicle call compile format["aa_trigger1_%1",_i];
		format["aa1_%1",_i] setMarkerPos [-10000,-10000,-10000];
		//[format["aa1_%1",_i],"deleteMarker",false,true] call BIS_fnc_MP;
		//deleteMarker format["aa1_%1",_i];
		_shilka = call compile format["aa_shilka1_%1",_i];

		{ deleteVehicle vehicle _x } forEach units _shilka; 
	
		{ deleteVehicle _x } forEach units _shilka;
		{ deleteVehicle _x } forEach units _shilka;
		//{ deleteVehicle _x } forEach crew _shilka;
		//deleteVehicle _shilka;
		
		

		for "_k" from 1 to 3 do {
			deleteVehicle call compile format["aa_radar%1_%2",_k,_i];
			{ deleteVehicle _x } forEach units group call compile format["aa_sq%1_%2",_k,_i];
		};
		
		_btr = call compile format["aa_btr1_%1",_i];
		_tank = call compile format["aa_tank1_%1",_i];
		_bmd = call compile format["aa_bmd1_%1",_i];
		{ deleteVehicle _x} forEach crew _btr;
		deleteVehicle _btr;
		
		{ deleteVehicle _x} forEach crew _tank;
		deleteVehicle _tank;
		
		{ deleteVehicle _x} forEach crew _bmd;
		deleteVehicle _bmd;
		
		// deleteVehicle call compile format["aa_btr1_%1",_i];
		// deleteVehicle call compile format["aa_tank1_%1",_i];
		// deleteVehicle call compile format["aa_bmd1_%1",_i];
		//{ deleteVehicle _x } forEach units format["aa_shilka1_%1",_i];
	};
};