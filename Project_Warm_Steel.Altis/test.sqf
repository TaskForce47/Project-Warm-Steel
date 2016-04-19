
_player = _this select 0;

if (!(_player getVariable ["ACE_isUnconscious", false])) then {      
	[_player, "ace_medical_unconscious", false] call ace_common_fnc_setCaptivityStatus;  
};  

_maxUnconHandle = _player getVariable ["ace_medical_maxUnconTimeHandle", -1];  
if (_maxUnconHandle > 0) then {      
	[_maxUnconHandle] call CBA_fnc_removePerFrameHandler;  
	};