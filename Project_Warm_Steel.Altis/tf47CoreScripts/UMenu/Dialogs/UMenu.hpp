class TF47_UMenu_Dialog_UMenu
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['TF47_UMenu_Dialog_UMenu',_this select 0];";
	onUnLoad = "uiNamespace setVariable ['TF47_UMenu_Dialog_UMenu',nil]";
	class ControlsBackground
	{
		class MainBackground: TF47_UMenu_RscText
		{
			idc = -1;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.225 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class Title: TF47_UMenu_RscText
		{
			text = "NAME";
			style = 1;
			idc = 1001;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.3548 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
		};
	};
	class Controls
	{
		class btn_Tracker: TF47_UMenu_RscButton
		{
			idc = -1;
			text = "Frequency Tracker";
			action = "closeDialog 0; createDialog 'TF47_UMenu_Dialog_FreqTracker';";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.057 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorDisabled[] = {-1,-1,-1,0.8};
			colorBackgroundDisabled[] = {-1,-1,-1,0.8}; 
			colorBackgroundActive[] = {1,1,1,0.8};
			colorFocused[] = {-1,-1,-1,0.8};
			colorShadow[] = {-1,-1,-1,0};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
		};
		class btn_ViewDistance: btn_Tracker
		{
			text = "VD Settings";
			action = "closeDialog 0; call TAWVD_fnc_openTAWVD";
			y = 0.463 * safezoneH + safezoneY;		
		};
		class btn_BFT: btn_Tracker
		{
			idc = 1003;
			text = "Change BFT-Name";
			action = "closeDialog 0; createDialog 'TF47_UMenu_Dialog_ChangeBFTName';";
			y = 0.525 * safezoneH + safezoneY;		
		};
	};
};


class TF47_UMenu_Dialog_UMenu_Tickets
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['TF47_UMenu_Dialog_UMenu',_this select 0];";
	onUnLoad = "uiNamespace setVariable ['TF47_UMenu_Dialog_UMenu',nil]";
	class ControlsBackground
	{
		class MainBackground: TF47_UMenu_RscText
		{
			idc = -1;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.264 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class Title: TF47_UMenu_RscText
		{
			text = "NAME";
			style = 1;
			idc = 1001;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.3548 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
		};
		class Text_Tickets: TF47_UMenu_RscText
		{
			text = "Tickets:";
			idc = -1;
			x = 0.452969 * safezoneW + safezoneX;
			y = 0.587 * safezoneH + safezoneY;
			w = 0.07 * safezoneW;
			h = 0.04 * safezoneH;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
		};
		class Value_Tickets: Text_Tickets
		{
			text = "error";
			idc = 1002;
			style = 1;
			x = 0.477031 * safezoneW + safezoneX;
		};
	};
	class Controls
	{
		class btn_Tracker: TF47_UMenu_RscButton
		{
			idc = -1;
			text = "Frequency Tracker";
			action = "closeDialog 0; createDialog 'TF47_UMenu_Dialog_FreqTracker';";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.057 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
			colorDisabled[] = {-1,-1,-1,0.8};
			colorBackgroundDisabled[] = {-1,-1,-1,0.8}; 
			colorBackgroundActive[] = {1,1,1,0.8};
			colorFocused[] = {-1,-1,-1,0.8};
			colorShadow[] = {-1,-1,-1,0};
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
		};
		class btn_ViewDistance: btn_Tracker
		{
			text = "VD Settings";
			action = "closeDialog 0; call TAWVD_fnc_openTAWVD";
			y = 0.463 * safezoneH + safezoneY;		
		};
		class btn_BFT: btn_Tracker
		{
			idc = 1003;
			text = "Change BFT-Name";
			action = "closeDialog 0; createDialog 'TF47_UMenu_Dialog_ChangeBFTName';";
			y = 0.525 * safezoneH + safezoneY;		
		};
	};
};