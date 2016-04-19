private ["_unit"];
_unit = _this select 0;

_totalBloodLoss = 0;
_openWounds = _unit getVariable ["ace_medical_openWounds", []];
{
    // total bleeding ratio * percentage of injury left
    _totalBloodLoss = _totalBloodLoss + ((_x select 4) * (_x select 3));
}foreach _openWounds;

(_totalBloodLoss == 0);