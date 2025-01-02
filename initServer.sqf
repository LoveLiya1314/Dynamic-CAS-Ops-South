#include "scripts\missionParameters.sqf";
_bonusTix = "BonusTickets" call BIS_fnc_getParamValue;
[west,_bonusTix] call BIS_fnc_respawnTickets;

if (isMultiplayer) then {
	sleep 5;
};
sleep 41;
0 spawn compileFinal preprocessFileLineNumbers "scripts\missionHandler.sqf";
sleep 3;
0 spawn compileFinal preprocessFileLineNumbers "scripts\aircraftHandler.sqf";

0 spawn {
	while {true} do {
		zeus1 removeCuratorEditableObjects [[b1],true];
		zeus1 removeCuratorEditableObjects [[g1],true];
		zeus1 removeCuratorEditableObjects [[h1],true];
	};
	sleep 1;
};
// introCutCurrently = false;
// publicVariable "introCutCurrently";
// 0 spawn {
// 	pipcam = "camera" camCreate [-5543.615,-3999.254,75];
// 	dd1 setObjectTexture [0, "#(argb,512,512,1)r2t(piprendertg,1)"];
// 	[pipcam, -90, 0] call BIS_fnc_setPitchBank;
// 	pipcam camSetFov 2.6; 
// 	pipcam camCommit 0;
// 	sleep 30;
// 	while {true} do {
// 		if (!(introCutCurrently)) then {
// 			pipcam cameraEffect ["Terminate","back"];
// 			pipcam cameraEffect ["Internal", "Back", "piprendertg"];
// 		};
// 		sleep 10;
// 	}; 
// };

