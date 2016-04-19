// --- TICKET SYSTEM & LOGGING ----------------------------------------------------------------------------------------------------------------------
// Modify this value to change the initial ticket count.
#define ACE3	0
#define ACRE	0

TICKETS_WEST = 100;

// Max Tickets the Team may ever have - tickets gained beyond that point are lost
TICKETS_SOFTCAP = 100;
TICKETS_HARDCAP = 150;

// This is the Mission ID for the Database Log - set to 0 to disable DB Logging
// 0 ... disabled
// 1 ... Takistan Domination
// 2 ... Fallujah Insurgency
// 3 ... Reshmaan Patrol Ops
// 4 ... Takistan Domination Mod Version
// 5 ... Takistan Domination Gefechtsübungszentrum (GUeZ) Version
// 7 ... ISLA DI CAPRAIA PatrolOps Mod
// 9 ... Invade&Annex Al Rayak
// 7....I&A Altis
// 99 ... Development Server
TF47_MISSIONID = 7;

// Mission Name/Version Info for Log
TF47_MISSIONINFO = "CO@XX Invade&Annex Altis";

_pathtoscripts = "tf47CoreScripts\";

// _infantryStaminaClass = "US_Delta_Force_EP1";

// --- DESPAWN PREVENTION MARKERS -------------------------------------------------------------------------------------------------------------------
_despawnPreventionMarkers = [
	["despawn_prev01",700],["fob1_safezone",500],["fob2_safezone",500],["harbor", 200]
];

// --- BASE CLEAN-UP MARKERS ------------------------------------------------------------------------------------------------------------------------
// see basecleanup.sqf for details
// Markers to Check for Base Clean-up Process
// [Marker Name, Clean-up Distance]
_baseCleanupMarkers = [["despawn_prev01",200]];



// --- MAP CONTROL MARKERS --------------------------------------------------------------------------------------------------------------------------
// 		see mcmarker.sqf and mcmarkerchange.sqf for details
_statusMarkersInit = false;
_statusMarkerData = [
	["mc1",			["mc1marker",				"b_hq",				"ColorGreen",		"CCT - Command and Control ""SPECTRE""",						true]],
	["mc2",			["mc2marker",				"b_hq",				"ColorGreen",		"CCT - Joint Terminal Attack Controller ""TOPMAN""",			true]],
	["mc3",			["mc3marker",				"b_hq",				"ColorGreen",		"Air Traffic Control ""TOWER""",								true]],
	["raven1",		["callsign_raven1",			"b_air",			"ColorBrown",		"RAVEN-01",														false]]//,
	// ["raven2",		["callsign_raven2",			"b_air",			"ColorBrown",		"RAVEN-02",														false]],
	// ["butterfly1",	["callsign_butterfly1",		"b_air",			"ColorBrown",		"BUTTERFLY-01",													false]],
	// ["butterfly2",	["callsign_butterfly2",		"b_air",			"ColorBrown",		"BUTTERFLY-02",													false]],
	// ["pelican1",	["callsign_pelican1",		"b_air",			"ColorBrown",		"PELICAN",														false]],
	// ["griffin1",	["callsign_griffin1",		"b_air",			"ColorBrown",		"GRIFFIN-01",													false]],
	// ["griffin2",	["callsign_murphy1",		"b_air",			"ColorBrown",		"GRIFFIN-02",													false]],
	// ["dragon1",		["callsign_dragon1",		"b_air",			"ColorOrange",		"DRAGON",														false]],
	// ["firefly1",	["callsign_firefly1",		"b_air",			"ColorOrange",		"FIREFLY",														false]],
	// ["thunderbird1",["callsign_thunderbird1",	"b_plane",			"ColorOrange",		"THUNDERBIRD",													false]],
	// ["falcon1",		["callsign_falcon1",		"b_plane",			"ColorOrange",		"FALCON-01",													false]],
	// ["falcon2",		["callsign_falcon2",		"b_plane",			"ColorOrange",		"FALCON-02",													false]],
	// ["c130",		["callsign_c130",			"b_plane",			"ColorBrown",		"C130J",														false]],
	// ["rhino1",		["callsign_rhino1",			"b_armor",			"ColorOrange",		"RHINO-01",														false]],
	// ["rhino2",		["callsign_rhino2",			"b_armor",			"ColorOrange",		"RHINO-02",														false]],
	// ["tiger1",		["callsign_tiger1",			"b_mech_inf",		"ColorOrange",		"TIGER-01",														false]],
	// ["tiger2",		["callsign_tiger2",			"b_mech_inf",		"ColorOrange",		"TIGER-02",														false]]
];
_statusMarkers = [_statusMarkerData, []] call CBA_fnc_hashCreate;



// --- LIFT RULES -----------------------------------------------------------------------------------------------------------------------------------
//		see vehicleOnSpawn.sqf
// _LiftHelicopters = ["seagull1","seagull2","pelican1"];
// _NoLiftHelicopters = ["crow1", "crow2", "dustoff1", "griffin1", "goose1", "manticore1"];


// --- No JUMP OUT VEH -----------------------------------------------------------------------------------------------------------------------------------
//		see vehicleOnEnter.sqf
_JumpOutHelicopters = [];



// --- VEHICLE RESTRICTIONS -------------------------------------------------------------------------------------------------------------------------
// Vehicle Name, Driver Whitelist ID (0 for None), Crew Whitelist ID (0 for None), Driver Slots, Crew Slots
_vehicleRestrictionData = [
	// UH60/UH1Y
	["uh60", 			[1, 1,	["rotwt11","rotwt12","rotwt13","rotwt14"],						["rotwt11","rotwt12","rotwt13","rotwt14"]]],
	// UH60/UH1Y
	["uh1y", 			[1, 1,	["rotwt11","rotwt12","rotwt13","rotwt14"],						["rotwt11","rotwt12","rotwt13","rotwt14"]]],
	// AH1Z/AH64
	["ah64d", 			[1, 1,	["rotwa11","rotwa12"],						["rotwa11","rotwa12"]]],
	// AH6
	["ah6", 					[1, 1,	["rotwa21","rotwa22"],						["rotwa21","rotwa22"]]],
	// A-10/F-16
	["a10", 				[1, 1,	["fixwa11","fixwa21"],						[]]],
	// A-10/F-16
	["f16", 				[1, 1,	["fixwa11","fixwa21"],						[]]],
	// MH-6
	["mh6", 					[1, 1,	["rotwt31","rotwt32"],						["rotwt31","rotwt32"]]],
	// CH-47
	["ch47", 					[1, 1,	["rotwt21","rotwt22","rotwt23","rotwt24"],						["rotwt21","rotwt22","rotwt23","rotwt24"]]],
	// C-130
	//["c130", 					[1, 1,	["fixwt11","fixwt12","fixwt13"],			["fixwt11","fixwt12","fixwt13"]]],
	// UH60M (DUSTOFF)
	["dustoff",                	[1, 1,  ["rotwt41","rotwt42"],                      ["rotwt41"],["rotwt42"]]],
	
	["c130j",                	[1, 1,  ["fixwt11","fixwt12","fixwt13"],                      ["fixwt11","fixwt12","fixwt13"]]],
	
	["tank1", 			[2, 2,	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"],	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"]]],
	["tank2", 			[2, 2,	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"],	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"]]],
	["ifv1", 			[2, 2,	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"],	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"]]],
	["ifv2", 			[2, 2,	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"],	["armor11","armor12","armor13","armor14","armor21","armor22","armor23","armor24"]]],

	["M119_1", 			[2, 2,	["arty1","arty2","arty3","arty4","arty5","arty6"],	["arty1","arty2","arty3","arty4","arty5","arty6"]]],
	["M119_2", 			[2, 2,	["arty1","arty2","arty3","arty4","arty5","arty6"],	["arty1","arty2","arty3","arty4","arty5","arty6"]]]
	// ["raven2", 			[1, 1,	["rottrans11","rottrans12","rottrans21","rottrans22"],						["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
	// ["pelican1", 		[1, 1,	["rottrans11","rottrans12","rottrans21","rottrans22"],						["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
	// ["griffin1", 		[1, 1,	["rottrans11","rottrans12","rottrans21","rottrans22"],						["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
	// ["griffin2", 		[1, 1,	["rottrans11","rottrans12","rottrans21","rottrans22"],						["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
	// ["butterfly1", 		[1, 1,	["rottrans11","rottrans12","rottrans21","rottrans22"],						["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
	// ["butterfly2", 		[1, 1,	["rottrans11","rottrans12","rottrans21","rottrans22"],						["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
	// ["c1301", 			[1, 1,	["rottrans11","rottrans12","rottrans21","rottrans22"],						["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],

	// ["dragon1", 		[1, 1,	["rotwa11","rotwa12"],													["rotwa11","rotwa12"]]]
	// ["firefly1", 		[1, 1,	["rotatt21","rotatt22"],													["rotatt21","rotatt22","rotatt23","rotatt24"]]],

	// ["thunderbird1", 	[1, 1,	["fixatt11","fixatt21","fixatt22","fixatt31"], 								[]]],
	// ["falcon1", 		[1, 1,	["fixatt11","fixatt21","fixatt22","fixatt31"], 								[]]],
	// ["falcon2", 		[1, 1,	["fixatt11","fixatt21","fixatt22","fixatt31"], 								["fixatt22"]]],
	// ["rhino1", 			[2, 2,	["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],	[]]],
	// ["rhino2", 			[2, 2,	["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],	[]]],
	// ["tiger1", 			[2, 2,	["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],	[]]],
	// ["tiger2", 			[2, 2,	["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],	[]]]
];
_vehicleRestrictions = [_vehicleRestrictionData, []] call CBA_fnc_hashCreate;



// --- SECURE SLOTS ---------------------------------------------------------------------------------------------------------------------------------
// Slot Name, Whitelist ID
_secureSlots = [
	["mc1",	3],	// CCT Command and Control
	["mc2",	3], // CCT 1st JTAC
	["mc3",	1],	// Tower
	["Zeus1", 5],	//Zeus 1
	["Zeus2", 5]	//Zeus 2
];

// --- ALL SLOTS ------------------------------------------------------------------------------------------------------------------------------------
// used by Domination for Playermarkers, etc...
_allslots = [];

// --- Infantry Ticket Costs ------------------------------------------------------------------------------------------------------------------------
// Infantry: 						3 Tickets
// Infantry Squad Medics: 			5 Tickets
// Infantry Squad Lead: 			5 Tickets
// Sniper/Spotter: 					5 Tickets
// Tank Crew: 						5 Tickets
// UH60/UH1Y/AH6/UH60M Crew: 		7 Tickets
// MH6 Crew: 						5 Tickets
// AH1Z/AH64/Airmedics Crew: 		10 Tickets
// Fixed Attack Pilot/ CH-47 Crew:	10 Tickets
// C-130 Crew: 						13 Tickets
// Mission Control Slots:			10 Tickets
// Zeus Slot:						0 Tickets

_infantryTicketsDefault = 3;
_infantryTicketsData = [
	// ["tank11", 5],		["tank12", 5],		["tank13", 5],		["tank14", 5],
	// ["tank21", 5],		["tank22", 5],		["tank23", 5],		["tank24", 5],

	// Sql
	["alphaact",5],		["bravoact",5],		["charlieact",5],
	
	// Squadmedic
	["alphasqmed",5], 	["bravosqmed",5],	["charliesqmed",5],
	
	// Sniper/Spotter
	["ghost1",15],		["ghost2",15],
	// UH60/UH1Y Crew
	["rotwt11", 7],		["rotwt12", 7],		["rotwt13", 7],		["rotwt14", 7],
	
	// AH1Z/AH64 Crew
	["rotwa11", 10],	["rotwa12", 10],
	
	// AH6 Crew
	["rotwa21",7], 		["rotwa22",7],
	
	// A10/F16
	["fixwa11",10], 	["fixwa21",10],
	
	// MH6
	["rotwt31",5], 		["rotwt32",5],
	
	// CH47
	["rotwt21",10],		["rotwt22",10],		["rotwt23",10],		["rotwt24",10],
	
	// C-130
	["fixwt11",10],		["fixwt12",10],		["fixwt13",10],
	
	// UH60M (DUSTOFF)
	["rotwt41",7],		["rotwt42",7],		["rotwt43",10],		["rotwt44",10],

	// CCT, JTAC, TOWER
	["mc1", 10],		["mc2", 10],		["mc3", 10],
	//arty
	["arty1", 5],		["arty2", 5],		["arty3", 5],		["arty4", 5],		["arty5", 5],		["arty6", 5]

];
_infantryTickets = [_infantryTicketsData, _infantryTicketsDefault] call CBA_fnc_hashCreate;

// --- SatCon----------------------------------------------------------------------------------------------------------------------------------------
_satConSlotsData = [
	//["mc1",  true]
];
_satConSlots = [_satConSlotsData, false] call CBA_fnc_hashCreate;

// --- Active Mods ----------------------------------------------------------------------------------------------------------------------------------
_activeModsData = [
];
_activeMods = [_activeModsData, false] call CBA_fnc_hashCreate;

// --- Default Loadouts -----------------------------------------------------------------------------------------------------------------------------
_defaultLoadoutsData = [
/*
	["armor11", "crew"],			["armor12", "crew"],			["armor13", "crew"],
	["armor21", "crew"],			["armor22", "crew"],			["armor23", "crew"],
	["rotwt11", "crew"],			["rotwt12", "crew"],			["rotwt13", "crew"],			["rotwt14", "crew"],		["rotwt15", "crew"],
	["rotwt21", "crew"],			["rotwt22", "crew"],			["rotwt23", "crew"],			["rotwt24", "crew"],		["rotwt25", "crew"],
	["rotwa11", "crew"],			["rotwa12", "crew"],
	["fixwa11", "crew"],			["fixwa12", "crew"], 			["fixwa13", 10],
	["maceact", "squadleader"], 	["mace11", "squadleader"], 		["mace21", "squadleader"], 		["mace31", "squadleader"],
	["hammeract", "squadleader"], 	["hammer11", "squadleader"], 	["hammer21", "squadleader"], 	["hammer31", "squadleader"],
	["mace12", "medic"], 			["mace22", "medic"], 			["mace32", "medic"],
	["hammer12", "medic"], 			["hammer22", "medic"],			["hammer32", "medic"],
	["mc1", "cct"], 				["mc2", "cct"], 				["mc3", "cct"], 				["mc4", "cct"], 				["mc5", "cct"]
*/
];
_defaultLoadouts = [_defaultLoadoutsData, "basic"] call CBA_fnc_hashCreate;