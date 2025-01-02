class missionEdit {
	
	idd=6969;
	
	class controls{

		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by scott, v1.063, #Soponu)
		////////////////////////////////////////////////////////

		class mainBackground: RscText69
		{
			idc = 63907;

			x = 0.283441 * safezoneW + safezoneX;
			y = 0.19212 * safezoneH + safezoneY;
			w = 0.433134 * safezoneW;
			h = 0.593928 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class heliText: RscText69
		{
			idc = 65321;

			text = "Helis:"; //--- ToDo: Localize;
			x = 0.304057 * safezoneW + safezoneX;
			y = 0.609957 * safezoneH + safezoneY;
			w = 0.0500274 * safezoneW;
			h = 0.0470073 * safezoneH;
		};
		class aaText: RscText69
		{
			idc = 38534;

			text = "AA:"; //--- ToDo: Localize;
			x = 0.551541 * safezoneW + safezoneX;
			y = 0.324069 * safezoneH + safezoneY;
			w = 0.0494906 * safezoneW;
			h = 0.0769957 * safezoneH;
		};
		class jetsText: RscText69
		{
			idc = 53245;

			text = "Jets:"; //--- ToDo: Localize;
			x = 0.551541 * safezoneW + safezoneX;
			y = 0.51109 * safezoneH + safezoneY;
			w = 0.0464073 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class setBtn: RscButton69
		{
			idc = 23455;
			action = "execVM 'scripts\setMission.sqf'";

			text = "Set Parameters"; //--- ToDo: Localize;
			x = 0.469076 * safezoneW + safezoneX;
			y = 0.268996 * safezoneH + safezoneY;
			w = 0.0618763 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class okBtn: RscButton69
		{
			idc = 8765;
			action = "closeDialog 1";

			text = "Close"; //--- ToDo: Localize;
			x = 0.676208 * safezoneW + safezoneX;
			y = 0.199263 * safezoneH + safezoneY;
			w = 0.037118 * safezoneW;
			h = 0.0219989 * safezoneH;
		};
		class tspText: RscText69
		{
			idc = 23455;

			text = "Transports:"; //--- ToDo: Localize;
			x = 0.293749 * safezoneW + safezoneX;
			y = 0.324069 * safezoneH + safezoneY;
			w = 0.0494906 * safezoneW;
			h = 0.0769957 * safezoneH;
		};
		class mrapText: RscText69
		{
			idc = 765454;

			text = "MRAPs:"; //--- ToDo: Localize;
			x = 0.304057 * safezoneW + safezoneX;
			y = 0.412034 * safezoneH + safezoneY;
			w = 0.0494906 * safezoneW;
			h = 0.0769957 * safezoneH;
		};
		class apcText: RscText69
		{
			idc = 53400;

			text = "APCs:"; //--- ToDo: Localize;
			x = 0.546431 * safezoneW + safezoneX;
			y = 0.412034 * safezoneH + safezoneY;
			w = 0.0593887 * safezoneW;
			h = 0.0769957 * safezoneH;
		};
		class tankText: RscText69
		{
			idc = 234554;

			text = "Tanks:"; //--- ToDo: Localize;
			x = 0.304057 * safezoneW + safezoneX;
			y = 0.51109 * safezoneH + safezoneY;
			w = 0.0593887 * safezoneW;
			h = 0.0769957 * safezoneH;
		};
		class titleText1: RscText69
		{
			idc = 76545;

			text = "Adjust Mission Parameters"; //--- ToDo: Localize;
			x = 0.451543 * safezoneW + safezoneX;
			y = 0.199263 * safezoneH + safezoneY;
			w = 0.108284 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class notetext: RscText69
		{
			idc = 64356;

			text = "Note: These settings will not go into affect until the current mission is completed or manually reset"; //--- ToDo: Localize;
			x = 0.345818 * safezoneW + safezoneX;
			y = 0.236855 * safezoneH + safezoneY;
			w = 0.337193 * safezoneW;
			h = 0.0329959 * safezoneH;
			sizeEx = 0.8  * GUI_GRID_H;
		};
		class tspCurrText: RscText69
		{
			idc = 12084;

			text = "()"; //--- ToDo: Localize;
			x = 0.34529 * safezoneW + safezoneX;
			y = 0.334971 * safezoneH + safezoneY;
			w = 0.0206254 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class tspSlider: RscXSliderH69
		{
			idc = 29085;
			onSliderPosChanged = "ctrlSetText[12084, str (sliderPosition 29085)]";
			sliderRange[] = {1,6};
			sliderStep = 1;

			x = 0.365906 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class aaCurrText: RscText69
		{
			idc = 76876;

			text = "()"; //--- ToDo: Localize;
			x = 0.577355 * safezoneW + safezoneX;
			y = 0.334971 * safezoneH + safezoneY;
			w = 0.0154691 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class aaSlider: RscXSliderH69
		{
			idc = 435654;
			onSliderPosChanged = "ctrlSetText[76876, str (sliderPosition 435654)]";
			sliderRange[] = {0,10};
			sliderStep = 1;

			x = 0.592773 * safezoneW + safezoneX;
			y = 0.34606 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class mrapCurrText: RscText69
		{
			idc = 34854;

			text = "()"; //--- ToDo: Localize;
			x = 0.34529 * safezoneW + safezoneX;
			y = 0.422936 * safezoneH + safezoneY;
			w = 0.0154691 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class tankCurrText: RscText69
		{
			idc = 45343;

			text = "()"; //--- ToDo: Localize;
			x = 0.34529 * safezoneW + safezoneX;
			y = 0.521991 * safezoneH + safezoneY;
			w = 0.0154691 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class heliCurrText: RscText69
		{
			idc = 51656;

			text = "()"; //--- ToDo: Localize;
			x = 0.34529 * safezoneW + safezoneX;
			y = 0.609957 * safezoneH + safezoneY;
			w = 0.0154691 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class apcCurrText: RscText69
		{
			idc = 131298;

			text = "()"; //--- ToDo: Localize;
			x = 0.577355 * safezoneW + safezoneX;
			y = 0.422936 * safezoneH + safezoneY;
			w = 0.0154691 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class jetCurrText: RscText69
		{
			idc = 81627;

			text = "()"; //--- ToDo: Localize;
			x = 0.577355 * safezoneW + safezoneX;
			y = 0.51109 * safezoneH + safezoneY;
			w = 0.0206254 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class mrapSlider: RscXSliderH69
		{
			idc = 26548;
			onSliderPosChanged = "ctrlSetText[34854, str (sliderPosition 26548)]";
			sliderRange[] = {1,6};
			sliderStep = 1;

			x = 0.365906 * safezoneW + safezoneX;
			y = 0.434026 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class tankSlider: RscXSliderH69
		{
			idc = 344555;
			onSliderPosChanged = "ctrlSetText[45343, str (sliderPosition 344555)]";
			sliderRange[] = {1,6};
			sliderStep = 1;

			x = 0.365906 * safezoneW + safezoneX;
			y = 0.533081 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class heliSlider: RscXSliderH69
		{
			idc = 569965;
			onSliderPosChanged = "ctrlSetText[51656, str (sliderPosition 569965)]";
			sliderRange[] = {0,10};
			sliderStep = 1;

			x = 0.365906 * safezoneW + safezoneX;
			y = 0.621047 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class apcSlider: RscXSliderH69
		{
			idc = 7678;
			onSliderPosChanged = "ctrlSetText[131298, str (sliderPosition 7678)]";
			sliderRange[] = {1,6};
			sliderStep = 1;

			x = 0.592773 * safezoneW + safezoneX;
			y = 0.434026 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class jetSlider: RscXSliderH69
		{
			idc = 16546;
			onSliderPosChanged = "ctrlSetText[81627, str (sliderPosition 16546)]";
			sliderRange[] = {0,10};
			sliderStep = 1;

			x = 0.592773 * safezoneW + safezoneX;
			y = 0.521991 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class aasqdLabel: RscText69
		{
			idc = 65058;

			text = "AA Squad:"; //--- ToDo: Localize;
			x = 0.535242 * safezoneW + safezoneX;
			y = 0.687961 * safezoneH + safezoneY;
			w = 0.0412509 * safezoneW;
			h = 0.0439947 * safezoneH;
		};
		class aasqdCombo: RscCombo69
		{
			idc = 80789;

			x = 0.579293 * safezoneW + safezoneX;
			y = 0.697359 * safezoneH + safezoneY;
			w = 0.05672 * safezoneW;
			h = 0.0219972 * safezoneH;
		};
		class jetFreqText: RscText69
		{
			idc = 65321;

			text = "Jet Freq (Min):"; //--- ToDo: Localize;
			x = 0.522026 * safezoneW + safezoneX;
			y = 0.59398 * safezoneH + safezoneY;
			w = 0.0500274 * safezoneW;
			h = 0.0470073 * safezoneH;
		};
		class jetCurrFreq: RscText69
		{
			idc = 40294;

			text = "()"; //--- ToDo: Localize;
			x = 0.577884 * safezoneW + safezoneX;
			y = 0.59398 * safezoneH + safezoneY;
			w = 0.022026 * safezoneW;
			h = 0.0469902 * safezoneH;
		};
		class jetfreqSlider: RscXSliderH69
		{
			idc = 35667;
			onSliderPosChanged = "ctrlSetText[40294, (str (sliderPosition 35667))]";
			sliderRange[] = {0,120};
			sliderStep = 5;

			x = 0.596914 * safezoneW + safezoneX;
			y = 0.603378 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class helifreqSlider: RscXSliderH69
		{
			idc = 20319;
			onSliderPosChanged = "ctrlSetText[9769, str (sliderPosition 20319)]";
			sliderRange[] = {0,60};
			sliderStep = 5;

			x = 0.367844 * safezoneW + safezoneX;
			y = 0.697359 * safezoneH + safezoneY;
			w = 0.11344 * safezoneW;
			h = 0.0329959 * safezoneH;
		};
		class helifreqCurrText: RscText69
		{
			idc = 9769;

			text = "()"; //--- ToDo: Localize;
			x = 0.345818 * safezoneW + safezoneX;
			y = 0.687961 * safezoneH + safezoneY;
			w = 0.0206254 * safezoneW;
			h = 0.0549934 * safezoneH;
		};
		class helifreqText: RscText69
		{
			idc = 42909;

			text = "Heli Freq (Min):"; //--- ToDo: Localize;
			x = 0.284146 * safezoneW + safezoneX;
			y = 0.697359 * safezoneH + safezoneY;
			w = 0.0484571 * safezoneW;
			h = 0.0375921 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};
