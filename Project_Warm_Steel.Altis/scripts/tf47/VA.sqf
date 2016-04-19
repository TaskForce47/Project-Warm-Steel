//Script by DerZade (feat. R.I.E.C.H.E.R | xDrake)
//Folgendes in die Kiste:
//this addAction ["<t color=""#11F22F"">" + "Arsenal","scripts\VA.sqf"];
private "_caller";
_caller = _this select 1;

[_this, [
//PISTOLS
	"hgun_Pistol_Signal_F",
	"hgun_P07_F",
	"hgun_Rook40_F",
	"Ej_beretta",
	"BWA3_P8",
	"BWA3_MP7",
	"hgun_Pistol_heavy_01_F",

//LAUNCHER
	"rhs_weap_M136",
	"rhs_weap_fim92",
	"launch_NLAW_F",
	"rhs_weap_fgm148",
	"CUP_launch_Mk153Mod0_SMAWOptics",
	"tf47_m3maaws",
	"BWA3_RGW90",

//PRIMARY
	"CUP_arifle_L86A2",
	"kio_l85a2",
	"kio_l85a2_pink",
	"kio_l85a2_ris_ng",
	"kio_l85a2_ris",
	"kio_l85a2_ugl",
	//RHS
	"rhs_weap_m14ebrri",
	"rhs_weap_XM2010",
	"rhs_weap_XM2010_wd",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_sa",
	"rhs_weap_M320",
	"rhs_weap_m16a4",
	"rhs_weap_m16a4_carryhandle",
	"rhs_weap_m16a4_bipod",
	"rhs_weap_m16a4_grip",
	"rhs_weap_m16a4_carryhandle_pmag",
	"rhs_weap_m249_pip",
	"rhs_weap_m240B",
	"rhs_weap_m4",
	"rhs_weap_m4_grip2",
	"rhs_weap_m4_bipod",
	"rhs_weap_m4_grip",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_pmag",
	"rhs_m4_m320",
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_grip2",
	"rhs_weap_m4a1_bipod",
	"rhs_weap_m4a1_grip",
	"rhs_m4a1_m320",
	"CUP_arifle_Mk16_CQC_FG",
	"CUP_arifle_Mk16_CQC_SFG",
	"CUP_arifle_Mk16_CQC_EGLM",
	"CUP_arifle_Mk16_SV",
	"CUP_arifle_Mk17_STD_FG",
	"CUP_arifle_Mk17_STD_SFG",
	"CUP_arifle_Mk17_STD",
	"CUP_arifle_Mk17_STD_EGLM",
	"hlc_lmg_M60E4",
	"hlc_rifle_bcmjack",
	"hlc_rifle_RU5562",
	"hlc_rifle_RU556",
	"hlc_rifle_M14",
	"hlc_rifle_m14dmr",
	"hlc_rifle_m14sopmod",
	"hlc_rifle_SAMR",
	"hlc_barrel_standard",
	"srifle_LRR_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20_GL_plain_F",
	"arifle_Mk20C_plain_F",
	"CUP_arifle_G36A",
	"CUP_arifle_G36K",
	"CUP_arifle_MG36_camo",
	"CUP_glaunch_M32",
	"CUP_arifle_G36C",
	"CUP_glaunch_M79",
	"CUP_glaunch_Mk13",
	"CUP_lmg_Mk48_des_Aim_Laser",
	"CUP_sgun_M1014",
	"CUP_srifle_AWM_des",
	"ej_iar30",
	"CUP_srifle_M110",
	"CUP_arifle_Mk20",
	"CUP_srifle_M24_des",
	"BWA3_G36",
	"BWA3_G36_LMG",
	"BWA3_G36_AG",
	"BWA3_G36K",
	"BWA3_G36K_AG",
	"BWA3_G27",
	"BWA3_G27_AG",
	"BWA3_G28_Standard",
	"BWA3_G28_Assault"

],true] call BIS_fnc_addVirtualWeaponCargo;
 

[_this, [
//LAUNCHER AMMO
	"mas_M136",
	"rhs_fim92_mag",
	"NLAW_F",
	"tf47_m3maaws_heat",
	"tf47_m3maaws_hedp",
	"tf47_m3maaws_he",

//PISTOL AMMO
	"9Rnd_45ACP_Mag",
	"11Rnd_45ACP_Mag",
	"16Rnd_9x21_Mag",
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F",

//RIFLE AMMO
	"rhsusf_5Rnd_300winmag_xm2010",
	"30Rnd_556x45_Stanag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"AGM_30Rnd_556x45_Stanag_Tracer_Dim",
	"AGM_30Rnd_556x45_Stanag_SD",
	"AGM_30Rnd_556x45_Stanag_AP",
	"20Rnd_762x51_Mag",
	"5Rnd_mas_127x99_Stanag",
	"5Rnd_mas_127x99_dem_Stanag",
	"5Rnd_mas_127x99_T_Stanag",
	"20Rnd_mas_762x51_Stanag",
	"20Rnd_mas_762x51_T_Stanag",
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"rhs_mag_30Rnd_556x45_Mk262_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"7Rnd_408_Mag",
	"rhsusf_100Rnd_762x51",
	"rhsusf_100Rnd_556x45_soft_pouch",
	"rhs_mag_M441_HE",
	"rhs_mag_M433_HEDP",
	"rhs_mag_m4009",
	"rhs_mag_m576",
	"hlc_100Rnd_762x51_B_M60E4",
	"hlc_100Rnd_762x51_M_M60E4",
	"hlc_100Rnd_762x51_T_M60E4",
	"hlc_20Rnd_762x51_B_M14",
	"hlc_20Rnd_762x51_T_M14",
	"hlc_20Rnd_762x51_S_M14",
	"BWA3_15Rnd_9x19_P8",
	"BWA3_40Rnd_46x30_MP7",
	"BWA3_40Rnd_46x30_MP7_SD",
	"BWA3_30Rnd_556x45_G36",
	"BWA3_30Rnd_556x45_G36_Tracer",
	"BWA3_30Rnd_556x45_G36_AP",
	"BWA3_20Rnd_762x51_G28",
	"BWA3_20Rnd_762x51_G28_Tracer",
	"BWA3_20Rnd_762x51_G28_AP",
	"BWA3_10Rnd_762x51_G28",
	"BWA3_10Rnd_762x51_G28_Tracer",
	"BWA3_10Rnd_762x51_G28_AP",
	"BWA3_10Rnd_762x51_G28_LR",
	"BWA3_RGW90_HH",
	
	"CUP_6Rnd_HE_M203",
	"CUP_6Rnd_FlareWhite_M203",
	"CUP_6Rnd_FlareGreen_M203",
	"CUP_6Rnd_FlareRed_M203",
	"CUP_6Rnd_FlareYellow_M203",
	"CUP_6Rnd_Smoke_M203",
	"CUP_6Rnd_SmokeRed_M203",
	"CUP_6Rnd_SmokeGreen_M203",
	"CUP_6Rnd_SmokeYellow_M203",
	"CUP_1Rnd_HE_M203",
	"CUP_1Rnd_HEDP_M203",
	"CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",
	"CUP_8Rnd_B_Beneli_74Slug",
	"CUP_SMAW_HEAA_M",
	"CUP_SMAW_HEDP_M",
	"CUP_20Rnd_762x51_B_SCAR",
	"CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR",


//ULG Ammo
	"1Rnd_SmokeOrange_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokePurple_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"UGL_FlareCIR_F",
	"UGL_FlareYellow_F",
	"UGL_FlareRed_F",
	"UGL_FlareGreen_F",
	"UGL_FlareWhite_F",
	"1Rnd_HE_Grenade_shell",

//Explosives 
	"rhs_mine_M19_mag",
	"rhs_mine_tm62m_mag",
	"rhs_mine_pmn2_mag",
	"IEDLandSmall_Remote_Mag",
	"IEDUrbanSmall_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"APERSTripMine_Wire_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"APERSBoundingMine_Range_Mag",
	"APERSMine_Range_Mag",
	"ATMine_Range_Mag",
	"SatchelCharge_Remote_Mag",
	"IEDUrbanBig_Remote_Mag",
	"IEDLandBig_Remote_Mag",
//GRENADES
	"HandGrenade",
	"MiniGrenade",
	"SmokeShell",
	"SmokeShellYellow",
	"SmokeShellRed",
	"SmokeShellGreen",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellOrange",
	"Chemlight_green",
	"Chemlight_red",
	"Chemlight_yellow",
	"Chemlight_blue",
	"B_IR_Grenade",
	"AGM_HandFlare_White",
	"AGM_HandFlare_Red",
	"AGM_HandFlare_Green",
	"AGM_HandFlare_Yellow",
	"AGM_M84",
	"BWA3_DM51A1",
	"BWA3_DM25",
	"BWA3_DM32_Orange",
	"BWA3_DM32_Yellow",

//LASER BATTERIES
	"Laserbatteries"
], true] call BIS_fnc_addVirtualMagazineCargo;



[_this, [
//BACKPACKS
	"clf_nicecomm2_coy",
	"clf_nicecomm2_multi",
	"rhsusf_assault_eagleaiii_ocp",
	"rhsusf_assault_eagleaiii_ucp",
	"B_UAV_01_backpack_F",
	"B_Parachute",
	"B_mas_AssaultPack_des",
	"B_FieldPack_cbr",
	"B_Kitbag_cbr",
	"B_TacticalPack_mcamo",
	"CUP_B_USPack_Coyote",
	"MEF_TAN_Assault",
	"B_Kitbag_mcamo"

], true] call BIS_fnc_addVirtualBackpackCargo;


[_this, [
//UNIFORM


	"BAF_Soldier_Base_R_D_Uniform_DG1",
	"BAF_Soldier_Base_L_D_Uniform_DG1",

	"BAF_Soldier_Base_L_M_Uniform_DG1",
	"BAF_Soldier_Base_R_M_Uniform_DG1",
	
	"BWA3_Uniform_Crew_Tropen",
	"BWA3_Uniform3_Tropen",
	"BWA3_Uniform_Tropen",
	"BWA3_Uniform_Ghillie_Tropen",

	"USAF_SFS_Pilot_Tan",

	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ucp",

	"MEF_Desert_MARPAT_LS",
	"MEF_Desert_MARPAT_RS",
	"MEF_Des_IN_MARPAT_RS",
	"MEF_Desert_MARPAT_TS",

//VESTS

	"BAF_Soldier_Crewman_Vest_D_DG1",
	"BAF_Soldier_Crewman_Vest_M_DG1",

	"BAF_Soldier_Light_Vest_D_DG1",
	"BAF_Soldier_Light_Vest_M_DG1",

	"BAF_Soldier_Medic_Vest_D_DG1",
	"BAF_Soldier_Medic_Vest_M_DG1",

	"BAF_Soldier_Officer_Vest_D_DG1",
	"BAF_Soldier_Officer_Vest_M_DG1",

	"BAF_Soldier_1_Vest_D_DG1",
	"BAF_Soldier_1_Vest_M_DG1",

	"BAF_Soldier_2_Vest_D_DG1",
	"BAF_Soldier_2_Vest_M_DG1",

	"BAF_Soldier_gl_Vest_D_DG1",
	"BAF_Soldier_gl_Vest_M_DG1",

	"BAF_Pilot_Vest_D_DG1",
	"BAF_Pilot_Vest_M_DG1",



	"V_USAF_Vest",

	"rhsusf_iotv_ucp",
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ucp_Teamleader",
	"rhsusf_iotv_ocp_Teamleader",
	"rhsusf_iotv_ocp_Squadleader",
	"rhsusf_iotv_ucp_Squadleader",
	"rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ucp_SAW",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ucp_Rifleman",
	"rhsusf_iotv_ocp_Repair",
	"rhsusf_iotv_ucp_Repair",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ucp_Medic",
	"rhsusf_iotv_ocp_Grenadier",
	
	"BWA3_Vest_Tropen",
	"BWA3_Vest_Grenadier_Tropen",
	"BWA3_Vest_Leader_Tropen",
	"BWA3_Vest_Marksman_Tropen",
	"BWA3_Vest_Autorifleman_Tropen",
	"BWA3_Vest_Medic_Tropen",
	"BWA3_Vest_Rifleman1_Tropen",

//HEADGEAR
	"tf47_beret",

	"BAF_Soldier_Crewman_Headgear_D_DG1",
	"BAF_Soldier_Crewman_Headgear_M_DG1",

	"BAF_Soldier_Engineer_Headgear_D_DG1",
	"BAF_Soldier_Engineer_Headgear_M_DG1",

	"BAF_Soldier_Officer_Headgear_DG1",
	"BAF_Pilot_Headgear_DG1",

	"BAF_Soldier_gl_Headgear_D_DG1",
	"BAF_Soldier_gl_Headgear_M_DG1",

	"BAF_Soldier_1_Headgear_D_DG1",
	"BAF_Soldier_1_Headgear_M_DG1",

	"BWA3_M92_Tropen",
	"BWA3_OpsCore_Tropen_Camera",
	
	"USAF_SFS_Pilot_H",

	"MEF_Desert_Helmet_MICH",
	"MEF_Boonie_Des",
	
	"BWA3_M92_Tropen",
	"BWA3_OpsCore_Tropen_Camera",

	"rhs_Booniehat_ucp",
	"rhs_Booniehat_ocp",
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ESS_ocp",
	"rhsusf_ach_helmet_headset_ess_ocp",
	"rhsusf_ach_helmet_camo_ocp",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_ach_helmet_ESS_ucp",
	"rhsusf_ach_helmet_headset_ucp",
	"rhsusf_ach_helmet_headset_ess_ucp",
	"rhsusf_ach_bare_tan",
	"rhsusf_ach_bare_tan_headset",
	"H_Cap_tan_specops_US",
	"H_Cap_usblack",
	"H_Cap_khaki_specops_UK",
	"JS_JC_FA18_PilotHelmet", //Jet Pilot Helmet
	"H_CrewHelmetHeli_B", //Heli Crew Helmet
	"rhsusf_cvc_ess", //RHS Crew-Helmet Desert Brille
	"rhsusf_cvc_helmet", //RHS Crew-Helmet Desert ohne Brille
	"rhsusf_cvc_green_helmet", //RHS Crew-Helmet Woodland Brille
	"rhsusf_cvc_green_ess",	//RHS Crew-Helmet Desert ohne Brille

	//RHS OPS Core Helemts
	"rhsusf_opscore_02",
	"rhsusf_opscore_01",
	"rhsusf_opscore_02_tan",
	"rhsusf_opscore_01_tan",
	"rhsusf_opscore_04_ocp",
	"rhsusf_opscore_03_ocp",

	//RHS Patrolcaps
	"rhsusf_patrolcap_ocp",
	"rhsusf_patrolcap_ucp",



//GOOGLES
	"L_Shemagh_Gry",
	"L_Shemagh_OD",
	"L_Shemagh_Tan",
	"LBG_Shemagh_Gry",
	"LBG_Shemagh_OD",
	"LBG_Shemagh_Tan",
	"LCG_Shemagh_Gry",
	"LCG_Shemagh_OD",
	"LCG_Shemagh_Tan",
	"Mask_M50",
	"Mask_M40_OD",
	"Mask_M40",
	"BWA3_G_Combat_Black",
	"BWA3_G_Combat_Clear",


	"G_Shades_Black",
	"rhs_scarf",
	"G_Combat",
	"G_Aviator",
	"rhs_balaclava",
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"G_Balaclava_oli",
	"G_Bandanna_aviator",
	"G_Bandanna_beast",
	"G_Bandanna_blk",
	"G_Bandanna_khk",
	"G_Bandanna_oli",
	"G_Bandanna_shades",
	"G_Bandanna_tan",
	"G_Balaclava_AutOliv",
	"G_Balaclava_AutTan",

//NVGs
	"rhsusf_ANPVS_15",
	"rhsusf_ANPVS_14",
	

//BINOCULARS
	"Binocular",
	"Laserdesignator",
	"AGM_Vector",
	"Rangefinder",

//MAP
	"ItemMap",

//GPSs
	"ItemGPS",
	"B_UavTerminal",
	"BWA3_ItemNaviPad",

//COPASS
	"ItemCompass",

//RADIOS
	"tf_rf7800str",
	"tf_anprc152",
	
//WATCHES
	"ItemWatch",
	"tf_microdagr",
	"AGM_Altimeter",

//AGM Stuff
	"MineDetector",
	"AGM_CableTie",
	"AGM_UAVBattery",
	"AGM_MapTools",
	"AGM_Bandage",
	"AGM_Morphine",
	"AGM_Epipen",
	"AGM_Bloodbag",
	"AGM_SpareBarrel",
	"AGM_ItemKestrel",
	"AGM_IR_Strobe_Item",
	"AGM_Clacker",
	"AGM_M26_Clacker",
	"AGM_DefusalKit",
	"AGM_DeadManSwitch",
	"AGM_EarBuds",
	

//ATACHMENTS Pistol
	"AGM_muzzle_mzls_smg_02",
	"muzzle_snds_L",
	"muzzle_snds_acp",
	"optic_MRD",
	"optic_Yorris",

//ATACHMENTS
	"kio_Elcan",
	"kio_Elcan_reflex",
	"CUP_muzzle_snds_M110",
	"CUP_optic_AN_PVS_10",
	"CUP_optic_LeupoldMk4_10x40_LRT_Desert",
	"CUP_optic_LeupoldMk4_MRT_tan",
	"CUP_muzzle_snds_SCAR_H",
	"CUP_acc_ANPEQ_15",
	"CUP_muzzle_mfsup_SCAR_H",
	"acc_pointer_IR",
	"acc_flashlight",
	"optic_SOS",
	"optic_Hamr",
	"optic_NVS",
	"optic_MRCO",
	"optic_Holosight",
	"optic_dms",
	"optic_Arco",
	"optic_Aco",
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",
	"optic_LRPS",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_compm4",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_anpeq15A",
	"AGM_muzzle_mzls_H",
	"muzzle_snds_M",
	"hlc_muzzle_snds_M14",
	"hlc_optic_PVS4M14",
	"hlc_optic_LRT_m14",
	"CUP_optic_CompM2_Black",
	"tf47_optic_m3maaws",
	"hlc_optic_artel_m14",
	"BWA3_optic_20x50_NSV",
	"BWA3_optic_20x50",
	"BWA3_optic_Shortdot",
	"BWA3_optic_Aimpoint",
	"BWA3_optic_ZO4x30_NSV",
	"BWA3_optic_ZO4x30",
	"BWA3_optic_RSAS",
	"BWA3_optic_NSA80",
	"BWA3_acc_LLM01_irlaser",
	"BWA3_acc_LLM01_flash",
	"BWA3_muzzle_snds_MP7",
	"CUP_optic_Eotech533",
	"CUP_acc_ANPEQ_15",
	"CUP_muzzle_snds_SCAR_L",
	"CUP_muzzle_snds_SCAR_H"

], true] call BIS_fnc_addVirtualItemCargo;
 
// show it
if (name _caller == name player) then {["Open", false] spawn BIS_fnc_arsenal;};
	sleep 1;
ctrlEnable [44150,false];
if (true) exitWith {};