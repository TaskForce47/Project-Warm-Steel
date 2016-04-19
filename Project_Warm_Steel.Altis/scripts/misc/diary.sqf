if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["rules", "Rules"];
player createDiarySubject ["general", "General"];
player createDiarySubject ["teamspeak", "Teamspeak"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];

//-------------------------------------------------- Rules

player createDiaryRecord ["rules",
[
"Enforcement",
"
<br />The purpose of the above rules are to ensure a fun and relaxing environment for public players.
<br />
<br />Server rules are in place merely as a means to that end.
<br />
<br />Guideline for enforcement:
<br />
<br />-	Innocent rule violation and disruptive behavior: 
<br />
<br />		= Verbal / Written request to cease, or warning.
<br /> 
<br />-	Minor or first-time rule violation:
<br />
<br />		= Kick, or 0 - 3 day ban.
<br />
<br />-	Serious or repetitive rule violation: 
<br />
<br />		= 3 - 7 day ban.
<br />
<br />-	Administrative ban (hack/exploit/verbal abuse/serious offense):
<br />
<br />		= permanent or 30 day.
<br />
<br />
<br />The above is subject to discretion.
"
]];

player createDiaryRecord ["general",
[
"General",
"
<br />01. Hacking and mission exploitation will not be tolerated.
<br />02. Intentional team-killing will not be tolerated.
<br />03. Excessive, unintentional team-killing may result in a Kick/Temp ban.
<br />04. Unnecessary destruction of BLUFOR vehicles will not be tolerated.
<br />05. Verbal abuse and bullying will not be tolerated. 
<br />06. Firing a weapon on base--unless at an enemy--may result in a Kick/Temp ban.
<br />07. Griefing and obstructive play will not be tolerated.
<br />08. Excessive mic spamming, especially of Side and Global channels, will not be tolerated.
<br />09. A server moderator or admin's word is final.
<br />10. Landing inside of the main spawn may result in a warning or kick.
<br />
<br />If you see a player in violation of the above, contact a moderator or admin (teamspeak).
"
]];



//-------------------------------------------------- Teamspeak

player createDiaryRecord ["teamspeak",
[
"Taskforce 47",
"
<br /> Address: 94.23.199.47 or ts.armasim.de
<br /> All players have to be on Teamspeak at all times!
<br />
"
]];

//------------------------------------------------- Credits

player createDiaryRecord ["credits",
[
"Credits","
<br /> 	Credits for the Template to the Ahoy Community for making Invade and Annex!
<br /> 
<br /> 	TAW View Distance Script by Tonic
<br />
<br /> 	Vehicle Rearm Script by Xeno
<br />
<br />	IgiLoad script by Igi_PL
<br />
<br />	IgiLoad RHS config by TF47 Lucke
<br />
<br /> 	Main Mission edit by TF47 John Hunter and TF47 Willard
<br /> 
<br /> 	Special thanks to:
<br /> 	DerZade for the U-Menu and ServicePoint.
<br />
"
]];

player createDiaryRecord ["changelog",
["Changelog","
<br />"]];

//---------------------------------------------------- Changelog
// player createDiaryRecord ["changelog",
// ["0.9.42-RC","
// <br /> Initial release candidate"]];

// player createDiaryRecord ["changelog",
// ["0.9.5-RC","
// <br />			
// <br />	<strong>CHANGED:</strong>
// <br />	- ACE to 3.2.0 (Sitting and fingering)
// <br /> 	- Side mission Artillery Position fires frequently
// <br /> 	<strong>FIXED:</strong>
// <br /> 	- Respawn/desertion time
// <br /> 	- Placing of medical supply crate
// <br /> 	- Instant failed side mission 
// <br /> 	- Main AO spawing in water
// <br /> 	<strong>ADDED:</strong>
// <br /> 	- UAV (YABHORN-R3 (CAS))
// <br /> 	- MK6 Mortar
// <br /> 	- Cargo Container with Arsenal
// <br /> 	- NVGs for enemy Group Leaders, UAZ Crews and Static Gunners
// <br /> 	- one more possible main (Delfinaki)
// <br /> 	<strong>REMOVED:</strong>
// <br /> 	- Arsenal preload
// <br /> 	- setGroupId in init"
// ]];

// player createDiaryRecord ["changelog",
// ["0.9.6-RC","
// <br />			
// <br />	<strong>CHANGED:</strong>
// <br />	- Enemy Arty nerfed
// <br /> 	- ACE Medical Settings
// <br /> 	- TFR Module
// <br /> 	- Wind Module"
// ]];


// player createDiaryRecord ["changelog",
// ["0.9.7-RC","
// <br />			
// <br />	<strong>CHANGED:</strong>
// <br />	- Side Mission UAZ Drivers changed to Indep
// <br /> 	- ACE Medical Settings (again)
// <br /> 	- Wind Module (again)
// <br /> 	- Zeus is now a medic and got allowDamage false
// <br />  - Chairs added
// <br /> 	<strong>FIXED:</strong>
// <br /> 	- TAW VD Error "
// ]];

// player createDiaryRecord ["changelog",
// ["0.9.8-RC","
// <br />			
// <br />	<strong>CHANGED:</strong>
// <br /> 	- ACE Medical Settings (again)
// <br /> 	- BFT enabled
// <br /> 	<strong>REMOVED:</strong>
// <br /> 	- Surgical Kit
// <br /> 	- Action for removing Vanilla Dmg"
// ]];

// player createDiaryRecord ["changelog",
// ["1.0.0","
// <br />			
// <br />	<strong>CHANGED:</strong>
// <br /> 	- Wind Module (again)
// <br /> 	- Small Fixes and Stuff"
// ]];

// player createDiaryRecord ["changelog",
// ["1.0.1","
// <br />			
// <br />	<strong>CHANGED:</strong>
// <br /> 	- PAK now only on Med Locations
// <br /> 	- Medics got custom CPR
// <br />	<strong>FIXED:</strong>
// <br /> 	- AH-6 Copilot
// <br />	<strong>ADDED:</strong>
// <br /> 	- Lamps at spawn
// <br />"
// ]];

// player createDiaryRecord ["changelog",
// ["1.0.2","
// <br />			
// <br />	Hangar der YABHORN-R3 verschoben
// <br /> 	Despawn distanz angehoben
// <br /> 	Desertion Zeit angehoben
// <br /> 	Eigene CPR Action hinzugefügt
// <br /> 	Server Config geändert
// <br /> 	FOB Sentinel hinzugefügt
// <br />"
// ]];

// player createDiaryRecord ["changelog",
// ["1.0.3","
// <br />			
// <br />	Eigene CPR Action entfernt
// <br /> 	IR Grenade wurde dem Arsenal hinzugefügt
// <br /> 	verschiedene Gebäude an FOB Sentinel korrigiert
// <br /> 	Namen der Support Trucks an der FOB Sentinel korrigiert
// <br /> 	Eine fehlerhafte Sidemission vorerst entfernt
// <br /> 	Boote am Spawn hinzugefügt
// <br /> 	3 neue Logistik Fahrzeuge
// <br /> 	IgiLoad script hinzugefügt (testweise)
// <br /> 	Der UAV Crew bessere Chancen im Kampf mit ACE gegeben
// <br /> 	Die Mission ist nach 4 Mains nun gewonnen
// <br /> 	Spawn Bereich ist nun vor Fahrzeugen geschützt
// <br /> 	Die Mission läuft nun auf dem ""normalen"" Invade and Annex Port (2392)
// <br />"
// ]];

// player createDiaryRecord ["changelog",
// ["1.0.4","
// <br />	[3CB] BAF Units, Weapons und Equipment sowie Ridgback
// <br /> 	Zufällige Patrouillen hinzugefügt
// <br />  Hoch kalibrige SSG's auf Sniper Slots beschränkt
// <br />  Zufällige IED's hinzugefügt, zum entschärfen muss man im EOD Slot sein, sowie ein Toolkit bei sich haben
// <br />	Arsenal dem Container Truck hinzugefügt
// <br />	SDV Namen an der FOB korrigiert
// <br /> 	Hafen mit Booten hinzugefügt
// <br />	RHS Laster sind nun IgiLoad kompatibel (Thx @Lucke)
// <br />	Artillery wurde genervt
// <br />	Panzer Whitelist Fehler behoben
// <br />	Respawn Zonen hinzugefügt
// <br />	Zivilisten hinzugefügt, bei Tod durch Blufor wird ein Ticket abgezogen
// <br />	U-Menu gefixxt (Thx @DerZade)
// <br />	Smoke Wind gefixxt
// <br /> 	Runway Marker korrigiert
// <br />	HuntIR hinzugefügt
// <br /> 	Arsenal: Vanilla SMGs raus, M2010 Silencer hinzugefügt, Vanilla Holo und NVS hinzugefügt, Vanilla NVGs entfernt
// <br />"
// ]];

// player createDiaryRecord ["changelog",
// ["1.0.41","
// <br />	Ridgback einen Namen gegeben
// <br /> 	Boat Despawn gefixxt
// <br /> 	Patrouillen gefixxt
// <br /> 	HuntIR ULG hinzugefügt für RHS AR15
// <br /> 	Civ Spawn gefixt 
// <br /> 	Arsenal weiter überarbeitet
// <br /> IEDs entfernt
// <a href=""url"">link text</a>

// <br />"
// ]];