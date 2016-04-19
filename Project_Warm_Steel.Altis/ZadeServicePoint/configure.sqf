/*///////////////////////////////////////////////////////////////////////////
	Service Point Properties
*////////////////////////////////////////////////////////////////////////////

//Time needed to refuel a vehicle  
ZadeServicePoint_Time_Refuel = 30;	// Default = 300

//Time needed to theoretically fully repair a vehicle
ZadeServicePoint_Time_Repair = 30;	// Default = 300

//Time needed to rearm a vehicle 
ZadeServicePoint_Time_Rearm = 30;	// Default = 300

//Time needed to clear the gear of a vehicle 
ZadeServicePoint_Time_Clear = 15;	// Default = 150

//Time Multiplier for Air Vehicles
ZadeServicePoint_AirMultiplier = 1;	// Default = 1

//Code thats beeing called beofre respawn (Vehicle = _this)
ZadeServicePoint_BeforeRespawnCode = {};	// Default = {}

//A List of All Vehices that aren't allowed to load a Loadout 	
ZadeServicePoint_DisallowLoadouts = ["O_Quadbike_01_F","B_G_Quadbike_01_F","B_Plane_CAS_01_F"]; //Default = ["B_Quadbike_01_F","B_G_Quadbike_01_F","B_Plane_CAS_01_F"];


/*///////////////////////////////////////////////////////////////////////////
	Service Point Loadouts
*////////////////////////////////////////////////////////////////////////////

/*
A Loadout is a array containing of:
	0: Remove previous Gear (BOOL)
	1: Loadout Name (STRING)
	2: Loading Time (NUMBER)
	3: Weapons (ARRAY)
	4: Magazines (ARRAY)
	5: Items (ARRAY)
	6: Backpack (ARAAY)

A item/weapon/Magazine/Backpack-Array contains of arrays containing the classname and the amount.
Weapons Example: [["arifle_MX_F",5],["hgun_P07_F",1],["launch_NLAW_F",1]];

Examples:

_Weapons = [["arifle_MX_F",5],["hgun_P07_F",1],["launch_NLAW_F",1]];
_Mags	= [["30Rnd_65x39_caseless_mag",20],["HandGrenade",10],["30Rnd_65x39_caseless_mag_Tracer",20]];
_Items	= [["ItemGPS",1],["MineDetector",1]];
_Backpack = [];
_RandomLoadout = [true,"Random Loadout",120,_Weapons,_Mags,_Items,_Backpack];

_UAV = [false,"UAV Operator",1,[],[],[["B_UavTerminal",1]],[["B_UAV_01_backpack_F",1]]];
*/
//Place for your Loadouts
//ANTITANK
_Weapon = [["tf47_m3maaws",1],["tf47_at4_heat",4]];
_Magazin = [["tf47_m3maaws_heat",6],["tf47_m3maaws_he",3],["tf47_m3maaws_hedp",4]];
_Item = [["tf47_optic_m3maaws",1]];
_Backpack = [];
_ANTITANK = [true,"ANTITANK",90,_Weapon,_Magazin,_Item,_Backpack];
 
//EOD
_Weapon = [];
_Magazin = [["DemoCharge_Remote_Mag",10],["SatchelCharge_Remote_Mag",2],["rhs_mag_m18_red",2],["rhs_mag_m18_green",2],["rhs_mag_m18_yellow",2],["rhs_mag_an_m8hc",5]];
_Item = [["ACE_Clacker",2],["ACE_DefusalKit",2]];
_Backpacks = [["B_AssaultPack_cbr",1]];
_EOD = [true,"EOD",90,[],_Magazin,_Item,_Backpack];
 
//INFANTRY
_Weapon = [["rhs_weap_m4a1_carryhandle",2],["tf47_at4_heat",2]];
_Magazin = [["DemoCharge_Remote_Mag",3],["SatchelCharge_Remote_Mag",1],["rhs_mag_30Rnd_556x45_Mk318_Stanag",20]];
_Item = [["rhsusf_acc_ACOG",2],["ToolKit",1],["ACE_Clacker",1],["ACE_DefusalKit",1]];
_Backpack = [];
_INFANTRY = [true,"INFANTRY",90,_Weapon,_Magazin,_Item,_Backpack];
 
//MEDICAL
_Weapon = [];
_Magazin = [["rhs_mag_m18_red",2],["rhs_mag_m18_green",2],["rhs_mag_m18_purple",2],["rhs_mag_an_m8hc",10]];
_Item = [["ACE_packingBandage",100],["ACE_elasticBandage",100],["ACE_quikclot",60],["ACE_tourniquet",10],["ACE_morphine",36],["ACE_epinephrine",36],["ACE_salineIV",10],["ACE_bloodIV",6],["ACE_personalAidKit",25]];
_Backpack = [];
_MEDICAL = [true,"MEDICAL",90,[],_Magazin,_Item,[]];
 
//AA_MODULE
_Weapon = [["rhs_weap_fim92",1]];
_Magazin = [["rhs_fim92_mag",3]];
_Item = [];
_Backpack = [];
_AA_MODULE = [false,"AA Modul",25,_Weapon,_Magazin,[],[]];
 
//AMMUNITION_MODULE
_Weapon = [];
_Magazin = [["rhs_mag_30Rnd_556x45_Mk318_Stanag",30],["rhs_200rnd_556x45_M_SAW",10],["rhsusf_100Rnd_762x51",5],["rhs_mag_m67",5]];
_Item = [];
_Backpack = [];
_AMMUNITION_MODULE = [false,"AMMUNITION Modul",30,[],_Magazin,[],[]];
 
//M3MAAWS_MODULE
_Weapon = [["tf47_m3maaws",1]];
_Magazin = [["tf47_m3maaws_heat",4],["tf47_m3maaws_he",2]];
_Item = [["tf47_optic_m3maaws",1]];
_Backpack = [];
_M3MAAWS_MODULE = [false,"M3 MAAWS Modul",30,_weapon,_magazin,_item,[]];

//AT4_MODULE
_Weapon = [["tf47_at4_heat",2]];
_Magazin = [];
_Item = [];
_Backpack = [];
_AT4_MODULE = [false,"AT4 Modul",20,_weapon,[],[],[]];
 
//COMMAND_MODULE
_Weapon = [["rhs_weap_M320",1]];
_Magazin = [["rhs_mag_an_m8hc",4],["rhs_mag_m67",4],["1Rnd_Smoke_Grenade_shell",2],["1Rnd_SmokeRed_Grenade_shell",2],["1Rnd_SmokeGreen_Grenade_shell",2],["1Rnd_SmokeBlue_Grenade_shell",2],["1Rnd_SmokeOrange_Grenade_shell",2],["1Rnd_SmokeYellow_Grenade_shell",2],["1Rnd_SmokePurple_Grenade_shell",2],["rhs_mag_m18_red",1],["rhs_mag_m18_green",1],["rhs_mag_m18_purple",1],["rhs_mag_m18_yellow",1]];
_Item = [["ACE_EarPlugs",5],["ACE_CableTie",5],["Binocular",1],["ACE_Vector",1]];
_Backpack= [["tf_rt1523g_big",1]];
_COMMAND_MODULE = [false,"COMMAND Modul",45,_Weapon,_Magazin,_Item,_Backpack];
 
//MEDICAL_MODULE
_Weapon = [];
_Magazin = [];
_Item = [["ACE_packingBandage",25],["ACE_elasticBandage",25],["ACE_quikclot",10],["ACE_tourniquet",4],["ACE_morphine",10],["ACE_epinephrine",10],["ACE_salineIV",10],["ACE_bloodIV",4]];
_Backapck = [];
_MEDICAL_MODULE = [false,"MEDICAL Modul",30,[],[],_Item,[]];
 
//UAV_MODULE
_Weapon = [];
_Magazin = [];
_Items = [["B_UavTerminal",1],["ACE_UAVBattery",2]];
_Backpack = [["B_UAV_01_backpack_F",1]];
_UAV_MODULE = [false,"UAV Modul",20,[],[],_Items,_Backpack];

//TOOLKIT_MODULE
_Weapon = [];
_Magazin = [];
_Items = [["ToolKit",1]];
_Backpack = [];
_TOOLKIT_MODULE = [false,"Toolkit Modul",10,[],[],_Items,[]];

// _AT = [true,"AT",30,[["tf47_m3maaws",2]],[["tf47_m3maaws_heat",8],["tf47_m3maaws_hedp",4],["tf47_m3maaws_he",4],["tf47_m3maaws_smoke",2]],[["tf47_m3maaws_optic", 2]],[]];
// _UAV = [false,"UAV Operator",15,[],[],[["B_UavTerminal",1]],[["B_UAV_01_backpack_F",1]]];



//A Array containing all Loadouts. You have to add all Loadouts which should be avaliable ingame
ZadeServicePoint_Loadouts = [_INFANTRY,_ANTITANK,_MEDICAL,_EOD,_AMMUNITION_MODULE,_AT4_MODULE,_M3MAAWS_MODULE,_COMMAND_MODULE,_MEDICAL_MODULE,_AA_MODULE,_UAV_MODULE,_TOOLKIT_MODULE];

//Dont change this one
if (true) exitWith {};