/*
* Short Description
*
* Long Description
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
private ["_pathToScripts", "_secureSlots"];
waitUntil { !isNil "cfgTF47" };
call cfgTF47;

sleep 10;
{
	[_x select 0] execVM format["%1mapMarkerUpdate.sqf", _pathToScripts];
	sleep 0.1;
} forEach _secureSlots;

while { isServer } do {
	sleep 300;
	{
		[_x select 0] execVM format["%1mapMarkerUpdate.sqf", _pathToScripts];
		sleep 0.1;
	} forEach _secureSlots;
};