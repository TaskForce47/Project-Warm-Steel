{
["Preload",[false, _x, nil, []]] spawn XLA_fnc_arsenal;

["AmmoboxInit",[_x, false]] call xla_fnc_arsenal;

[_x, [
//PISTOLS
	"rhs_weap_M320",
	"rhsusf_weap_m1911a1",
	"asdg_hgun_Pistol_heavy_01_F",
	"hlc_smg_mp5k",
	"hlc_smg_mp5k_PDW",
	"asdg_hgun_ACPC2_F",
	"hgun_Pistol_heavy_02_F",



//LAUNCHER
	"rhs_weap_fgm148",
	"rhs_weap_fim92",
	"tf47_at4_heat",
	"tf47_at4_HEDP",
	"tf47_at4_HP",
	"tf47_m3maaws",

//PRIMARY
	
	//RHS
	"rhs_weap_m14ebrri",
	"rhs_weap_m16a4",
	"rhs_weap_m16a4_carryhandle",
	"rhs_weap_m16a4_carryhandle_grip",
	"rhs_weap_m16a4_carryhandle_grip_pmag",
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_m16a4_carryhandle_pmag",
	"rhs_weap_m16a4_grip",
	"rhs_weap_m4",
	"rhs_weap_m4_grip2",
	"rhs_weap_m4_carryhandle",
	"rhs_weap_m4_carryhandle_pmag",
	"rhs_weap_m4_grip",
	"rhs_weap_m4_m203",
	"rhs_weap_m4_m203S",
	"rhs_weap_m4_m320",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_m4a1_carryhandle_grip2",
	"rhs_weap_m4a1_carryhandle_pmag",
	"rhs_weap_m4a1_carryhandle_grip",
	"rhs_weap_m4a1_carryhandle_m203",
	"rhs_weap_m4a1_carryhandle_m203S",
	"rhs_weap_m4a1_blockII",
	"rhs_weap_m4a1_blockII_grip2",
	"rhs_weap_m4a1_blockII_grip2_KAC",
	"rhs_weap_m4a1_blockII_KAC",
	"rhs_weap_m4a1_blockII_M203",
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_grip",
	"rhs_weap_m4a1_grip2",
	"rhs_weap_m4a1_m203",
	"rhs_weap_m4a1_m203s",
	"rhs_weap_m4a1_m320",
	"rhs_weap_M590_8RD",
	"rhs_weap_M590_5RD",
	"rhs_weap_mk18",
	"rhs_weap_mk18_grip2",
	"rhs_weap_mk18_grip2_KAC",
	"rhs_weap_mk18_KAC",
	"rhs_weap_mk18_m320",
	"rhs_weap_XM2010",
	"rhs_weap_XM2010_wd",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_sa",
	"rhs_weap_m240B",
	"rhs_weap_m249_pip",
	"rhs_weap_sr25",
	"rhs_weap_sr25_ec",
	//BIS
	"MMG_02_black_F",
	"MMG_02_camo_F",
	"MMG_02_sand_F",
	"srifle_DMR_06_olive_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20_GL_plain_F",
	"arifle_Mk20_plain_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"arifle_SDAR_F",
	"srifle_LRR_F",
	//HLC
	"hlc_rifle_auga3_GL_B",
	"hlc_rifle_auga3_GL_BL",
	"hlc_rifle_auga3_GL",
	"hlc_rifle_auga3_b",
	"hlc_rifle_auga3_bl",
	"hlc_rifle_auga3",
	"hlc_rifle_auga2",
	"hlc_rifle_auga2_t",
	"hlc_rifle_auga2lsw",
	"hlc_rifle_auga2lsw_t",
	"hlc_rifle_aug",
	"hlc_rifle_auga1_t",
	"hlc_rifle_osw_GL",
	"hlc_rifle_falosw",
	"hlc_rifle_vendimus",
	"hlc_rifle_Bushmaster300",
	"hlc_rifle_M4",
	"hlc_rifle_m4m203",
	"hlc_rifle_CQBR",
	"hlc_rifle_RU5562",
	"hlc_rifle_RU556",
	"hlc_rifle_Colt727",
	"hlc_rifle_Colt727_GL",
	"hlc_rifle_bcmjack",
	"hlc_rifle_samr2",
	"hlc_rifle_SAMR",
	"hlc_rifle_M14",
	"hlc_rifle_M14_Rail",
	"hlc_rifle_m14dmr",
	"hlc_rifle_m14sopmod",
	"hlc_lmg_M60E4",
	"hlc_rifle_STG58F",
	"hlc_rifle_g3a3ris",
	"hlc_rifle_g3ka4",
	"HLC_Rifle_g3ka4_GL",
	"hlc_smg_mp5a4",
	"hlc_smg_mp5a2",
	"hlc_smg_mp5sd5",
	"hlc_rifle_psg1",
	"hlc_smg_mp510",
	"hlc_smg_mp5sd6",
	"hlc_rifle_hk51",
	"hlc_rifle_hk53",
	//HLC 249
	"hlc_lmg_minimipara",
	"hlc_lmg_minimi",
	"hlc_lmg_minimi_railed",
	"hlc_lmg_m249para",
	"hlc_lmg_M249E2",
	"hlc_m249_pip1",
	"hlc_m249_pip2",
	"hlc_m249_pip3",
	"hlc_m249_pip4"


],false, true] call xla_fnc_addVirtualWeaponCargo;
 

[_x, [
//LAUNCHER AMMO

	"rhs_fgm148_magazine_AT",
	"rhs_fim92_mag",
	"tf47_m3maaws_HEAT",
	"tf47_m3maaws_HEDP",
	"tf47_m3maaws_HE",
	"tf47_m3maaws_SMOKE",
	"tf47_m3maaws_ILLUM",
	"Laserbatteries",

//PISTOL AMMO
	"rhsusf_mag_7x45acp_MHP",
	"11Rnd_45ACP_Mag",
	"6Rnd_45ACP_Cylinder",
	"9Rnd_45ACP_Mag",

//RIFLE AMMO
	//RHS
	"rhsusf_20Rnd_762x51_m118_special_Mag",
	"rhsusf_20Rnd_762x51_m993_Mag",
	"rhs_mag_30Rnd_556x45_Mk318_Stanag",
	"rhs_mag_30Rnd_556x45_Mk262_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag",
	"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
	"rhsusf_100Rnd_556x45_soft_pouch",
	"rhsusf_100Rnd_762x51",
	"rhsusf_8Rnd_00Buck",
	"rhsusf_5Rnd_00Buck",
	"rhsusf_5Rnd_300winmag_xm2010",
	//BIS
	"130Rnd_338_Mag",
	"30Rnd_556x45_Stanag_Tracer_Red",
	"30Rnd_556x45_Stanag",
	"20Rnd_762x51_Mag",
	"7Rnd_408_Mag",
	//HLC
	"hlc_30rnd_556x45_SOST",
	"hlc_30rnd_556x45_SPR",
	"hlc_30rnd_556x45_EPR",
	"hlc_30rnd_556x45_S",
	"hlc_20Rnd_762x51_B_M14",
	"hlc_20Rnd_762x51_barrier_M14",
	"hlc_20Rnd_762x51_mk316_M14",
	"hlc_20Rnd_762x51_T_M14",
	"hlc_20Rnd_762x51_S_M14",
	"hlc_50Rnd_762x51_B_M14",
	"hlc_20Rnd_762x51_B_fal",
	"hlc_20Rnd_762x51_mk316_fal",
	"hlc_20Rnd_762x51_barrier_fal",
	"hlc_20Rnd_762x51_T_fal",
	"hlc_20rnd_762x51_b_G3",
	"hlc_20rnd_762x51_Mk316_G3",
	"hlc_20rnd_762x51_barrier_G3",
	"hlc_20rnd_762x51_T_G3",
	"hlc_20rnd_762x51_S_G3",
	"hlc_100Rnd_762x51_B_M60E4",
	"hlc_100Rnd_762x51_M_M60E4",
	"hlc_100Rnd_762x51_Barrier_M60E4",
	"hlc_100Rnd_762x51_T_M60E4",
	"hlc_30Rnd_9x19_B_MP5",
	"hlc_30Rnd_9x19_GD_MP5",
	"hlc_30Rnd_9x19_SD_MP5",
	"hlc_30Rnd_10mm_B_MP5",
	"hlc_30Rnd_10mm_JHP_MP5",
	"hlc_40Rnd_556x45_B_AUG",
	"hlc_40Rnd_556x45_SOST_AUG",
	"hlc_40Rnd_556x45_SPR_AUG",
	"hlc_30Rnd_556x45_SOST_AUG",
	"hlc_30Rnd_556x45_SPR_AUG",
	"hlc_30Rnd_556x45_T_AUG",
	"29rnd_300BLK_STANAG",
	"29rnd_300BLK_STANAG_T",
	"hlc_30rnd_556x45_b_HK33",
	"hlc_30rnd_556x45_EPR_HK33",
	"hlc_30rnd_556x45_SOST_HK33",
	"hlc_200rnd_556x45_M_SAW",
	"hlc_200rnd_556x45_T_SAW",
	"hlc_200rnd_556x45_B_SAW",


//ULG Ammo

	"rhs_mag_M441_HE",
	"rhs_mag_M433_HEDP",
	"rhs_mag_m4009",
	"rhs_mag_m576",
	"rhs_mag_M585_white",
	"rhs_mag_m661_green",
	"rhs_mag_m662_red",
	"rhs_mag_m713_Red",
	"rhs_mag_m714_White",
	"rhs_mag_m715_Green",
	"rhs_mag_m716_yellow",
	"1Rnd_HE_Grenade_shell",

//Explosives 
	
	"SatchelCharge_Remote_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"APERSBoundingMine_Range_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"rhs_mine_M19_mag",

//GRENADES
	
	"ACE_M84",
	"ACE_HandFlare_Yellow",
	"ACE_HandFlare_Green",
	"ACE_HandFlare_Red",
	"ACE_HandFlare_White",
	"rhs_mag_m69",
	"rhs_mag_m67",
	"rhs_mag_mk3a2",
	"rhs_mag_m18_yellow",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_red",
	"rhs_mag_m18_green",
	"rhs_mag_m18_blue",
	"rhs_mag_m18_orange",
	"rhs_mag_an_m8hc",
	"rhs_mag_m7a3_cs",
	"rhs_mag_an_m14_th3",
	"Chemlight_blue",
	"Chemlight_red",
	"Chemlight_green",
	"Chemlight_yellow"

], false, true] call xla_fnc_addVirtualMagazineCargo;



[_x, [
//BACKPACKS

	"rhsusf_assault_eagleaiii_coy",
	"rhsusf_assault_eagleaiii_ocp",
	"rhsusf_assault_eagleaiii_ucp",
	"B_Kitbag_cbr",
	"B_Kitbag_rgr",
	"B_Kitbag_mcamo",
	"B_rhsusf_B_BACKPACK",
	"RHS_M2_Gun_Bag",
	"RHS_M2_Tripod_Bag",
	"RHS_Mk19_Gun_Bag",
	"RHS_Mk19_Tripod_Bag",
	"ACE_NonSteerableParachute",
	"B_Static_Designator_01_weapon_F",
	"tf_rt1523g_rhs",
	"tf_rt1523g_big_rhs",
	"B_Parachute",
	"B_Carryall_cbr",
	"B_Carryall_oli",
	"O_Mortar_01_support_F",
	"O_Mortar_01_weapon_F",
	"B_AssaultPack_cbr",
	"B_AssaultPack_rgr",
	"B_AssaultPack_mcamo"

], false, true] call xla_fnc_addVirtualBackpackCargo;


[_x, [
//UNIFORM

	"rhs_uniform_cu_ocp",
	"rhs_uniform_cu_ocp_101st",
	"rhs_uniform_cu_ocp_10th",
	"rhs_uniform_cu_ocp_1stcav",
	"rhs_uniform_cu_ocp_82nd",
	"rhs_uniform_cu_ucp",
	"rhs_uniform_cu_ucp_101st",
	"rhs_uniform_cu_ucp_10th",
	"rhs_uniform_cu_ucp_1stcav",
	"rhs_uniform_cu_ucp_82nd",

	"rhs_uniform_FROG01_m81",
	"rhs_uniform_FROG01_d",
	"rhs_uniform_FROG01_wd",

	"U_B_HeliPilotCoveralls",
	"U_B_PilotCoveralls",

	"U_B_CombatUniform_mcam",
	"U_B_CombatUniform_mcam_tshirt",
	"U_B_CombatUniform_mcam_vest",

	"U_I_FullGhillie_ard",
	"U_I_FullGhillie_sard",

	"U_B_HeliPilotCoveralls",


	//VESTS

	"rhsusf_spc",
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
	"V_TacVest_camo",
	"V_TacVest_khk",
	"V_I_G_resistanceLeader_F",
	"V_TacVestIR_blk",
	"LOP_V_CarrierRig_WDL",
	"LOP_V_CarrierLite_WDL",
	"LOP_V_CarrierRig_KHK",
	"LOP_V_CarrierLite_KHK",
	"V_PlateCarrier2_rgr",
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier1_blk",
	"V_Chestrig_khk",


	//HEADGEAR

	"tf47_beret",
	"rhs_Booniehat_marpatd",
	"rhs_Booniehat_ucp",
	"rhs_Booniehat_ocp",
	"rhsusf_ach_helmet_ocp",
	"rhsusf_ach_helmet_ESS_ocp",
	"rhsusf_ach_helmet_headset_ocp",
	"rhsusf_ach_helmet_headset_ess_ocp",
	"rhsusf_ach_helmet_camo_ocp",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_ach_helmet_ESS_ucp",
	"rhsusf_ach_helmet_headset_ucp",
	"rhsusf_ach_helmet_headset_ess_ucp",
	"H_HelmetSpecB_paint2",
	"H_HelmetSpecB_paint1",
	"H_HelmetSpecB_blk",
	"H_HelmetSpecB",

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

	"rhsusf_cvc_green_helmet",
	"rhsusf_cvc_green_ess",
	"rhsusf_cvc_helmet",
	"rhsusf_cvc_ess",

	//BIS HELMETS
	"H_HelmetB_light_sand",
	"H_CrewHelmetHeli_B",
	"H_PilotHelmetHeli_B",

	//MICH2000
	"rhsusf_mich_bare_alt",
	"rhsusf_mich_bare_norotos_headset",
	"rhsusf_mich_bare_norotos",
	"rhsusf_mich_bare_norotos_alt_headset",
	"rhsusf_mich_bare_norotos_alt_semi_headset",
	"rhsusf_mich_bare_semi",
	"rhsusf_mich_bare_semi_headset",
	"rhsusf_mich_bare_tan_headset",
	"rhsusf_mich_bare_tan",
	"rhsusf_mich_bare_alt_tan",
	"rhsusf_mich_bare_norotos_alt_tan",
	"rhsusf_mich_helmet_marpatd",
	"rhsusf_mich_helmet_marpatd_alt_headset",
	"rhsusf_mich_helmet_marpatd_alt",
	"rhsusf_mich_helmet_marpatd_norotos_arc",
	"rhsusf_mich_helmet_marpatwd",
	"rhsusf_mich_helmet_marpatwd_alt_headset",
	"rhsusf_mich_helmet_marpatwd_alt",
	"rhsusf_mich_helmet_marpatwd_norotos_headset",
	"rhsusf_mich_helmet_marpatwd_norotos",

	"RHS_jetpilot_usaf",

//GOOGLES
	
	"rhs_googles_black",
	"rhs_googles_clear",
	"rhs_googles_orange",
	"rhs_googles_yellow",
	"rhs_scarf",
	"G_Combat",
	"G_Bandanna_khk",
	"G_Bandanna_oli",

//NVGs
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",
	"NVGoggles_INDEP",
	"ACE_NVG_Wide",
	"ACE_NVG_Gen1",

//BINOCULARS
	"Binocular",
	"Laserdesignator",
	"lerca_1200_black",
	"lerca_1200_tan",
	"Rangefinder",
	"ACE_Vector",

//MAP
	"ItemMap",

//GPSs
	"ItemGPS",

//COPASS
	"ItemCompass",

//RADIOS
	"tf_rf7800str",
	"tf_anprc152",
	
//WATCHES
	"ItemWatch",
	"tf_microdagr",

//ACE Medic

	"ACE_fieldDressing",
	"ACE_packingBandage",
	"ACE_elasticBandage",
	"ACE_tourniquet",
	"ACE_morphine",
	"ACE_atropine",
	"ACE_epinephrine",
	"ACE_plasmaIV",
	"ACE_plasmaIV_500",
	"ACE_plasmaIV_250",
	"ACE_bloodIV",
	"ACE_bloodIV_500",
	"ACE_bloodIV_250",
	"ACE_salineIV",
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	"ACE_quikclot",
	"ACE_personalAidKit",
	"ACE_surgicalKit",
	"ACE_bodyBag",

//ACE Equipment

	"ACE_Kestrel4500",
	"ACE_EarPlugs",
	"ACE_DefusalKit",
	"ACE_M26_Clacker",
	"ACE_Clacker",
	"ACE_CableTie",
	"ACE_IR_Strobe_Item",
	"ACE_ATragMX",
	"ACE_SpareBarrel",
	"ACE_microDAGR",
	"ACE_MapTools",
	"ACE_UAVBattery",
	"ACE_RangeTable_82mm",

	"ToolKit",
	
	//ATTACHMENTS
	"tf47_optic_m3maaws",

	//RHS

	//SCOPE
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_compm4",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_ACOG3",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG_pip",
	"rhsusf_acc_ACOG",
	"rhsusf_acc_ELCAN_pip",
	"rhsusf_acc_ELCAN",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_ACOG3_USMC",
	"rhsusf_acc_ACOG2_USMC",
	"rhsusf_acc_SR25S",
	"ACE_optic_Arco_PIP",
	"ACE_optic_SOS_PIP",
	"ACE_optic_Hamr_PIP",


	//Laser/Light
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15",
	"rhsusf_acc_anpeq15_light",
	"rhsusf_acc_anpeq15A",

	//muzzel
	"rhsusf_acc_SFMB556",
	"rhsusf_acc_SF3P556",
	//BIPOD
	"rhsusf_acc_harris_bipod",

	//BIS
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	"bipod_01_F_snd",
	"optic_ACO_grn",
	"optic_Aco",
	"optic_AMS_snd",
	"optic_AMS_khk",
	"optic_AMS",
	"optic_KHS_blk",
	"optic_KHS_tan",
	"optic_MRCO",
	"ACE_optic_MRCO_2D",
	"optic_Hamr",
	"optic_DMS",
	"optic_ARCO",
	"optic_Holosight",


	//HLC
	"hlc_optic_LRT_m14",
	"hlc_optic_artel_m14",
	"hlc_optic_PVS4M14"

	
], false, true] call xla_fnc_addVirtualItemCargo;

} forEach [arsenal1, arsenal2, arsenal3]; //Insert Weapon Box name right here!