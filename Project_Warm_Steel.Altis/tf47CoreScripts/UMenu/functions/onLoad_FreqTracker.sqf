//Script by derZade | Special Thanks to Willard for the Help :D
disableSerialization;
private ["_dialog","_var","_listBox","_text","_pic","_tooltip","_combo","_marker","_freq"];
_dialog = _this select 0;
_var = TF47_UMenu_FreqTracker_Logic getVariable ["TF47_FrequencyTracker",[]];


//Group ListBox
_listBox = _dialog displayCtrl 1500;
{
	_text = _x select 1;
	_listBox lbAdd _text;
	
	_pic = format ["\a3\ui_f\data\map\Markers\NATO\%1.paa",_x select 0];
	_listBox lbSetPicture [_forEachIndex,_pic];
	_listBox lbSetPictureColor [_forEachIndex, [1,1,1,1]];
	
	_freq = _x select 3;
	_tooltip = "";
	if (isNil "_freq" or _freq == "") then {
		_tooltip = format ["Leader: %1",_x select 2];
	} else {
		_tooltip = format ["%1 | %2 Mhz",_x select 2, _freq];
	};
	_listBox lbSetTooltip [_forEachIndex,_tooltip]
} forEach _var;


//Type ComboBox
_marker =  [["b_inf","Infantry"],["b_air","Helicopter (Trans.)"],["b_air","Helicopter (Attack)"],["b_plane","Plane (Trans.)"],["b_plane","Plane (Attack)"],["b_armor","Armor"]
			/*,["b_recon","Recon"],["b_hq","Headquarters"],["b_mech_inf","Mechanized Infantry"],["b_motor_inf","Motorized Infantry"],["b_naval","Naval"],["b_support","Support"],["b_uav","UAV"]*/];
_combo = _dialog displayCtrl 1802;
{
	_text = _x select 1;
	_combo lbAdd _text;

	_pic = format ["\a3\ui_f\data\map\Markers\NATO\%1.paa",_x select 0];
	_combo lbSetPicture [_forEachIndex,_pic];
	_combo lbSetPictureColor [_forEachIndex, [1,1,1,1]];
	_combo lbSetPictureColorSelected [_forEachIndex, [1,1,1,1]];

	_combo lbSetData [_forEachIndex, _x select 0];

} forEach _marker;

_combo lbSetCurSel 0;