/////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: ServiceVehicle.hpp
 *	Author:	DerZade
 *	Description: The ServiceVehicle Dialog
 *	
 *	Parameter: NONE
 *	
 *	Return Value: NONE
 */	
/////////////////////////////////////////////////////////////////////////////////

class ZadeServicePoint_ServiceVehicleDialog {
	idd = -1;
	movingEnable = 0;
	onLoad = "[_this select 0] execVM 'ZadeServicePoint\Scripts\onLoad_ServiceVehicle.sqf';";
	class ControlsBackground {
		class back_title: ZadeServicePoint_RscText
		{
			idc = 1000;
			text = "SERVICE VEHICLE";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
			shadow = 0;
		};
		class back_main: ZadeServicePoint_RscText
		{
			idc = 1001;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.3604 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.2596 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class frame_status: ZadeServicePoint_RscFrame
		{
			idc = -1;
			text = " Status ";
			x = 0.377281 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.176 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		};
		class text_fuel: ZadeServicePoint_RscText
		{
			idc = -1;
			text = "Fuel:";
			x = 0.386562 * safezoneW + safezoneX;
			y = 0.4516 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.028 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
		};
		class text_damage: text_fuel
		{
			text = "Damage:";
			y = 0.4859 * safezoneH + safezoneY;
		};
		class text_ammo: text_fuel
		{
			text = "Ammo:";
			y = 0.5202 * safezoneH + safezoneY;
		};
		class text_Status: text_fuel
		{
			text = "Status:";
			y = 0.5542 * safezoneH + safezoneY;
		};
		class text_refuel: ZadeServicePoint_RscText
		{
			idc = 2781;
			text = "Refuel";
			x = 0.546406 * safezoneW + safezoneX;
			y = 0.391 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.3)";
		};
		class text_repair: text_refuel
		{
			idc = 2782;
			text = "Repair";
			y = 0.4394 * safezoneH + safezoneY;
		};
		class text_rearm: text_refuel
		{
			idc = 2783;
			text = "Rearm";
			y = 0.4878 * safezoneH + safezoneY;
		};
		class text_respawn: text_refuel
		{
			idc = 2784;
			text = "Respawn";
			y = 0.5562 * safezoneH + safezoneY;
		};
	};
	class Controls {
		class Pic_icon: ZadeServicePoint_RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.385 * safezoneH + safezoneY;
			w = 0.03093744 * safezoneW;
			h = 0.0264 * safezoneH;
		};
		class Text_Name: ZadeServicePoint_RscText
		{
			idc = 1007;
			text = "err";
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.044 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.1)";
		};
		class btn_loadout: ZadeServicePoint_RscButton
		{
			idc = 1600;
			text = "LOADOUTS";
			action = "closeDialog 0; createDialog 'ZadeServicePoint_LoadoutDialog';";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0505312 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorDisabled[] = {0.3,0.3,0.3,1};
			colorBackgroundDisabled[] = {-1,-1,-1,0.8}; 
			colorBackgroundActive[] = {1,1,1,0.8};
			colorFocused[] = {-1,-1,-1,0.8};
			colorShadow[] = {-1,-1,-1,0};
			offsetX = 0;
			offsetY = 0;
			offsetPressedX = 0;
			offsetPressedY = 0;
			style = 0;
		};
		class btn_cancel: btn_loadout
		{
			idc = 1603;
			text = "CANCEL";
			x = 0.520624 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			action = "closeDialog 0";
		};
		class btn_apply: btn_loadout
		{
			idc = 1604;
			text = "APPLY";
			x = 0.572186 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			action = "[] execVM 'ZadeServicePoint\Scripts\apply_Service.sqf'";
		};
		class box_refuel: ZadeServicePoint_RscCheckbox
		{
			idc = 2800;
			x = 0.520625 * safezoneW + safezoneX;
			y = 0.391 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class box_repair: box_refuel
		{
			idc = 2801;
			y = 0.4394 * safezoneH + safezoneY;
		};
		class box_rearm: box_refuel
		{
			idc = 2802;
			y = 0.4878 * safezoneH + safezoneY;
		};
		class box_respawn: box_refuel
		{
			idc = 2803;
			y = 0.5562 * safezoneH + safezoneY;
		};
		class text_fuel: ZadeServicePoint_RscText
		{
			idc = 1003;
			text = "err_fuel";
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.457 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			style = 1;
		};
		class text_damage: text_fuel
		{
			idc = 1004;
			text = "err_dam";
			y = 0.491 * safezoneH + safezoneY;
		};
		class text_ammo: text_fuel
		{
			idc = 1005;
			text = "err_ammo";
			x = 0.42875 * safezoneW + safezoneX;
			y = 0.525 * safezoneH + safezoneY;
			w = 0.0609375 * safezoneW;
		};
		class text_status: text_fuel
		{
			idc = 1006;
			text = "err_status";
			x = 0.42875 * safezoneW + safezoneX;
			y = 0.56 * safezoneH + safezoneY;
			w = 0.0609375 * safezoneW;
		};
	};
};