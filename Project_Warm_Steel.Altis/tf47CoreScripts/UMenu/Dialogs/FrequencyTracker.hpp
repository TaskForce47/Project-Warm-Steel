class TF47_UMenu_Dialog_FreqTracker {
	idd = -1;
	movingEnable = 0;
	onLoad = "[_this select 0] call TF47_UMenu_fnc_onLoad_FreqTracker; uiNamespace setVariable ['TF47_Freq_Tracker',_this select 0];";
	onUnLoad = "uiNamespace setVariable ['TF47_Freq_Tracker',nil]";
	class ControlsBackground {
		class Title: TF47_UMenu_RscText
		{
			idc = 1000;
			text = "Frequency Tracker";
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
			shadow = 0;
		};
		class MainBackground: TF47_UMenu_RscText
		{
			idc = 1001;
			x = 0.365937 * safezoneW + safezoneX;
			y = 0.3604 * safezoneH + safezoneY;
			w = 0.257813 * safezoneW;
			h = 0.2596 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
	};
	class Controls {
		class btn_close: TF47_UMenu_RscButton
		{
			idc = 1600;
			text = "CLOSE";
			action = "closeDialog 0";
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
		class btn_delete: btn_close
		{
			idc = 1603;
			text = "DELETE";
			tooltip = "delete currently selected entity";
			action = "call TF47_UMenu_fnc_deleteItem";
			x = 0.520624 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;

		};
		class btn_create: btn_close
		{
			idc = 1604;
			text = "CREATE";
			tooltip = "create new entity with values from above";
			action = "call TF47_UMenu_fnc_createItem";		
			x = 0.572186 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
		};
		class list_Teams: TF47_UMenu_RscListbox
		{
			idc = 1500;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.220 * safezoneH;
		};
		class frame_Teams: TF47_UMenu_RscFrame
		{
			idc = 1800;
			x = 0.37625 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.14 * safezoneW;
			h = 0.220 * safezoneH;
		};
		class Text_type: TF47_UMenu_RscText
		{
			idc = 1801;
			text = "Type:";
			x = 0.525 * safezoneW + safezoneX;
			y = 0.38 * safezoneH + safezoneY;
			w = 0.095 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class combo_type: TF47_UMenu_RscCombo
		{
			idc = 1802;
			x = 0.525 * safezoneW + safezoneX;
			y = 0.40 * safezoneH + safezoneY;
			w = 0.095 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_name: Text_type
		{
			idc = 1803;
			text = "Name:";
			y = 0.439 * safezoneH + safezoneY;

		};
		class edit_name: TF47_UMenu_RscEdit
		{
			idc = 1804;
			text = "";
			x = 0.525 * safezoneW + safezoneX;
			y = 0.459 * safezoneH + safezoneY;
			w = 0.095 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class text_Leader: Text_type
		{
			idc = 1805;
			text = "Leader:";
			y = 0.498 * safezoneH + safezoneY;
		};
		class edit_Leader: edit_name
		{
			idc = 1806;
			text = "";
			y = 0.518 * safezoneH + safezoneY;
		};
		class text_freq: Text_type
		{
			idc = 1807;
			text = "Internal Frequency:";
			y = 0.557 * safezoneH + safezoneY;
		};
		class edit_freq: edit_name
		{
			idc = 1808;
			text = "";
			y = 0.577 * safezoneH + safezoneY;
		};
	};
};