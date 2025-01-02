params ["_player", "_didJIP"];
_introCutsc = compileFinal preprocessFileLineNumbers "scripts\introCutsc.sqf";
_infoHud = compileFinal preprocessFileLineNumbers "scripts\infoHud.sqf";
if (isMultiplayer) then
{
	sleep 1;
};
waitUntil {lifeState _player != "DEAD-RESPAWN"};
playMusic "MyIntro";

_cam = "camera" camCreate [9335,15754,100];
//findDisplay 46 setVariable[ "TAG_theCam", _cam];
_introHandle = [_cam] spawn _introCutsc;
//findDisplay 46 displayAddEventHandler ["MouseButtonDown", {params[ "_display"]; _cam = _display getVariable "TAG_theCam"; hint "hello"; terminate _introHandle; _cam CameraEffect ["Terminate","back"]; CamDestroy _cam;}];
waitUntil { scriptDone _introHandle };
//findDisplay 46 displayRemoveEventHandler ["MouseButtonDown",5];
15 fadeMusic 0;
sleep 7;
0 spawn _infoHud;

[_player] spawn {
	params ["_player"];
	_actionHandle = 6969;
	while {true} do {
		sleep 1;
		_pos = getPos _player;
		if (((isNull objectParent _player)) && (!(_pos inArea carrierArea))) then {
			if (_actionHandle == 6969) then {
				_actionHandle = _player addAction["Teleport to carrier", {
					params ["_target", "_caller", "_actionId", "_arguments"];
					while {true} do {
						_newPos = spawn1 getPos [4 * sqrt random 1, random 360];
						_newPos set [2, ((getPosASL spawn1) select 2)];
						if (((count (_newPos nearEntities 1)) == 0)) exitWith {
							_caller setPosASL _newPos;
							_caller setDir (getDir spawn1);
						};
						sleep 0.1;
					};
				}];
			};		
		} else {
			try {
				_player removeAction _actionHandle;
			} catch {};
			_actionHandle = 6969;
		};
	};
};