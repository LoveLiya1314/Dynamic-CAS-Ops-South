disableserialization;
params[["_obj", objNull], ["_point", objNull], ["_types", ["Auto"]], ["_sides", ["ALL"]], ["_range", 10], ["_script", ""]];

_pointName = format["%1", _point];
missionNamespace setVariable [format["Garage_Script_%1", _pointName], _script];

_arrayGround = ["Car", "Tank", "Helicopter", "Plane", "StaticWeapon"];

//If Auto, set array depending on the point's surface. 如果是自动，则根据点的表面设置数组。
switch (_types select 0) do {
  case "Auto": {
    _types = [_arrayGround, ["Ship"]] select (surfaceIsWater (getPos _point));
  };
  case "Ground": {
    _types = _arrayGround;
  };
  case "All": {
    _types = ["Car", "Tank", "Helicopter", "Plane", "Ship", "StaticWeapon"];
  };
};

//Change icon 更改图标
_markerDesign = "respawn_unknown";
if (count _types == 1) then {
  _markerDesign = switch (_types select 0) do {
    case "Car": {
      "respawn_motor";
    };
    case "Tank": {
      "respawn_armor";
    };
    case "Helicopter": {
      "respawn_air";
    };
    case "Plane": {
      "respawn_plane";
    };
    case "Ship": {
      "respawn_naval";
    };
    default {
      "respawn_unknown";
    };
  };
};

//Set markers 设置标记
_markerRange = createMarker [format["Marker_%1_Range", _pointName], _point];
_markerRange setMarkerShape "ELLIPSE";
_markerRange setMarkerSize [20,20];

_markerPointName = ((_pointName splitString "_")-["GP"]) joinString " ";
_markerName = createMarker [format["Marker_%1_Name", _pointName], _point];
_markerName setMarkerText _markerPointName;
_markerName setMarkerType _markerDesign;

_obj addAction [format["<t color='#FFFF00'>Spawn Jets</t>", _markerPointName], {
    _params = _this select 3;
    _sides = _params select 2;

    _sideText = switch (side player) do {
      case west; case blufor : {"BLUFOR"};
      case east; case opfor : {"OPFOR";};
      case independent; case resistance : {"INDEP";};
      case civilian : {"CIV";};
      default {"NONE";};
    };

    if ((_sides select 0) == "ALL" || _sideText in _sides) then {
      [_params select 0, _params select 1] call kbf_fnc_garageLoad;
    } else {
      ["Disabled this spawner in your side."] call BIS_fnc_guiMessage;
    };
  },
  [_point, _types, _sides],
  1.5,
  true,
  true,
  "",
  "true",
  _range
];

_obj addAction[format["<t color='#00ffff'>Clear spawn of vehicles</t>", _markerPointName],{
    _vehicles = ((_this select 3) nearObjects ["AllVehicles", 20]) + ((_this select 3) nearObjects ["#particlesource", 20]);

    {
      _nowvehicle = _x;
      _vehVarName = vehicleVarName _nowvehicle;
      _defaultVeh = "DFV" in (_vehVarName splitString "_");
      if (!(_x isKindOf "Man") && !_defaultVeh) then
      {
        {_nowvehicle deleteVehicleCrew _x} forEach crew _nowvehicle;
        deleteVehicle _x;
      };
    } forEach _vehicles;

  },
  _point,
  1.5,
  true,
  true,
  "",
  "true",
  _range
];

_obj addAction["<t color='#ff9500'>Reset Garage Flag</t>",{
    _marker = vehicleVarName (_this select 3);
    missionNamespace setVariable [format["Open_Garage_%1", _marker], false, true];
  },
  _point,
  1.5,
  true,
  true,
  "",
  "true",
  _range
];
