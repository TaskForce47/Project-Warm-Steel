/*
* Handles all Database Connections
*
* Tested with :
* Arma 3 1.23
* Arma2NET 2.3
* Arma2NETMySQLPlugin by Firefly
*
* @category   Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @author     [TF47] meat
* @website        http://taskforce47.de/
* @version    1.0
*/

if(isNil "cfgTF47") then {
        cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};
#define DEBUG_MODE_FULL
#include "\x\cba\addons\main\script_macros.hpp"
disableSerialization;

waitUntil { !isNil "cfgTF47" };
call cfgTF47;

if(!isMultiplayer) then {
        TF47_MISSIONID = 99;
};

if (!isDedicated) then {
        waitUntil {!isNull player};

        player addEventHandler["killed", {
                private ["_infantryTickets"];
                waitUntil { !isNil "cfgTF47" };
                call cfgTF47;

                _unit = _this select 0;
                _slotname = format["%1", _unit];
                _playername = name _unit;
                _playerSide = side _unit;
                _killer = _this select 1;

                _comment = format ["Player: %1 (%2, %3)", _playername, _unit, _playerSide];
                _ticketCost = [_infantryTickets, _slotname] call CBA_fnc_hashGet;

                _diagcomment = format["%1, costs %2 tickets", _comment, _ticketCost];
                ["tf47_diaglog", _diagcomment] call CBA_fnc_globalEvent;

                _uid = "7412934";
                if(isMultiplayer) then {
                        _uid = getPlayerUID _unit;
                };

                ["tf47_changetickets", [WEST, 5, _ticketCost, "", _uid, _playername]] call CBA_fnc_globalEvent;
        }];
};

// Make sure this is only running server-side...
if (isServer) then {

        // ... and only once!
        if (isNil "serverEventsExecuted") then {

                serverEventsExecuted = true;
                publicVariable "serverEventsExecuted";

                westTickets = TICKETS_WEST;
                publicVariable "westTickets";

                TICKETS_EAST = 9999;
                publicVariable "TICKETS_EAST";
                eastTickets = TICKETS_EAST;
                publicVariable "eastTickets";

                ticketSystemActiveWest = false;
                if(TICKETS_WEST > 0) then {
                        ticketSystemActiveWest = true;
                };

                ticketSystemActiveEast = false;
                if(TICKETS_WEST > 0) then {
                        ticketSystemActiveEast = true;
                };

                ticketsMID = TF47_MISSIONID;
                publicVariable "ticketsMID";

                missionActive = true;
                publicVariable "missionActive";

                ["tf47_changetickets", {
                        //["tf47_changetickets", [WEST, 1, 0, "comment", _playerid, "dispstring"]] call CBA_fnc_globalEvent;
                        // param 0: side
                        // param 1: action (1: init, 2: added, 3: used, 4: vehlost, 5: inflost, 6: civilost, 7: desertion, 8: adminadd, 9: adminuse, 10: adminreset, 95:vehspawn, 96:vehrespawn, 97: logging, 98: mission lost, 99: mission success)
                        // param 2: change
                        // param 3: comment
                        // param 4: playerid (optional, to display in ticketlog)
                        // param 5: disp comment (optional, to display in the ticket change hint)

                        _side = _this select 0;
                        _action= _this select 1;
                        _change= _this select 2;
                        _dbchange = _change;

                        _comment = if (count _this > 3) then {_this select 3} else { "" };
                        _playerid = if (count _this > 4) then {_this select 4} else { "" };
                        _dispcomment = if (count _this > 5) then {_this select 5} else { "" };

                        diag_log format ["%1, %2, %3, %4, %5, %6", _side, _action, _change, _comment, _playerid, _dispcomment];

                        if((_side == WEST) && missionActive) then {

                                if (ticketSystemActiveWest) then {
                                        // Init Tickets
                                        if (_action in [1, 10]) then {
                                                westTickets = TICKETS_WEST;
                                                eastTickets = TICKETS_EAST;

                                        } else {

                                                // Add Tickets
                                                if (_action in [2, 8]) then {

                                                        _oldWestTickets = westTickets;

                                                        // Normal Gain
                                                        if((westTickets < TICKETS_SOFTCAP) || (_action in [8])) then {
                                                                westTickets = westTickets + _change;

                                                        // Softcap
                                                        } else {
                                                                _change = floor(_change/2);
                                                                westTickets = westTickets + _change;
                                                        };

                                                        // Hardcap
                                                        if(westTickets > TICKETS_HARDCAP) then {
                                                                westTickets = TICKETS_HARDCAP;
                                                                _change = westTickets - _oldWestTickets;
                                                        };
                                                        _dbchange = _change;

                                                // Use / Lose Tickets
                                                } else {
                                                        if (_action in [3, 4, 5, 6, 7, 9]) then {
                                                                _change = _change * -1;
                                                                westTickets = westTickets + _change;
                                                                _dbchange = _dbchange * -1;
                                                        };
                                                };
                                        };

                                        // Make sure we don't get negative ticket counts
                                        if (westTickets < 0) then {
                                                westTickets = 0;
                                        };
                                } else {
                                        westTickets = 0;
                                        publicVariable "westTickets";
                                };

                                _missionid= ticketsMID;
                                if (_missionid > 0) then {

                                        diag_log format ["*********************************"];

                                        _query = "null";

                                        if(_playerid != "") then {
                                                if(_comment != "") then {
                                                        diag_log format ["using playerid query with comment"];
                                                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `arma2uid`, `comment`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5', '%6')", _missionid, _action, _dbchange, westTickets, _playerid, _comment];
                                                } else {
                                                        diag_log format ["using playerid query without comment"];
                                                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `arma2uid`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5')", _missionid, _action, _dbchange, westTickets, _playerid];
                                                };
                                        } else {
                                                if(_comment != "") then {
                                                        diag_log format ["using default query with comment"];
                                                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `comment`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5')", _missionid, _action, _dbchange, westTickets, _comment];
                                                } else {
                                                        diag_log format ["using default query without comment"];
                                                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4')", _missionid, _action, _dbchange, westTickets];
                                                };
                                        };

                                        diag_log format ["_missionid: '%1'", _missionid];
                                        diag_log format ["_action: '%1'", _action];
                                        diag_log format ["_dbchange: '%1'", _dbchange];
                                        diag_log format ["westTickets: '%1'", westTickets];
                                        diag_log format ["_playerid: '%1'", _playerid];
                                        diag_log format ["_comment: '%1'", _comment];

                                        diag_log format["--- TF47 Ticket System DB Query: %1", _query];

                                        if(_query != 'any' && _query != 'null') then {
                                                "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];
                                        };

                                } else {
                                        diag_log "--- TF47 Ticket System DB Extension failed: No MissionID given";
                                };

                                // Ticket Reset Message
                                if (_action == 1) then {
                                        ["tf47_showTickets", WEST] call cba_fnc_globalEvent;
                                };

                                // Added Ticket Message
                                if (_action == 2) then {
                                        _msg = format["An objective has been completed.<br/>"];
                                        if(ticketSystemActiveWest) then {
                                                _msg = _msg + format["<t color=""#88FF88"">Tickets added:</t> %1<br/>", _change];
                                                _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        };
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Objective completed - Tickets added: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Used Ticket Message
                                if (_action == 3) then {
                                        _msg = format["A vehicle has been purchased.<br/>"];
                                        if(ticketSystemActiveWest) then {
                                                _msg = _msg + format["<t color=""#FF8888"">Tickets used:</t> %1<br/>", _change];
                                                _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        };
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Vehicle Purchase - Tickets lost: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Lost Vehicle Ticket Message
                                if (_action == 4) then {
                                        _msg = format["%1 has been destroyed.<br/>", _dispcomment];
                                        if(ticketSystemActiveWest) then {
                                                _msg = _msg + format["<t color=""#FF8888"">Ticket change:</t> %1<br/>", _change];
                                                _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        };
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Vehicle destroyed - Tickets lost: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Lost Infantry Ticket Message
                                if (_action == 5) then {
                                        _msg = format["%1 has died.<br/>", _dispcomment];
                                        if(ticketSystemActiveWest) then {
                                                _msg = _msg + format["<t color=""#FF8888"">Ticket change:</t> %1<br/>", _change];
                                                _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        };
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Infantry Death - Tickets lost: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Killed Civilian Ticket Message
                                if (_action == 6) then {
                                        _msg = format["A civilian has been killed.<br/>"];
                                        if(ticketSystemActiveWest) then {
                                                _msg = _msg + format["<t color=""#FF8888"">Ticket change:</t> %1<br/>", _change];
                                                _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        };
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Civilian Casulty - Tickets lost: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Deserted Vehicle Ticket Message
                                if (_action == 7) then {
                                        _msg = format["%1 has been deserted.<br/>", _dispcomment];
                                        if(ticketSystemActiveWest) then {
                                                _msg = _msg + format["<t color=""#FF8888"">Tickets lost:</t> %1<br/>", _change];
                                                _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        };
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Vehicle Desertion - Tickets lost: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Admin Ticket Add Message
                                if (_action == 8 && ticketSystemActiveWest) then {
                                        _msg = format["An Admin has granted us tickets.<br/>"];
                                        _msg = _msg + format["<t color=""#88FF88"">Tickets granted:</t> %1<br/>", _change];
                                        _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Admin Tickets Granted - Tickets added: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Admin Ticket Used Message
                                if (_action == 9 && ticketSystemActiveWest) then {
                                        _msg = format["An Admin has reduced our tickets.<br/>"];
                                        _msg = _msg + format["<t color=""#FF8888"">Tickets reduced:</t> %1<br/>", _change];
                                        _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Admin Tickets Reduced - Tickets lost: %1, Tickets remaining: %2", _change, westTickets];
                                };

                                // Admin Ticket Reset Message
                                if (_action == 10 && ticketSystemActiveWest) then {
                                        _msg = format["An Admin has reset our tickets.<br/>"];
                                        _msg = _msg + format["<t color=""#88FFFF"">Tickets remaining:</t> %1", westTickets];
                                        [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                        diag_log format["*** Admin Tickets Reset - Tickets remaining: %2", _change, westTickets];
                                };

                                // Mission Lost
                                if (westTickets <= 0 && ticketSystemActiveWest) then {
                                        missionActive = false;
                                        publicVariable "missionActive";

                                        diag_log format["*** BLUFOR is out of Tickets, the Mission is lost"];

                                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `comment`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5')", _missionid, 98, 0, 0, "Mission Lost"];
                                        diag_log format["--- TF47 Ticket System DB Query: %1", _query];

                                        "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];

                                        sleep 3;
                                        [-2, {
                                                sleep 10;
                                                hint parseText format["<t color=""#FF0000"">BLUFOR is out of Tickets,<br/>the Mission is lost!</t>"];
                                                sleep 10;
                                                hint parseText format["<t color=""#FF0000"">BLUFOR is out of Tickets,<br/>the Mission is lost!</t>"];
                                                endmission "LOSER";
                                        }] call cba_fnc_globalExecute;
                                };
                        };

                }] call CBA_fnc_addEventHandler;




                ["tf47_ticketinfo", {
                        //["tf47_ticketinfo", "comment"] call CBA_fnc_globalEvent;
                        _comment = _this;
                        _missionid= ticketsMID;

                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `comment`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5')", _missionid, 97, 0, westTickets, _comment];
                        diag_log format["--- TF47 Ticket System DB Query: %1", _query];

                        "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];

                }] call CBA_fnc_addEventHandler;




                ["tf47_spawninfo", {
                        //["tf47_spawninfo", "comment"] call CBA_fnc_globalEvent;
                        _comment = _this;
                        _missionid= ticketsMID;

                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `comment`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5')", _missionid, 95, 0, westTickets, _comment];
                        diag_log format["--- TF47 Ticket System DB Query: %1", _query];

                        "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];

                }] call CBA_fnc_addEventHandler;




                ["tf47_respawninfo", {
                        //["tf47_respawninfo", "comment"] call CBA_fnc_globalEvent;
                        _comment = _this;
                        _missionid= ticketsMID;

                        _query = format ["INSERT INTO gadget_ticketlog (`missionid`, `timestamp`, `action`, `change`, `count`, `comment`) VALUES ( '%1', UNIX_TIMESTAMP(), '%2', '%3', '%4', '%5')", _missionid, 96, 0, westTickets, _comment];
                        diag_log format["--- TF47 Ticket System DB Query: %1", _query];

                        "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];

                }] call CBA_fnc_addEventHandler;




                ["tf47_loginlog", {
                        //["tf47_loginlog", player] call CBA_fnc_globalEvent;
                        if(isMultiplayer) then {
                                _player = _this;
                                _missionid= ticketsMID;
                                _playerid = getPlayerUID _player;
                                _slotname = format["%1", _player];
                                _playername = name _player;

                                _query = format ["INSERT INTO gadget_loginlog (`timestamp`, `playerid`, `nick`, `missionid`, `slot`) VALUES ( UNIX_TIMESTAMP(), '%1', '%2', '%3', '%4')", _playerid, _playername, _missionid, _slotname];
                                diag_log format["--- TF47 Loginlog DB Query: %1", _query];

                                "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];
                        };

                }] call CBA_fnc_addEventHandler;




                ["tf47_diaglog", {
                        //["tf47_diaglog", "logentry"] call CBA_fnc_globalEvent;
                        diag_log _this;
                }] call CBA_fnc_addEventHandler;




                ["tf47_checklist", {
                        //["tf47_checklist", [_player, _playerId, listID]] call CBA_fnc_globalEvent;
                        _player = _this select 0;
                        _playerId = _this select 1;
                        _listID = _this select 2;

                        _query = format ["SELECT `playerid` FROM gadget_playerlist WHERE `listid` = '%1' AND playerid = '%2'", _listID, _playerId];
                        diag_log format["--- TF47 CheckList DB Query: %1", _query];

                        _get = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];
                        _result = true;
						hint str _get;
                        diag_log format["--- Result: %1", _get];
                        if((_get != format["[[[%1]]]", _playerId]) && (_get != format["[[[""%1""]]]", _playerId])) then {
                                _result = false;
                        };

                        if(!isMultiplayer) then {
                                _result = true;
                        };

                        TF47ChecklistResult = _result;
                        _owner = owner _player;
                        _owner publicVariableClient "TF47ChecklistResult";
						//hint str TF47ChecklistResult;

                }] call CBA_fnc_addEventHandler;




                ["tf47_checkconfig", {
                        //["tf47_checkconfig", [_player, _varname]] call CBA_fnc_globalEvent;
                        _player = _this select 0;
                        _varname = _this select 1;

                        _query = format ["SELECT `value` FROM gadget_config WHERE `name` = '%1'", _varname];
                        diag_log format["--- TF47 CheckConfig DB Query: %1", _query];

                        _get = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['gadget', '%1']", _query];
                        diag_log format["--- Result: %1", _get];
                        if(_get == "[[]]") then {
                                _get = 0;

                        } else {
                                //_get = [_get, '"', ''] call CBA_fnc_replace; // [[["1"]]] => [[[1]]]
                                _get = call compile _get;
                                _get = _get select 0;           // [[[1]]] => [[1]]
                                _get = _get select 0;           // [[1]] => [1]
                                _get = _get select 0;           // [1] => 1
                        };

                        TF47CheckconfigResult = _get;
                        _owner = owner _player;
                        _owner publicVariableClient "TF47CheckconfigResult";

                }] call CBA_fnc_addEventHandler;




                //Show current Ticket Count
                ["tf47_showTickets", {
                        private ["_side", "_msg"];
                        _side = _this;

                        if (_side == WEST) then {
                                _msg = format["<t color=""#00FFFF"">Current Tickets:</t> %1", westTickets];
                                [-1, { hint parseText (_this); }, _msg] call cba_fnc_globalExecute;
                                diag_log format["*** Tickets remaining: %1", westTickets];
                        };

                }] call cba_fnc_addEventHandler;
        };

        // Initialize Tickets
        _startComment = format["%1", TF47_MISSIONINFO];
        ["tf47_changetickets", [WEST, 1, 0, _startComment]] call CBA_fnc_globalEvent;

        // Show current Tickets every 5 Minutes
        while {true} do {
                sleep 300;
                ["tf47_showTickets", WEST] call cba_fnc_globalEvent;
        };
};