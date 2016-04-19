
_player = _this select 1;

comment "Remove existing items";
removeAllWeapons _player;
removeAllItems _player;
removeAllAssignedItems _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;

comment "Add containers";
_player forceAddUniform "rhs_uniform_FROG01_wd";
_player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 5 do {_player addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 5 do {_player addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 5 do {_player addItemToUniform "ACE_elasticBandage";};
_player addItemToUniform "ACE_tourniquet";
_player addItemToUniform "ACE_morphine";
_player addItemToUniform "ACE_epinephrine";
_player addItemToUniform "ACE_personalAidKit";
_player addItemToUniform "ACE_CableTie";
_player addItemToUniform "ACE_Flashlight_XL50";
_player addItemToUniform "ACE_IR_Strobe_Item";
_player addItemToUniform "Chemlight_blue";
_player addItemToUniform "Chemlight_green";
_player addItemToUniform "Chemlight_red";
_player addVest "rhsusf_spc_mg";
_player addItemToVest "rhsusf_200Rnd_556x45_soft_pouch";
_player addItemToVest "rhsusf_100Rnd_556x45_soft_pouch";
for "_i" from 1 to 3 do {_player addItemToVest "rhsusf_mag_7x45acp_MHP";};
_player addBackpack "rhsusf_assault_eagleaiii_coy";
_player addItemToBackpack "ACE_SpareBarrel";
for "_i" from 1 to 2 do {_player addItemToBackpack "rhsusf_100Rnd_556x45_M200_soft_pouch";};
_player addItemToBackpack "rhs_mag_m18_green";
_player addItemToBackpack "rhs_mag_an_m8hc";
_player addItemToBackpack "rhs_mag_m67";
_player addItemToBackpack "rhsusf_200Rnd_556x45_soft_pouch";
_player addHeadgear "rhsusf_mich_helmet_marpatwd";
_player addGoggles "G_Bandanna_beast";

comment "Add weapons";
_player addWeapon "rhs_weap_m249_pip_S";
_player addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
_player addPrimaryWeaponItem "rhsusf_acc_eotech_552";
_player addWeapon "rhsusf_weap_m1911a1";

comment "Add items";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemGPS";
// _player linkItem "rhsusf_ANPVS_14";