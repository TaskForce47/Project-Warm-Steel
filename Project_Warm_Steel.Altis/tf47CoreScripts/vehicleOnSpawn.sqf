/*
* This script bootstraps newly (re-)spawned vehicles
*
* Long Description
*
* Tested with :
* Arma 3 1.23
*
* @category   Clienside Serverside Scripts
* @package    TF47 CoreScripts
* @author     [TF47] Amadox
* @website	  http://taskforce47.de/
* @version    1.0
*/
if (!isServer) exitWith {};
if(isNil "cfgTF47") then {
	cfgTF47 = compile preprocessFileLineNumbers "cfgTF47.sqf";
};

private ["_pathToScripts", "_LiftHelicopters", "_NoLiftHelicopters"];
waitUntil { !isNil "cfgTF47" };
call cfgTF47;

_unit = _this select 0;
_unitName = format["%1", _unit];
_licenceType = _this select 1;

// Respawn System Active (needed for Debug Respawn Feature at Service Point)
_unit setVariable ["RespawnSystemActive", true, true];


// Enter/Exit Handling Scripts
[[_unit, _licenceType], "tf47_fnc_addGetInEvent", true, true] spawn BIS_fnc_MP;
[[_unit, _licenceType], "tf47_fnc_addGetOutEvent", true, true] spawn BIS_fnc_MP;

if(typeOf _unit == "RHS_UH60M_MEV2" or typeOf _unit == "B_Slingload_01_Medevac_F" or typeOf _unit == "rhsusf_m113_usarmy_medical") then {
	_nop = [_unit] execVM "scripts\tf47\medicContainerLoadout.sqf";
};

// Helicopter Lifting Rules

#ifdef ACE3
if (_unitName in _LiftHelicopters) then {
	_unit setVariable ["ACE_Slingload_Rule", ["M1030","ATV_CZ_EP1","MTVR_DES_EP1","ACE_MTVRRepair","ACE_MTVRRefuel","ACE_MTVRReammo","ACE_Stryker_RV_SLAT_D","ACE_M1A1HA_TUSK_DESERT","M2A2_EP1","M1A2_US_TUSK_MG_EP1","M2A3_EP1","M6_EP1","ACE_Stryker_ICV_MK19_SLAT_D","M1135","TowingTractor","ACE_M1A1HC_TUSK_CSAMM_DESERT","HMMWV_Ambulance_DES_EP1"], true];
	_unit setVariable ["ACE_Slingload_Rule_Name", "LiftHeli", true];
};

if (_unitName in _NoLiftHelicopters) then {
	_unit setVariable ["ACE_Slingload_Rule", ["M1030","ATV_CZ_EP1","MTVR_DES_EP1","ACE_MTVRRepair","ACE_MTVRRefuel","ACE_MTVRReammo","ACE_Stryker_RV_SLAT_D","ACE_M1A1HA_TUSK_DESERT","M2A2_EP1","M1A2_US_TUSK_MG_EP1","M2A3_EP1","M6_EP1","ACE_Stryker_ICV_MK19_SLAT_D","M1135","TowingTractor","ACE_M1A1HC_TUSK_CSAMM_DESERT","HMMWV_Ambulance_DES_EP1","MTVR_DES_EP1","ACE_MTVRRepair","ACE_MTVRRefuel","ACE_MTVRReammo","ACE_Stryker_RV_SLAT_D","ACE_M1A1HA_TUSK_DESERT","M2A2_EP1","M1A2_US_TUSK_MG_EP1","M2A3_EP1","M6_EP1","ACE_Stryker_ICV_MK19_SLAT_D","M1135","TowingTractor","HMMWV_Avenger_DES_EP1","LandRover_Special_CZ_EP1","HMMWV_TOW_DES_EP1","HMMWV_M998_crows_MK19_DES_EP1","HMMWV_M998_crows_M2_DES_EP1","BAF_Jackal2_L2A1_D","BAF_Jackal2_GMG_D","BAF_Jackal2_GMG_D","HMMWV_Ambulance_DES_EP1","HMMWV_M998A2_SOV_DES_EP1","ACE_HMMWV_GMV","LandRover_CZ_EP1","HMMWV_M1151_M2_DES_EP1"], true];
	_unit setVariable ["ACE_Slingload_Rule_Name", "NoLiftHeli", true];
};
#endif

//[_unit] execVM format["%1vehicleWeaponModifications.sqf", _pathToScripts];