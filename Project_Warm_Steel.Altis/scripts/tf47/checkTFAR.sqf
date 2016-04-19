private ["_server","_channel","_connected","_player"];

_player = _this select 0;
_allOk = 0;

while {_allOk != 1} do {
	_server = _player call TFAR_fnc_getTeamSpeakServerName;
	_channel = _player call TFAR_fnc_getTeamSpeakChannelName;
	_connected = _player call TFAR_fnc_isTeamSpeakPluginEnabled;
	if (_server != "ArmaSIM" || _channel != "Radio Communication - Public I" || !(_connected)) then {
		//BLACKSCREEN
    titleText ["You have to use TFAR on this Server and have to be on ts.armasim.de.","BLACK"];
		waitUntil {_server != _player call TFAR_fnc_getTeamSpeakServerName || format ["%1",_connected] != format ["%1",_player call TFAR_fnc_isTeamSpeakPluginEnabled] || _channel != _player call TFAR_fnc_getTeamSpeakChannelName};
	} else {
	_allOk = 1;
    titleText ["","PLAIN"];  

	};
};

if (true) exitWith {};