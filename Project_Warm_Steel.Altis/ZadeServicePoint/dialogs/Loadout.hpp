/////////////////////////////////////////////////////////////////////////////////
/*
 *	Name: Loadout.hpp
 *	Author:	DerZade
 *	Description: The Loadout Dialog
 *	
 *	Parameter: NONE
 *	
 *	Return Value: NONE
 */	
/////////////////////////////////////////////////////////////////////////////////

class ZadeServicePoint_LoadoutDialog {
	idd = -1;
	movingEnable = 0;
	onLoad = "[_this select 0] execVM 'ZadeServicePoint\Scripts\onLoad_Loadout.sqf'";
	class ControlsBackground {
		class back_title: ZadeServicePoint_RscText
		{
			idc = 1000;
			text = "LOADOUTS";
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
		class text_Loadout: ZadeServicePoint_RscText
		{
			idc = 1000;
			text = "Choose Loadout:";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_Content: ZadeServicePoint_RscText
		{
			idc = 1002;
			text = "Content:";
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_Delete: ZadeServicePoint_RscText
		{
			idc = 1003;
			text = "Remove Load:";
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.065 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Will all currently loaded items be removed with appling the slected loadout?";
		};
	};
	class Controls {
		class value_delete: ZadeServicePoint_RscText
		{
			idc = 1502;
			text = "";
			x = 0.45 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.022 * safezoneH;
			tooltip = "Will all currently loaded items be removed with appling the slected loadout?";
		};
		class btn_loadout: ZadeServicePoint_RscButton
		{
			idc = 1600;
			text = "SERVICE";
			action = "closeDialog 0; createDialog 'ZadeServicePoint_ServiceVehicleDialog';";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0505312 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorDisabled[] = {-1,-1,-1,0.8};
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
		class bnt_Clear: btn_loadout
		{
			idc = 1601;
			text = "CLEAR LOAD";
			w = 0.062 * safezoneW;
			x = 0.4179 * safezoneW + safezoneX;
			tooltip = "Remove all loaded items from your vehicle";
			action = "[] execVM 'ZadeServicePoint\Scripts\clearLoad.sqf'";
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
			action = "[] execVM 'ZadeServicePoint\Scripts\apply_Loadout.sqf'";
		};
		class list_loadouts: ZadeServicePoint_RscListbox
		{
			idc = 1500;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.160 * safezoneH;
		};
		class list_content: ZadeServicePoint_RscListbox
		{
			idc = 1501;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.198 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		};
		class frame_loadouts: ZadeServicePoint_RscFrame
		{
			idc = 1800;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.113437 * safezoneW;
			h = 0.160 * safezoneH;
		};
		class frame_content: ZadeServicePoint_RscFrame
		{
			idc = 1801;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.198 * safezoneH;
		};
	};
};