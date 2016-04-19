TF47_UMenu_isUMenuEnabled = true;
publicVariable "TF47_UMenu_isUMenuEnabled";

TF47_UMenu_showTickets = _this select 0;
TF47_UMenu_Color_Default = "ColorBLUFOR";
TF47_UMenu_Color_Trans = "ColorBLUFOR";
TF47_UMenu_Color_Attack = "ColorBLUFOR";
_V = _this select 1;
if !(isNil "_V") then {TF47_UMenu_Color_Default = _this select 1};
_V = _this select 2;
if !(isNil "_v") then {TF47_UMenu_Color_Trans = _this select 2};
_V = _this select 3;
if !(isNil "_v") then {TF47_UMenu_Color_Attack = _this select 3};

publicVariable "TF47_UMenu_showTickets";

if (isNil "TF47_UMenu_FreqTracker_Logic") then {
	_group = createGroup east;
	"Logic" createUnit [[0,0,0],_group,"TF47_UMenu_FreqTracker_Logic=this"]; 
};