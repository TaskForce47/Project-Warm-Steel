/*
* Short Description
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

_this allowDamage false; 

_this addAction [("<t color=""#fadf3e"">" + ("Show Tickets") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["show"]];  

_this addAction [("<t color=""#9ffa3e"">" + ("Add Tickets: 1") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["add", 1]];  
_this addAction [("<t color=""#9ffa3e"">" + ("Add Tickets: 5") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["add", 5]];  
_this addAction [("<t color=""#9ffa3e"">" + ("Add Tickets: 10") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["add", 10]];   

_this addAction [("<t color=""#fa6f3e"">" + ("Take Tickets: 1") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["use", 1]];  
_this addAction [("<t color=""#fa6f3e"">" + ("Take Tickets: 5") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["use", 5]];  
_this addAction [("<t color=""#fa6f3e"">" + ("Take Tickets: 10") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["use", 10]];   

_this addAction [("<t color=""#fa9f3e"">" + ("Reset Tickets") + "</t>"), format["%1ticketControlBase.sqf", _pathToScripts], ["init"]];  