class TF47_UMenu_Dialog_ChangeBFTName
{
	idd = -1;
	movingEnable = 0;
	onLoad = "";
	onUnLoad = "";
	class ControlsBackground
	{
		class MainBackground: TF47_UMenu_RscText
		{
			idc = -1;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.4672 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.0528 * safezoneH;
			colorBackground[] = {-1,-1,-1,0.8};
		};
		class Title: TF47_UMenu_RscText
		{
			text = "CHANGE BFT-NAME";
			idc = -1;
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.443 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
		};
	};
	class Controls
	{
		class btn_close: TF47_UMenu_RscButton
		{
			idc = -1;
			text = "CLOSE";
			action = "closeDialog 0";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.521 * safezoneH + safezoneY;
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
		class btn_apply: btn_close
		{
			text = "APPLY";
			action = "(group player) setGroupIdGlobal [(ctrlText 1001)]; closeDialog 0;";
			x = 0.5268118 * safezoneW + safezoneX;
		};
		class edit_Name: TF47_UMenu_RscEdit
		{
			idc = 1001;
			x = 0.437656 * safezoneW + safezoneX;
			y = 0.4826 * safezoneH + safezoneY;
			w = 0.1254687 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0}; 
		};
	};
};