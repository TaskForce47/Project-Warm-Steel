_center = _this select 0;
 
_minDist = 0;
_posSpawn = [0,0];
 
_phi=random 360;
_phi2=_phi;
 
_r=1000;
 
_minDist = 0;
 
while {(!(isOnRoad _posSpawn) || (_minDist<1000)) && (_phi-_phi2<360)} do
{
        _phi=_phi+10;
        _r=1000;
       
        _minDist=0;
 
        while {(!(isOnRoad _posSpawn) || (_minDist<1000)) && (_r<(2500))} do
        {
                _r = _r + 250;
                _posSpawn = [(_center select 0) + _r*cos(_phi), (_center select 1) + _r*sin(_phi)];
                _roads = _posSpawn nearRoads 1000;
                _posSpawn = getPos (_roads select 0);
                _minDist = [_posSpawn] call TF47_reinf_fnc_nearestPlayer;
        };
};
 
[_posSpawn,_phi]