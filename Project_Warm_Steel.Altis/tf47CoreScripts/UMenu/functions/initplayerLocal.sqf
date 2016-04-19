sleep 1;
if (isNil "TF47_UMenu_isUMenuEnabled") then {TF47_UMenu_isUMenuEnabled = false;};
	
if (player == _this select 0 and TF47_UMenu_isUMenuEnabled) then {
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "_null = _this call TF47_UMenu_fnc_KeyDown;"];
	titleText ["Press 'CTRL' and 'U' to change your ViewDistance-Settings and more.", "PLAIN"];
	titleFadeOut 10;
};