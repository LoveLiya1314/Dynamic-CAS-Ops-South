#include "defines.h"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a character is entered it is validated and changes the
	correct slider it is associated with. I probably over-complicated
	this more then I had to but onChar behaves weird.
	
	PARAMS:
		0: CONTROL
		1: SCALAR (INT)
		2: STRING (Case option)
	作者：Bryan "Tonic" Boardwine

	描述：
	当输入一个字符时，它会被验证并更改与之关联的
	正确滑块。我可能把这个复杂化了，但 onChar 的行为很奇怪。

	参数：
		0：控制
		1：标量（INT）
		2：字符串（大小写选项）
	*/
private["_value","_varName","_maxRange"];
params ["_control","_code","_slider"];

disableSerialization;
if(isNull _control) exitWith {}; //POOOOOP

_maxRange = if(!isNil "tawvd_maxRange") then {tawvd_maxRange} else {20000};
_value = parseNumber (ctrlText _control);
if(_value > _maxRange OR _value < 100) exitwith {[] call TAWVD_fnc_openMenu;};

_varName = switch (_slider) do {
	case "ground": {"tawvd_foot"};
	case "vehicle": {"tawvd_car"};
	case "air": {"tawvd_air"};
	case "object": {"tawvd_object"};
	case "drone": {"tawvd_drone"};
	default {"tawvd_foot"};
};

SVAR_MNS [_varName,_value];
[] call TAWVD_fnc_updateViewDistance;
[] call TAWVD_fnc_openMenu;