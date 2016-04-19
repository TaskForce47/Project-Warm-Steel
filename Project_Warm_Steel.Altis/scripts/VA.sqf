#define NO_SIDE -1
#define EAST_SIDE 0
#define WEST_SIDE 1
#define INDEP_SIDE 2
#define CIV_SIDE 3
#define NEUTRAL_SIDE 4
#define ENEMY_SIDE 5
#define FRIENDLY_SIDE 6
#define LOGIC_SIDE 7

//if (isServer) then {
{

	// Grab the parameter that was passed in. 
	// The box should have "this execVM <scriptname>" in it's init field.
	//_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_box = _x;
	// Check if @XLA_FixedArsenal is loaded

		[_box, [

			//PISTOLS
			"rhsusf_weap_m1911a1",
			"rhs_weap_M320",
			"hgun_Pistol_heavy_01_F",
			"UK3CB_BAF_L131A1",
			"rhsusf_weap_m9",
			"rhsusf_weap_glock17g4",
			
			//LAUNCHER
			"rhs_weap_fim92",
			"tf47_m3maaws",
			"tf47_optic_m3maaws",
			"tf47_at4_heat",
			"tf47_at4_HEDP",
			"tf47_at4_HP",
			"tf47_smaw",
			"tf47_smaw_green",
			"tf47_optic_smaw",
			"tf47_smaw_optic",
			"tf47_optic_smaw",
			"tf47_smaw_optic",
			"tf47_optic_smaw",
			"tf47_smaw_optic",
			
			"UK3CB_BAF_L16",
			"UK3CB_BAF_Javelin_Slung_Tube",

			"UK3CB_BAF_L111A1",
			"UK3CB_BAF_L134A1",
			"UK3CB_BAF_L134A1",
			"UK3CB_BAF_L16_Tripod",
			"UK3CB_BAF_Tripod",

			"UK3CB_BAF_NLAW_Launcher",

			//PRIMARY

			"rhs_weap_m4a1_blockII",
			"rhs_weap_m4a1_blockII_KAC",
			"rhs_weap_m4a1_blockII_grip2",
			"rhs_weap_m4a1_blockII_grip2_KAC",
			"rhs_weap_m4a1_blockII_M203",
			"rhs_weap_mk18",
			"rhs_weap_mk18_KAC",
			"rhs_weap_mk18_grip2", 
			"rhs_weap_mk18_grip2_KAC",
			"rhs_weap_mk18_m320",
			
			"rhs_weap_sr25_ec",
			"rhs_weap_m14ebrri",
			"rhs_weap_m16a4",
			"rhs_weap_m16a4_grip",
			"rhs_weap_m16a4_carryhandle",
			"rhs_weap_m16a4_carryhandle_grip",
			"rhs_weap_m16a4_carryhandle_grip_pmag",
			"rhs_weap_m16a4_carryhandle_M203",
			"rhs_weap_m16a4_carryhandle_pmag",
			"rhs_weap_XM2010",
			"rhs_weap_XM2010_wd",
			"rhs_weap_XM2010_wd",
			"rhs_weap_XM2010_d",
			"rhs_weap_m240B",
			"rhs_weap_m240B_CAP",
			"rhs_weap_m240G",
			"rhs_weap_m249_pip_L",
			"rhs_weap_m249_pip_L_para",
			"rhs_weap_m249_pip_L_vfg",
			"rhs_weap_m249_pip_S",
			"rhs_weap_m249_pip_S_para",
			"rhs_weap_m249_pip_S_vfg",
			"rhs_weap_m4",
			"rhs_weap_m4_grip2",
			"rhs_weap_m4_grip",
			"rhs_weap_m4_carryhandle",
			"rhs_weap_m4_carryhandle_pmag",
			"rhs_weap_m4_m203",
			"rhs_weap_m4_m320",
			"rhs_weap_m4a1_carryhandle",
			"rhs_weap_m4a1_carryhandle_grip2",
			"rhs_weap_m4a1_carryhandle_grip",
			"rhs_weap_m4a1_carryhandle_pmag",
			"rhs_weap_m4a1_carryhandle_m203",
			"rhs_weap_m4a1",
			"rhs_weap_m4a1_grip2",
			"rhs_weap_m4a1_grip",
			"rhs_weap_m4a1_m203",
			"rhs_weap_m4a1_m320",
			"rhs_weap_m27iar",
			"arifle_SDAR_F",
			"SMG_01_F",
			
			"UK3CB_BAF_L110A2",
  			"UK3CB_BAF_L110A2_FIST",
  			"UK3CB_BAF_L115A3_Desert",
  			"UK3CB_BAF_L115A3_Desert_Ghillie",
  			"UK3CB_BAF_L115A3",
  			"UK3CB_BAF_L115A3_Ghillie",
  			"UK3CB_BAF_L128A1",
  			"UK3CB_BAF_L129A1_Grippod",
  			"UK3CB_BAF_L129A1_FGrip",
  			"UK3CB_BAF_L129A1_AFG",
  			"UK3CB_BAF_L129A1",
  			"UK3CB_BAF_L7A2_FIST",
  			"UK3CB_BAF_L7A2",
  			"UK3CB_BAF_L82A1",
  			"UK3CB_BAF_L85A2",
  			"UK3CB_BAF_L85A2_RIS_AFG",
  			"UK3CB_BAF_L85A2_EMAG",
  			"UK3CB_BAF_L85A2_RIS",
  			"UK3CB_BAF_L85A2_UGL",
  			"UK3CB_BAF_L85A2_UGL_HWS",
  			"UK3CB_BAF_L86A3",
  			"UK3CB_BAF_L86A2",
  			"UK3CB_BAF_L92A1",
  			"UK3CB_BAF_L91A1"


		],false, true] call xla_fnc_addVirtualWeaponCargo;
		
		[_box, [
		
			// Mortar
			"ACE_1Rnd_82mm_Mo_HE",
			"ACE_1Rnd_82mm_Mo_Smoke",
			"ACE_1Rnd_82mm_Mo_Illum",
			"ACE_1Rnd_82mm_Mo_HE_Guided",
			"ACE_1Rnd_82mm_Mo_HE_LaserGuided",
		
		
			//LAUNCHER AMMO
			"rhs_fim92_mag",
			"tf47_m3maaws_HEAT",
			"tf47_m3maaws_HEDP",
			"tf47_m3maaws_HE",
			"tf47_m3maaws_SMOKE",
			"tf47_m3maaws_ILLUM",
			// "tf47_at4_m_HEAT",
			// "tf47_at4_m_HEDP",
			// "tf47_at4_m_HP",
			"tf47​​_smaw_heaa",
			"tf47_smaw_hedp",
			"tf47_smaw_sr​",
			"tf47_smaw_sr​_",
			"tf47_smaw_HEAA",
			"tf47_smaw_HEDP",
			"tf47_smaw_SR",
			"UK3CB_BAF_1Rnd_81mm_Mo_Flare_white",
			"UK3CB_BAF_1Rnd_81mm_Mo_Smoke_white",
			"UK3CB_BAF_1Rnd_81mm_Mo_shells",
			
			"UK3CB_BAF_32Rnd_40mm_G_Box",
			"UK3CB_BAF_32Rnd_40mm_G_Box",
			"UK3CB_BAF_100Rnd_127x99_Box",
				
			//PISTOL AMMO
			"rhsusf_mag_7x45acp_MHP",
			"11Rnd_45ACP_Mag",
			"UK3CB_BAF_17Rnd_9mm",
			"rhsusf_mag_15Rnd_9x19_FMJ",
			"rhsusf_mag_15Rnd_9x19_JHP",
			"rhsusf_mag_17Rnd_9x19_JHP",
			"rhsusf_mag_17Rnd_9x19_FMJ",

			//RIFLE AMMO
			"rhsusf_20Rnd_762x51_m118_special_Mag",
			"rhsusf_20Rnd_762x51_m993_Mag",
			"rhs_mag_30Rnd_556x45_Mk318_Stanag",
			"rhs_mag_30Rnd_556x45_Mk262_Stanag",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
			"rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Yellow",
			"rhs_mag_30Rnd_556x45_M200_Stanag",
			"rhsusf_5Rnd_300winmag_xm2010",
			"rhsusf_50Rnd_762x51",
			"rhsusf_50Rnd_762x51_m993",
			"rhsusf_50Rnd_762x51_m80a1epr",
			"rhsusf_100Rnd_762x51",
			"rhsusf_100Rnd_762x51_m993",
			"rhsusf_100Rnd_762x51_m80a1epr",
			"rhsusf_200Rnd_556x45_soft_pouch",
			"rhsusf_100Rnd_556x45_M200_soft_pouch",
			"rhsusf_100Rnd_556x45_soft_pouch",
			"rhs_200rnd_556x45_T_SAW",
			"rhs_200rnd_556x45_B_SAW",
			"rhs_200rnd_556x45_M_SAW",
			"rhsusf_8Rnd_00Buck",
			"rhsusf_8Rnd_doomsday_Buck",
			"rhsusf_8Rnd_Slug",
			"rhsusf_8Rnd_HE",
			"rhsusf_8Rnd_FRAG",
			"rhs_weap_M590_8RD",
			"rhs_weap_M590_5RD",
			"30Rnd_45ACP_Mag_SMG_01",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
			"20Rnd_556x45_UW_mag",
			"30Rnd_556x45_Stanag",
			"30Rnd_9x21_Mag", 
			
			"UK3CB_BAF_150Rnd_762x51_Box",
			
			"30Rnd_45ACP_Mag_SMG_01",
			
			"UK3CB_BAF_100Rnd",
			"UK3CB_BAF_100Rnd_T",
			"UK3CB_BAF_200Rnd",
			"UK3CB_BAF_200Rnd_T",
			"UK3CB_BAF_L115A3_Mag",
			"UK3CB_BAF_L128A1_Slugs",
			"UK3CB_BAF_L128A1_Pellets",
			"UK3CB_BAF_20Rnd",
			"UK3CB_BAF_20Rnd_T",
			"UK3CB_BAF_75Rnd",
			"UK3CB_BAF_75Rnd_T",
			"UK3CB_BAF_10Rnd_127x99mm",
			"UK3CB_BAF_10Rnd_127x99mm_SLAP",
			"5Rnd_127x108_Mag",
			"5Rnd_127x108_APDS_Mag",
			"UK3CB_BAF_30Rnd",
			"UK3CB_BAF_30Rnd_T",
			"UK3CB_BAF_30Rnd_9mm",

					

			//ULG Ammo
			"rhs_mag_M441_HE",
			"rhs_mag_M433_HEDP",
			"rhs_mag_m4009",
			"rhs_mag_m576",
			"UGL_FlareCIR_F",
			"UGL_FlareWhite_F",
			"UGL_FlareGreen_F",
			"UGL_FlareRed_F",
			"UGL_FlareYellow_F",
			"1Rnd_Smoke_Grenade_shell",
			"1Rnd_SmokeRed_Grenade_shell",
			"1Rnd_SmokeGreen_Grenade_shell",
			"1Rnd_SmokeYellow_Grenade_shell",
			"1Rnd_SmokePurple_Grenade_shell",
			"1Rnd_SmokeBlue_Grenade_shell",
			"1Rnd_SmokeOrange_Grenade_shell",

			 "UK3CB_BAF_1Rnd_HEDP_Grenade_shell",
			"1Rnd_HE_Grenade_shell",

			"ACE_HuntIR_M203",

			//Explosives 
			"SatchelCharge_Remote_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"DemoCharge_Remote_Mag",

			//GRENADES
			"rhs_mag_m67",
			"ACE_M84",
			"rhs_mag_an_m14_th3",
			"rhs_mag_m7a3_cs",
			"rhs_mag_an_m8hc",
			"rhs_mag_m18_green",
			"rhs_mag_m18_red",
			"rhs_mag_m18_purple",
			"rhs_mag_m18_yellow",
			"rhs_mag_mk3a2",
			"ACE_HandFlare_White",
			"ACE_HandFlare_Red",
			"ACE_HandFlare_Green",
			"ACE_HandFlare_Yellow",
			"rhs_mag_m69",
			"Chemlight_green",
			"Chemlight_red",
			"Chemlight_yellow",
			"Chemlight_blue",
			"B_IR_Grenade",


			//LASER BATTERIES
			"Laserbatteries"

		], false, true] call xla_fnc_addVirtualMagazineCargo;
		
		[_box, [

			//BACKPACKS
			"B_AssaultPack_cbr",
			"B_AssaultPack_rgr",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_blk",
			"B_UAV_01_backpack_F",
			"rhsusf_assault_eagleaiii_coy",
			"rhsusf_assault_eagleaiii_ocp",
			"rhsusf_assault_eagleaiii_ucp",
			"B_Static_Designator_01_weapon_F",
			"RHS_M2_Gun_Bag",
			"RHS_M2_Tripod_Bag",
			"RHS_M2_MiniTripod_Bag",
			"RHS_Mk19_Gun_Bag",
			"RHS_Mk19_Tripod_Bag",
			"tf_rt1523g_big_rhs",
			"tf_rt1523g_rhs",
			"B_Kitbag_cbr",
			"B_Kitbag_cbr",
			"B_Kitbag_rgr",
			"B_Kitbag_mcamo",
			"B_Parachute",
			"ACE_TacticalLadder_Pack",
			"ACE_NonSteerableParachute",
			
			"B_Mortar_01_support_F",
			"B_Mortar_01_weapon_F",
			
			"UK3CB_BAF_B_Bergen_MTP_Engineer_H_A",
			"UK3CB_BAF_B_Bergen_MTP_Engineer_L_A",

			"UK3CB_BAF_B_Bergen_MTP_JTAC_H_A",
			"UK3CB_BAF_B_Bergen_MTP_JTAC_L_A",

			"UK3CB_BAF_B_Bergen_MTP_Medic_H_A",
			"UK3CB_BAF_B_Bergen_MTP_Medic_H_B",
			"UK3CB_BAF_B_Bergen_MTP_Medic_L_A",
			"UK3CB_BAF_B_Bergen_MTP_Medic_L_B",

			"UK3CB_BAF_B_Bergen_MTP_PointMan_H_A",
			"UK3CB_BAF_B_Bergen_MTP_PointMan_L_A",

			"UK3CB_BAF_B_Bergen_MTP_Radio_H_A",
			"UK3CB_BAF_B_Bergen_MTP_Radio_H_B",
			"UK3CB_BAF_B_Bergen_MTP_Radio_L_A",
			"UK3CB_BAF_B_Bergen_MTP_Radio_L_B",

			"UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A",
			"UK3CB_BAF_B_Bergen_MTP_Rifleman_H_B",
			"UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C",
			"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_A",
			"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_B",
			"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C",
			"UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D",

			"UK3CB_BAF_B_Bergen_MTP_Sapper_H_A",
			"UK3CB_BAF_B_Bergen_MTP_Sapper_L_A"

		], false, true] call xla_fnc_addVirtualBackpackCargo;


		[_box, [
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
			"U_B_GhillieSuit",
			"U_B_Wetsuit",
			"U_B_FullGhillie_lsh",
			"U_B_FullGhillie_sard",
			"U_B_FullGhillie_ard",
			"U_B_PilotCoveralls",
			"U_B_HeliPilotCoveralls",

			"UK3CB_BAF_U_CombatUniform_MTP_TShirt",
			"UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve",
			"UK3CB_BAF_U_CombatUniform_MTP",
			"UK3CB_BAF_U_CombatUniform_MTP_RM",
			"UK3CB_BAF_U_CombatUniform_MTP_TShirt_RM",
			"UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM",
			"UK3CB_BAF_U_CrewmanCoveralls_RTR",
			"UK3CB_BAF_U_HeliPilotCoveralls_RAF",
			"UK3CB_BAF_U_HeliPilotCoveralls_RN",

			//VESTS
			"rhsusf_spc",
			"rhsusf_spc_rifleman",
			"rhsusf_spc_iar",
			"rhsusf_spc_corpsman",
			"rhsusf_spc_crewman",
			"rhsusf_spc_light",
			"rhsusf_spc_marksman",
			"rhsusf_spc_mg",
			"rhsusf_spc_squadleader",
			"rhsusf_spc_teamleader",
			"rhsusf_iotv_ocp_Grenadier",
			"rhsusf_iotv_ocp_Medic",
			"rhsusf_iotv_ocp",
			"rhsusf_iotv_ocp_Repair",
			"rhsusf_iotv_ocp_Rifleman",
			"rhsusf_iotv_ocp_SAW",
			"rhsusf_iotv_ocp_Squadleader",
			"rhsusf_iotv_ocp_Teamleader",
			"rhsusf_iotv_ucp_Grenadier",
			"rhsusf_iotv_ucp_Medic",
			"rhsusf_iotv_ucp_Repair",
			"rhsusf_iotv_ucp_Repair",
			"rhsusf_iotv_ucp_SAW",
			"rhsusf_iotv_ucp_SAW",
			"rhsusf_iotv_ucp_Teamleader",
			"rhsusf_iotv_ucp",
			"V_Chestrig_khk",
			"V_Chestrig_rgr",
			"V_Rangemaster_belt",
			"V_RebreatherB",
			"V_TacVestIR_blk",
			
			
			"UK3CB_BAF_V_Osprey",
			"UK3CB_BAF_V_Osprey_Belt_A",

			"UK3CB_BAF_V_Osprey_Grenadier_A",
			"UK3CB_BAF_V_Osprey_Grenadier_B",

			"UK3CB_BAF_V_Osprey_Holster",

			"UK3CB_BAF_V_Osprey_Marksman_A",

			"UK3CB_BAF_V_Osprey_Medic_A",
			"UK3CB_BAF_V_Osprey_Medic_B",
			"UK3CB_BAF_V_Osprey_Medic_C",
			"UK3CB_BAF_V_Osprey_Medic_D",

			"UK3CB_BAF_V_Osprey_MG_A",
			"UK3CB_BAF_V_Osprey_MG_B",

			"UK3CB_BAF_V_Osprey_Rifleman_A",
			"UK3CB_BAF_V_Osprey_Rifleman_B",
			"UK3CB_BAF_V_Osprey_Rifleman_C",
			"UK3CB_BAF_V_Osprey_Rifleman_D",
			"UK3CB_BAF_V_Osprey_Rifleman_E",
			"UK3CB_BAF_V_Osprey_Rifleman_F",

			"UK3CB_BAF_V_Osprey_SL_A",
			"UK3CB_BAF_V_Osprey_SL_B",
			"UK3CB_BAF_V_Osprey_SL_C",
			"UK3CB_BAF_V_Osprey_SL_D",

			"UK3CB_BAF_V_Pilot_A",
			
			"lbt_comms_coy",
			"lbt_medical_coy",
			"lbt_operator_coy",
			"lbt_pouchless_coy",
			"lbt_tl_coy",
			"lbt_weapons_coy",

			"lbt_comms_od",
			"lbt_medical_od",
			"lbt_operator_od",
			"lbt_pouchless_od",
			"lbt_tl_od",
			"lbt_weapons_od",

			"lbt_comms_aor2",
			"lbt_medical_aor2",
			"lbt_operator_aor2",
			"lbt_pouchless_aor2",
			"lbt_tl_aor2",
			"lbt_weapons_aor2",

			"lbt_comms_aor1",
			"lbt_medical_aor1",
			"lbt_operator_aor1",
			"lbt_pouchless_aor1",
			"lbt_tl_aor1",
			"lbt_weapons_aor1",

			"JPC_RG",
			"JPC_MC_5",
			"JPC_MC_4",
			"JPC_MC_3",
			"JPC_MC_2",
			"JPC_MC_1",
			"JPC_MC",
			"JPC_CB",

			"rhsusf_opscore_bk",
			"rhsusf_opscore_coy_cover",
			"rhsusf_opscore_coy_cover_pelt",
			"rhsusf_opscore_fg",
			"rhsusf_opscore_mc_cover",
			"rhsusf_opscore_mc_cover_pelt",
			"rhsusf_opscore_rg_cover",
			"rhsusf_opscore_rg_cover_pelt",
			"rhsusf_opscore_ut",

			//HEADGEAR
			"rhsusf_ach_helmet_M81",
			"rhsusf_ach_helmet_ocp",
			"rhsusf_ach_helmet_ESS_ocp",
			"rhsusf_ach_helmet_headset_ocp",
			"rhsusf_ach_helmet_headset_ess_ocp",
			"rhsusf_ach_helmet_camo_ocp",
			"rhsusf_ach_helmet_ucp",
			"rhsusf_ach_helmet_ESS_ucp",
			"rhsusf_ach_helmet_headset_ucp",
			"rhsusf_ach_helmet_headset_ess_ucp",
			"rhsusf_cvc_green_helmet",
			"rhsusf_cvc_green_ess",
			"rhsusf_cvc_helmet",
			"rhsusf_cvc_ess",
			"rhs_Booniehat_m81",
			"rhs_Booniehat_marpatd",
			"rhs_Booniehat_marpatwd",
			"rhs_Booniehat_ocp",
			"rhs_Booniehat_ucp",
			"rhsusf_Bowman",
			"rhsusf_bowman_cap",
			"H_CrewHelmetHeli_B",
			"H_PilotHelmetHeli_B",
			"rhsusf_lwh_helmet_marpatd",
			"rhsusf_lwh_helmet_marpatwd",
			"rhsusf_mich_bare_norotos",
			"rhsusf_mich_bare_norotos_arc",
			"rhsusf_mich_bare_norotos_tan",
			"rhsusf_mich_bare_norotos_arc_tan",
			"rhsusf_mich_helmet_marpatd",
			"rhsusf_mich_helmet_marpatd_alt",
			"rhsusf_mich_helmet_marpatd_norotos",
			"rhsusf_mich_helmet_marpatd_norotos_arc",
			"rhsusf_mich_helmet_marpatwd",
			"rhsusf_mich_helmet_marpatwd_alt",
			"rhsusf_mich_helmet_marpatwd_norotos",
			"rhsusf_mich_helmet_marpatwd_norotos_arc",
			"rhsusf_opscore_02",
			"rhsusf_opscore_01",
			"rhsusf_opscore_02_tan",
			"rhsusf_opscore_01_tan",
			"rhsusf_opscore_04_ocp",
			"rhsusf_opscore_03_ocp",
			"rhsusf_patrolcap_ocp",
			"rhsusf_patrolcap_ucp",
			"H_PilotHelmetFighter_B",
			"tf47_beret",

			"UK3CB_BAF_B_Bergen_MTP_SL_H_A",
  			"UK3CB_BAF_B_Bergen_MTP_SL_L_A",
			
  			"UK3CB_BAF_H_CrewHelmet_A",
  			"UK3CB_BAF_H_CrewHelmet_ESS_A",
			
  			"UK3CB_BAF_H_Headset_PRR",
			
  			"UK3CB_BAF_H_PilotHelmetHeli_A",
			
  			"UK3CB_BAF_H_Mk7_Camo_A",
  			"UK3CB_BAF_H_Mk7_Camo_B",
  			"UK3CB_BAF_H_Mk7_Camo_C",
  			"UK3CB_BAF_H_Mk7_Camo_D",
  			"UK3CB_BAF_H_Mk7_Camo_E",
  			"UK3CB_BAF_H_Mk7_Camo_F",
			
  			"UK3CB_BAF_H_Mk7_Camo_ESS_A",
  			"UK3CB_BAF_H_Mk7_Camo_ESS_B",
  			"UK3CB_BAF_H_Mk7_Camo_ESS_C",
  			"UK3CB_BAF_H_Mk7_Camo_ESS_D",
			
  			"UK3CB_BAF_H_Mk7_Camo_CESS_A",
  			"UK3CB_BAF_H_Mk7_Camo_CESS_B",
  			"UK3CB_BAF_H_Mk7_Camo_CESS_C",
  			"UK3CB_BAF_H_Mk7_Camo_CESS_D",
			
  			"UK3CB_BAF_H_Mk7_Net_A",
  			"UK3CB_BAF_H_Mk7_Net_B",
  			"UK3CB_BAF_H_Mk7_Net_C",
  			"UK3CB_BAF_H_Mk7_Net_D",
			
  			"UK3CB_BAF_H_Mk7_Net_ESS_A",
  			"UK3CB_BAF_H_Mk7_Net_ESS_B",
  			"UK3CB_BAF_H_Mk7_Net_ESS_C",
  			"UK3CB_BAF_H_Mk7_Net_ESS_D",
			
  			"UK3CB_BAF_H_Mk7_Net_CESS_A",
  			"UK3CB_BAF_H_Mk7_Net_CESS_B",
  			"UK3CB_BAF_H_Mk7_Net_CESS_C",
  			"UK3CB_BAF_H_Mk7_Net_CESS_D",
			
  			"UK3CB_BAF_H_Mk7_Scrim_A",
  			"UK3CB_BAF_H_Mk7_Scrim_B",
  			"UK3CB_BAF_H_Mk7_Scrim_C",
  			"UK3CB_BAF_H_Mk7_Scrim_D",
  			"UK3CB_BAF_H_Mk7_Scrim_E",
  			"UK3CB_BAF_H_Mk7_Scrim_F",
			
  			"UK3CB_BAF_H_Mk7_Scrim_ESS_A",
  			"UK3CB_BAF_H_Mk7_Scrim_ESS_B",
  			"UK3CB_BAF_H_Mk7_Scrim_ESS_C",

				//GOOGLES
			"rhs_googles_orange",
			"rhs_googles_yellow",
			"rhs_googles_clear",
			"rhs_googles_black",
			"G_Bandanna_beast",
			"G_Bandanna_tan",
			"G_Bandanna_oli",
			"G_Bandanna_khk",
			"G_B_Diving",


			//NVGs
			"rhsusf_ANPVS_14",
			"rhsusf_ANPVS_15",	
			//"ACE_NVG_Wide",
			
			 "UK3CB_BAF_HMNVS",

			//BINOCULARS
			"Rangefinder",
			"Binocular",
			"Laserdesignator",
			"lerca_1200_black",
			"lerca_1200_tan",
			"Leupold_Mk4",
			"ACE_Vector",
			"ACE_Yardage450",
			"ACE_MX2A",
			
			"UK3CB_BAF_Soflam_Laserdesignator",
			"UK3CB_BAF_Javelin_CLU",

			//MAP
			"ItemMap",


			//GPSs
			"ItemGPS",
			"B_UavTerminal",


			//COPASS
			"ItemCompass",


			//RADIOS
			"tf_anprc152",
			"tf_rf7800str",	


			//WATCHES
			"ItemWatch",
			"tf_microdagr",
			"ACE_Altimeter",

					//ACE Stuff
			"ACE_RangeCard",
			"ACE_Kestrel4500",
			"ACE_EarPlugs",
			"ACE_DefusalKit",
			"ACE_Clacker",
			"ACE_DAGR",
			"ACE_CableTie",
			"ACE_IR_Strobe_Item",
			"ACE_ATragMX",
			"ACE_Tripod",
			"ACE_SpottingScope",
			"ACE_Sandbag_empty",
			"ACE_SpareBarrel",
			"ACE_RangeTable_82mm",
			"ACE_microDAGR",
			"ACE_bodyBag",
			"ACE_surgicalKit",
			"ACE_personalAidKit",
			"ACE_quikclot",
			"ACE_salineIV_250",
			"ACE_salineIV_500",
			"ACE_salineIV",
			"ACE_bloodIV_250",
			"ACE_bloodIV_500",
			"ACE_bloodIV",
			"ACE_plasmaIV_250",
			"ACE_plasmaIV_500",
			"ACE_plasmaIV",
			"ACE_epinephrine",
			"ACE_Adenosine",
			"ACE_morphine",
			"ACE_tourniquet",
			"ACE_elasticBandage",
			"ACE_packingBandage",
			"ACE_fieldDressing",
			"ACE_MapTools",
			"ACE_wirecutter",
			"ACE_UAVBattery",
			"ACE_HuntIR_monitor",
			"ACE_Banana",
			"ToolKit",
			"MineDetector",	
			"ACE_Flashlight_MX991",
			"ACE_Flashlight_KSF1",
			"ACE_Flashlight_XL50",
			"ACE_SpraypaintBlack",
			"ACE_SpraypaintBlue",
			"ACE_EntrenchingTool",
			"ACE_SpraypaintGreen",
			"ACE_SpraypaintRed",
			"ACE_Sandbag_empty",
			"ACE_RangeTable_M119",
			
			//ATACHMENTS Pistol
			"muzzle_snds_acp",
			"optic_MRD",

			"UK3CB_BAF_Flashlight_L131A1",

			//ATACHMENTS Rifle
			"rhsusf_acc_SR25S",
			"rhsusf_acc_anpeq15side",
			"rhsusf_acc_anpeq15",
			"rhsusf_acc_anpeq15_light",
			"rhsusf_acc_LEUPOLDMK4",
			"rhsusf_acc_LEUPOLDMK4_2",
			"rhsusf_acc_harris_bipod",
			"rhsusf_acc_ACOG2_USMC",
			"rhsusf_acc_ACOG3_USMC",
			"rhsusf_acc_ACOG_USMC",
			"rhsusf_acc_ELCAN",
			"rhsusf_acc_ELCAN_pip",
			"rhsusf_acc_ACOG",
			"rhsusf_acc_ACOG_pip",
			"rhsusf_acc_ACOG2",
			"rhsusf_acc_ACOG3",
			"rhsusf_acc_eotech_552",
			"rhsusf_acc_compm4",
			"rhsusf_acc_nt4_black",
			"rhsusf_acc_nt4_tan",
			"rhsusf_acc_SF3P556",
			"rhsusf_acc_SFMB556",
			"rhsusf_acc_M2010S",
			"optic_NVS",
			"optic_Holosight",
			 
			"UK3CB_BAF_Silencer_L115A3",
  			"UK3CB_BAF_Silencer_L115A3",
  			"UK3CB_BAF_Silencer_L85",
  			"UK3CB_BAF_SFFH",
  			"UK3CB_BAF_Silencer_L91A1",
  			"UK3CB_BAF_SpecterLDS",
  			"UK3CB_BAF_SpecterLDS_3D",
  			"UK3CB_BAF_SpecterLDS_Dot",
  			"UK3CB_BAF_SpecterLDS_Dot_3D",
  			"UK3CB_BAF_Eotech",
  			"UK3CB_BAF_SB31250",
  			"UK3CB_BAF_SB31250_Desert",
  			"UK3CB_BAF_SB31250_Desert_Ghillie",
  			"UK3CB_BAF_SB31250_Ghillie",
  			"UK3CB_BAF_SUSAT",
  			"UK3CB_BAF_SUSAT_3D",
  			"UK3CB_BAF_TA31F",
  			"UK3CB_BAF_TA31F_3D",
  			"UK3CB_BAF_TA31F_Hornbill",
  			"UK3CB_BAF_TA31F_Hornbill_3D",
  			"UK3CB_BAF_TA648",
  			"UK3CB_BAF_TA648_308",
  			"UK3CB_BAF_LLM_IR_Tan",
  			"UK3CB_BAF_LLM_IR_Black",
  			"UK3CB_BAF_LLM_Flashlight_Tan",
  			"UK3CB_BAF_LLM_Flashlight_Black",
  			"rhsusf_acc_M2010S",
  			"optic_NVS",
  			"optic_Holosight_smg",

			//ATTACHMENTS
			"tf47_optic_m3maaws",
			"tf47_smaw_optic",
			"tf47_optic_smaw",
			"tf47_smaw_optic",
			"tf47_optic_smaw",
			"tf47_smaw_optic","tf47_optic_smaw",
			"tf47_smaw_optic",
			
			
			"optic_AMS",
			"optic_LRPS",
			"optic_KHS_blk",
			"muzzle_snds_L"


		], false, true] call xla_fnc_addVirtualItemCargo;
		
		//[_box, [WEST_SIDE,FRIENDLY_SIDE],true,false] call XLA_fnc_addVirtualSideCargo;
		//[_box, ["arifle_Katiba_BASE_F"],true,false] call XLA_fnc_addVirtualWeaponCargo;

		// Start the arsenal on it
		_addActionText = "<t color=""#11F22F"">" + "Arsenal";
		["AmmoboxInit",[_box,false,{true},_addActionText,false]] spawn XLA_fnc_arsenal;

} forEach [arsenal1, arsenal2, arsenal3, arsenal4, arsenal6];
//};