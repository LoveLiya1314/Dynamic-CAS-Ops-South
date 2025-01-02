//introCutCurrently = true;
//publicVariable "introCutCurrently";
params ["_cam"];

_cam camSetTarget getPos camt1;
_cam camCommit 0;

_cam cameraEffect ["internal", "BACK"];

_cam camSetPos ((getPos cam1) vectorAdd [0,0,800]);
_cam camCommit 15;
sleep 15;

"thelayer" cutRsc ["introLogo","plain",0];

_cam camSetTarget spawn1;
_cam camSetPos ((getPos cam2) vectorAdd [0,0,120]);
_cam camCommit 15;

sleep 8;
"thelayer" cutFadeOut 5;
sleep 8;


_cam camSetPos ((getPos cam3) vectorAdd [0,0,120]);
_cam camCommit 1.5;

sleep 1.5;


_cam camSetPos ((getPos cam4) vectorAdd [0,0,120]);
_cam camCommit 1.5;

sleep 1.5;

_cam camSetPos ((getPos cam5) vectorAdd [0,0,120]);
_cam camCommit 1.5;

sleep 1.5;
_cam camSetPos ((getPos cam6) vectorAdd [0,0,120]);
_cam camCommit 1.5;

sleep 1.5;
_cam camSetPos ((getPos cam7) vectorAdd [0,0,120]);
_cam camCommit 1.5;

sleep 1.5;
_cam camSetPos ((getposASL spawn1) vectorAdd [0,0,3]);
_cam camCommit 3;

sleep 3;
_cam CameraEffect ["Terminate","back"];
CamDestroy _cam;
//introCutCurrently = false;
//publicVariable "introCutCurrently";