/*
* Spawns IEDs
*
* Long description for file (if any)...
* 
* Tested with :
* Arma 3 1.23
*
* @category   n/a
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @author     [TF47] Desty
* @website	  http://taskforce47.de/
* @version    1.0
*/
if(isNil "cfgTF47") then { cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf"; };
private ["_pathtoscripts"]; 
call cfgTF47;
	
_obj = _this select 0;
_size = if (count _this > 1) then {_this select 1} else {1};
_radius = if (count _this > 2) then {_this select 2} else {10};
_delay = if (count _this > 3) then {_this select 3} else {0};

_bomb = "R_OG7_AT";
if(_size == 2) then { _bomb = "R_57mm_HE"; };
if(_size == 3) then { _bomb = "M_Sidewinder_AA"; };
if(_size == 4) then { _bomb = "BO_GBU12_LGB"; };


_trigger = createTrigger["EmptyDetector", getPos _obj];
_trigger attachTo [_obj, [0,0,0]];
_trigger setTriggerArea[_radius,_radius,0,false];
_trigger setTriggerActivation["WEST", "PRESENT", false];
_triggeract = format["sleep %1; '%2' createvehicle getPos %3;", _delay, _bomb, _obj];
_trigger setTriggerStatements["this", _triggeract, ""]; 