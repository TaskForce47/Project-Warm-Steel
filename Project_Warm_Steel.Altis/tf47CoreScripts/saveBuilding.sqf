/*
* Makes Buildings undestroyable
* 
* Für Objecte folgende Init:
* null = this execVM "saveBuilding.sqf";
* Für Gebäude ein Gamelogic Object drauf mit Init:
* bld = (position this nearestobject "Building"); null = bld execVM "saveBuilding.sqf";
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clientside & Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/
if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};

_this allowDamage false;
_this setVariable ["R3F_LOG_disabled", true]; 
_this addEventHandler ["HandleDamage",{}];