/*
@filename: enemyInd.hpp
Author:

	Quiksilver
	
Description:
	INDEPENDENT
	Units, vehicles and groups, for use elsewhere in the mission.
	Doing this alleviates the need to dig through configFile, which eats more server CPU.
	Also allows greater control over what is being spawned, and where, yet allows for random composition groups.
	
	Sentry = 2-man
	Team = 4-man
	Squad = 8-man
__________________________________________________*/

class ind {
	units[] = {
		"rhs_g_Soldier_TL_F",
		"rhs_g_Soldier_SL_F",
		"rhs_g_medic_F",
		"rhs_g_Soldier_AR_F",
		"rhs_g_Soldier_AT_F",
		"rhs_g_Soldier_M_F",
		"rhs_g_engineer_F",
		"rhs_g_Soldier_F",
		"rhs_g_Soldier_GL_F",
		"rhs_g_Soldier_AA_F"
	};
};
