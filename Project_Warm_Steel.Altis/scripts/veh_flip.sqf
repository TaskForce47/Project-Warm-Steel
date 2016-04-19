
 _vehicle = _this select 0;
_man = _this select 1;

    if ( vehicle _man != _man) then {
        hint "You must dissembark before this action.";
    } else {
    if (isEngineOn _vehicle) then {
        hint "turn engine off before this action.";
    } else {

 _vehicle = nearestobjects [player,["car","motorcycle","tank","air"],10];
{
   _newPos = getPos _x;                         
   _newPos set [2, (_newPos select 2)+0.5];  

   _x setPos _newPos;                            
} forEach _vehicle; 
  

    if (isServer) then {
    hint composeText [parsetext format["<t size='1.2' align='center' color='#FFA500'>Vehicle Flipped%1</t>"]];
    sleep 6;
    hint "";
    };
  };
};









