////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ZadeServicePoint_fnc_Playerinit
 *	Author:	DerZade
 *	Description: Initializes all important Stuff for a local player  
 *	
 *	Parameter:
 *		0: Player 
 *		1: Initalize EH? 
 *
 *	Return Value: NONE	
 */
////////////////////////////////////////////////////////////////////////////////
ZadeServicePoint_fnc_Playerinit = {
	private ["_player","_initEH"];
	
	if (!isMultiplayer or !isServer) then {
		_player = _this select 0;
		_initEH = [_this, 1, false] call BIS_fnc_param;
		
		//Add Action to player
		_player addAction ["<t color='#8A0808'>Service Menu</t>",{createDialog 'ZadeServicePoint_ServiceVehicleDialog';},nil,2,true,false,"","[_this] call ZadeServicePoint_fnc_actionCondition"];

		//Initialize the Respawn EH
		if (_initEH) then {
			(_this select 0) addEventHandler ["Respawn",{[(_this select 0)] call ZadeServicePoint_fnc_playerInit;}];
		};
	};
};

////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ZadeServicePoint_fnc_checkWeapons
 *	Author:	DerZade
 *	Description: Function to check whether a vehicles has any weapons
 *	
 *	Parameter:
 *		0: Vehicle
 *
 *	Return Value:
 *		hasWeapons (BOOL) 
 */
////////////////////////////////////////////////////////////////////////////////
ZadeServicePoint_fnc_checkWeapons = {
	private ["_veh","_turretsconfig","_hasWeap"];

	_veh = _this select 0;
	_turretsconfig = (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets");
	_hasWeap = true; 

	IF (count _turretsconfig == 0) then {
		_hasWeap = false;
	} else {
		_hasWeap = false;
		{	
			if (count (getArray(_x >> "Weapons")) > 0) then {
				_hasWeap = true;
			};
		} forEach ("true" configClasses _turretsconfig);
	};
	IF (count getArray (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Weapons") > 1) then {
		_hasWeap = true;	
	};

	//Return Value
	_hasWeap
};

////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ZadeServicePoint_fnc_getDamage
 *	Author:	DerZade
 *	Description: Function to get the damage of a vehicle related to its HitPoints
 *	
 *	Parameter:
 *		0: Vehicle 
 *
 *	Return Value: 
 * 		Damage (Number from 1 to 0 or -1 for error)
 */
////////////////////////////////////////////////////////////////////////////////
ZadeServicePoint_fnc_getDamage = {
	private ["_veh","_hitPoints","_dam","_wheels","_wheeldam","_hitdam"];

	_veh = _this select 0;
	_hitPoints = [];
	_dam = 0;

	if (!(isNil "_veh")) then {
		//Get all HitPoints
		{
		  _hitPoint = configName _x;
		  _hitPoints = _hitPoints + [_HitPoint];
		} forEach ("true" configClasses (configFile >> "CfgVehicles" >> (typeOf _veh) >> "HitPoints"));

		_wheels = [];
		{
			if (_x in _hitPoints) then {
				_wheels = _wheels + [_x];
				_hitPoints = _hitPoints - [_x];
			};
			
			if (_x in _hitPoints and !("HitWheel" in _hitPoints)) then {
				_hitPoints = _hitPoints + ["HitWheel"];
			};
		} forEach ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitLBWheel","HitLMWheel","HitRBWheel","HitRMWheel"];

		_wheeldam = 0;
		{
			_hitdam = _veh getHitPointDamage _x;
			_wheeldam = _wheeldam + _hitdam; 
		} forEach _wheels;

		If (count _wheels > 0) then {
			_wheeldam = _wheeldam / (count _wheels);
		};
		//Add all Damages together
		{
			_hitdam = 0;
			if (_x != "HitWheel") then {
				_hitdam = _veh getHitPointDamage _x;
			} else {
				_hitDam = _wheeldam;
			};

			_dam = _dam + _hitdam; 
		} forEach _hitPoints;
		
		if (count _hitPoints > 0) then {
			//Divide damage sum by number of HitPoints		
			_dam = _dam / (count _hitPoints);
		} else {
			_dam = -1;
		};
	} else {
		_dam = -1;
	};

	//Return Value
	_dam
};

////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ZadeServicePoint_fnc_getAmmo
 *	Author:	DerZade
 *	Description: Function to get the ammo of a vehicle 
 *	
 *	Parameter:
 *		0: Vehicle 
 *
 *	Return Value: 
 * 		Ammo (Number from 1 to 0 or -1)	
 */
////////////////////////////////////////////////////////////////////////////////
ZadeServicePoint_fnc_getAmmo = {
	private ["_veh","_allturrets","_ammo","_dam","_turretsconfig","_subclass","_count","_maxammo","_checkedmags","_mags","_curAmmo"];

	_veh = _this select 0;

//GET MAXIMAL AMMO
	_allturrets = [];
	_ammo = 0;
	_dam = 0;
	_turretsconfig = (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets");
	if (!(isNil "_veh")) then {
		//Get all Turret
		{
		  	_turret = _x;
		  	_allturrets = _allturrets + [_turret];

		  	//Get Sub Classes of Turret
		  	{
		  		_subclass = _x;
		  		_subclass = configName _subclass;
		  		//IF SubClass == class Turrets
		  		if (_subclass == "Turrets") then {
		  			{
						_turret = _x;
					  	_allturrets = _allturrets + [_turret];
		  			} forEach ("true" configClasses _x);
		  		};
			} forEach ("true" configClasses _x);
		
		} forEach ("true" configClasses _turretsconfig);

		//Get All Ammo of turrets
		{
			{
				_count = getNumber (configFile >> "CfgMagazines" >> _x >> "Count");
				_ammo = _ammo + _count;
			} forEach (getArray (_x >> "magazines"));
		} forEach _allturrets;

		//Get all Ammo of Driver
		{
				_count = getNumber (configFile >> "CfgMagazines" >> _x >> "Count");
				_ammo = _ammo + _count;
		} forEach (getArray (configFile >> "CfgVehicles" >> (typeOf _veh) >> "magazines"));
	};
	_maxammo = _ammo;

//GET CURRENT AMMO
	_ammo = 0;

	_allturrets = allTurrets [_veh, false];
	_allturrets = _allturrets + [[-1]];

	{
		_turret = _x;
		_checkedmags = [];
		_mags = (_veh MagazinesTurret _turret);

		{
			_mag = _x;
			_count = _veh magazineTurretAmmo [_mag,_turret];

			if (_mag in _checkedmags) then {
				_count = getNumber (configFile >> "CfgMagazines" >> _mag >> "Count");
			};
			
			_checkedmags = _checkedmags + [_mag];
			_ammo = _ammo + _count;
		} forEach  _mags;
	
	} forEach _allTurrets;
	_curammo = _ammo;

//CHECK WEAPONS
	_hasWeap = [_veh] call ZadeServicePoint_fnc_checkWeapons;
	

	_ammo = -1;

	if (_maxAmmo != 0) then {
		_ammo = _curAmmo / _maxAmmo;
	};

	if (!_hasWeap) then {
		_ammo = -1;
	};

	//Return Value
	_ammo
};

////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ZadeServicePoint_fnc_actionCondition
 *	Author:	DerZade
 *	Description: Function to chekc if a unit should get the ServiceMenu-Action
 *	
 *	Parameter:
 *		0: Caller 
 *
 *	Return Value: 
 *		Should Get Action?  (BOOL)
 */
////////////////////////////////////////////////////////////////////////////////
ZadeServicePoint_fnc_actionCondition = {
	private ["_player","_veh","_shouldgetAction"];

	_player = _this select 0;
	_veh = vehicle _player;
	_shouldgetAction = true;

	//Check Basic stuff
	if (_veh == _player or (driver _veh) != _player or (getpos (_veh) select 2) > 2 or count ZadeServicePoint_Trigger == 0) then {_shouldgetAction = false;};

	//Check for a trigger
	if (_shouldgetAction) then {
		_shouldgetAction = false;
		{
			if (_veh in list _x) then {
				//Check Classes
				{
					if (_veh isKindOf _x) then {
						_shouldgetAction = true;
					};
				} forEach (_x getVariable "ZadeServicePoint_Classes");
			};
		} forEach ZadeServicePoint_Trigger;
	};

	//Return Value
	_shouldgetAction
};

////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ZadeServicePoint_fnc_rearmVehicle
 *	Author:	DerZade
 *	Description: Function to fully rearm a vehicle (thanks BI)
 *	
 *	Parameter:
 *		0: Vehicle 
 *
 *	Return Value: NONE
 */
////////////////////////////////////////////////////////////////////////////////
ZadeServicePoint_fnc_rearmVehicle = {

	_veh = _this select 0;
	_type = typeOf _veh;
	_object = _veh;
	_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

	[[_veh, 1],"setVehicleAmmoDef",true,true] call BIS_fnc_MP;
	/*
	if (count _magazines > 0) then {
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_object removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _magazines;
		{
			// _object vehicleChat format ["Reloading %1", _x];
			// sleep x_reload_time_factor;
			_object addMagazine _x;
		} forEach _magazines;
	};

	_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

	if (_count > 0) then {
		for "_i" from 0 to (_count - 1) do {
			scopeName "xx_reload2_xx";
			_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
			_magazines = getArray(_config >> "magazines");
			_removed = [];
			{
				if (!(_x in _removed)) then {
					_object removeMagazines _x;
					_removed = _removed + [_x];
				};
			} forEach _magazines;
			{
				// _object vehicleChat format ["Reloading %1", _x];
				// sleep x_reload_time_factor;
				_object addMagazine _x;
				// sleep x_reload_time_factor;
			} forEach _magazines;
			_count_other = count (_config >> "Turrets");
			if (_count_other > 0) then {
				for "_i" from 0 to (_count_other - 1) do {
					_config2 = (_config >> "Turrets") select _i;
					_magazines = getArray(_config2 >> "magazines");
					_removed = [];
					{
						if (!(_x in _removed)) then {
							_object removeMagazines _x;
							_removed = _removed + [_x];
						};
					} forEach _magazines;
					{
						// _object vehicleChat format ["Reloading %1", _x]; 
						// sleep x_reload_time_factor;
						_object addMagazine _x;
						// sleep x_reload_time_factor;
					} forEach _magazines;
				};
			};
		};
	};
	_object setVehicleAmmo 1;
	*/
	// //Remove all Magazines from all Turrets
	// {
		// _turret = _x;
		// {
			// _veh removeMagazineTurret [_x,_turret];
		// } forEach (_veh magazinesTurret _x); //all magazines of the current turret 

	// } forEach ((allTurrets _veh) + [[-1]]); //all turrets of the vehicle

	// //Add normal amount of magazines to driver
	// {
		// _veh addMagazineTurret [_x,[-1]];
	// } forEach (getArray (configFile >> "CfgVehicles" >> (typeOf _veh) >> "magazines")); //All magazines of the driver

	// //Add normal amount of magazines to all other turrets
	// {
		// _parentindex = _forEachIndex;
		// {
			// _veh addMagazineTurret [_x,[_parentindex]];
		// } forEach (getArray (_x >> "magazines"));

		// //Check if there are any Sub-Turrets
		// if (isClass (_x >> "Turrets")) then {
			// {
				// _childindex = _forEachIndex;
				// {
					// _veh addMagazineTurret [_x, [_parentindex,_childindex]]
				// } forEach (getArray (_x >> "Magazines"));
			// } forEach ("true" configClasses (_x >> "Turrets")); //All Sub-Turrets
		// };
	// } forEach ("true" configClasses (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Turrets")); //All Main-Turrets of _veh

};

publicVariable "ZadeServicePoint_fnc_Playerinit";
publicVariable "ZadeServicePoint_fnc_checkWeapons";
publicVariable "ZadeServicePoint_fnc_getDamage";
publicVariable "ZadeServicePoint_fnc_getAmmo";
publicVariable "ZadeServicePoint_fnc_actionCondition";
publicVariable "ZadeServicePoint_fnc_rearmVehicle";