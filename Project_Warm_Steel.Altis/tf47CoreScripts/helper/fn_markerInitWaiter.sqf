waitUntil {time > 10};
if (!isServer) then {
	waitUntil {!isNull player};
};
waituntil {!isnil "bis_fnc_init"};
waituntil {!isNil "tf47_betterInit"};
waitUntil {tf47_betterInit};
[_this,"tf47_fnc_unitMarkerInit",owner player] call BIS_fnc_MP;