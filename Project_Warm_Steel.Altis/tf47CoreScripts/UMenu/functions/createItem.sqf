//Script by DerZade
disableSerialization;
private ["_dialog","_curSel","_type","_name","_leader","_freq","_item","_listBox","_pic","_tooltip","_var","_markerName","_marker","_yoffset"];
_dialog = uiNamespace getVariable "TF47_Freq_Tracker";

_cursel = (lbCurSel (_dialog displayCtrl 1802));
_type = (_dialog displayCtrl 1802) lbData _curSel;

_name = ctrlText (_dialog displayCtrl 1804);
_exit = false;
if (_name == "" or _name == "INSERT NAME") then {_exit = true;};
_leader = ctrlText (_dialog displayCtrl 1806);
if (_leader == "" or _leader == "INSERT NAME") then {_exit = true;};
_freq =ctrlText (_dialog displayCtrl 1808);

if !(_exit) then {

	//Create Entity in TF47_UMenu_FreqTracker_Logic variable
	_item = [_type,_name,_leader,_freq]; 
	_var = TF47_UMenu_FreqTracker_Logic getVariable ["TF47_FrequencyTracker",[]];
	_var = _var + [_item];
	TF47_UMenu_FreqTracker_Logic setVariable ["TF47_FrequencyTracker",_var,true];

	//Add Group to ListBox
	_listBox = _dialog displayCtrl 1500;

	_listBox lbAdd _name;

	_pic = format ["\a3\ui_f\data\map\Markers\NATO\%1.paa",_type];
	_listBox lbSetPicture [(count _var -1),_pic];
	_listBox lbSetPictureColor [(count _var -1),[1,1,1,1]];


	_tooltip = "";
	if (isNil "_freq" or _freq == "") then {
		_tooltip = format ["Leader: %1",_leader];
	} else {
		_tooltip = format ["%1 | %2 Mhz",_leader, _freq];
	};

	_listBox lbSetTooltip [(count _var -1),_tooltip];

	//CreateMarker on Map
	_markerName = format ["M_FreqTracker_%1",(count _var - 1)];
	_yoffset = (count _var - 1) * 200;

	_marker = createMarker [_markerName,[(getMarkerPos "M_SquadMarker") select 0,(((getMarkerPos "M_SquadMarker") select 1) - _yoffset)]];
	_marker setMarkerShape "ICON";  
	_marker setMarkerType _type;
	_color = TF47_UMenu_Color_Default;
	if (_cursel == 1 || _cursel == 3) then {_color = TF47_UMenu_Color_Trans;};
	if (_cursel == 2 || _cursel == 4) then {_color = TF47_UMenu_Color_Attack;};
	_marker setMarkerColor _color;

	if (isNil "_freq" or _freq == "") then {
		_marker setMarkerText format ["%1 | %2",_name,_leader];
	} else {
		_marker setMarkerText format ["%1 | %2 | Freq.: %3 Mhz",_name,_leader,_freq];
	};
};