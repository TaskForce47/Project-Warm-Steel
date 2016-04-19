/*
* This script kicks in when somebody leaves a vehicle
*
* Long Description
* 
* Tested with :
* Arma 3 1.23
* 
* @category   Clienside Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/

 
if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
private "_pathToScripts";
waitUntil { !isNil "cfgTF47" };
call cfgTF47;

_params = _this select 0;
_licenceType = _this select 1;
_vehicle = _params select 0;
_position = _params select 1;
_player = _params select 2;

// Let Dustoff become Dustoff
if(typeOf _vehicle == "RHS_UH60M_MEV2") then {
	[[_player,west],"tf47_fnc_changePlayerSide"] call BIS_fnc_MP;
};

if (_position == "driver") then {
	[_vehicle] execVM format["%1mapMarkerUpdate.sqf", _pathToScripts];
};