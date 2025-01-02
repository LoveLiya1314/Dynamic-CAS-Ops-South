missionLocationArray = [];
publicVariable "missionLocationArray";
missionLocationIndex = 0;
publicVariable "missionLocationIndex";

missionReset1 = {
	"The mission has been remotely reset" remoteExec ["systemChat"];
	waveClear = true; 
	publicVariable "waveClear"; 
	waveNum = waveNum+1; 
	publicVariable "waveNum"; 
	pressed1 = true; 
	publicVariable "pressed1";
	b1 removeAction editId;
	b1 removeAction resetId;
};

0 spawn {
	_missionGen = compileFinal preprocessFileLineNumbers "scripts\DynamicCASGenerator.sqf";
	_createWaypoints = compileFinal preprocessFileLineNumbers "scripts\createWaypoints.sqf";
	_trg = 0;
	pressed1 = false;
	publicVariable "pressed1";
	while {true} do {
		if (waveClear) then {       
			if (waveNum > 1) then {
				[missionNamespace getvariable 'currTask',"SUCCEEDED",true] call BIS_fnc_taskSetState; 
				deleteMarker "ao"; 
				deleteVehicle _trg;
				_trg = 0;
				{deleteVehicleCrew _x; deleteVehicle _x;} forEach guardArray;
				guardArray = [];
				publicVariable "guardArray";
				{{deleteVehicle _x} forEach units _x; deleteGroup _x;} forEach infArray;
				infArray = [];
				publicVariable "infArray";
				aaArray = [];
				publicVariable "aaArray";
				tsArray = [];
				publicVariable "tsArray";
				mrapArray = [];
				publicVariable "mrapArray";
				apcArray = [];
				publicVariable "apcArray";
				tankArray = [];
				publicVariable "tankArray";
				if (!(pressed1)) then {
					b1 removeAction editId;
					b1 removeAction resetId;
					[west, 2] call BIS_fnc_respawnTickets;
					if (waveNum-1 == "NumMissions" call BIS_fnc_getParamValue) then {
						"Mission Complete, no targets remaining." remoteExec ["systemChat"];
						"SideWon" call BIS_fnc_endMission;
						sleep 6000;
					} else {
						"Enemies destroyed successfully!" remoteExec ["systemChat"]; 
					};
				};
				if ((pressed1)) then {
					pressed1 = false;
					publicVariable "pressed1";
				};								
			};
			"Generating Dynamic CAS Targets!" remoteExec ["systemChat"];
			scopeName "main";
			while {true} do {
				scopeName "second";
				_missionHandle = 0 spawn _missionGen;
				_time = 0;
				while {true} do {
					sleep 1;
					if (scriptDone _missionHandle) then {
						breakTo "main";
					} else {
						_time = _time + 1;
						if (_time >= 15) then {
							terminate _missionHandle;
							{deleteVehicleCrew _x; deleteVehicle _x;} forEach guardArray;
							guardArray = [];
							publicVariable "guardArray";
							aaArray = [];
							publicVariable "aaArray";
							tsArray = [];
							publicVariable "tsArray";
							mrapArray = [];
							publicVariable "mrapArray";
							apcArray = [];
							publicVariable "apcArray";
							tankArray = [];
							publicVariable "tankArray";
							{{deleteVehicle _x} forEach units _x; deleteGroup _x;} forEach infArray;
							infArray = [];
							publicVariable "infArray";
							breakTo "second";
						};  
					};
				};
			};
			waveClear = false;
			publicVariable "waveClear";

			// _campos = aoLocation;
			// _campos set [2,150];  
			// pipcam setpos _campos;
			// pipcam camCommit 0;

			createMarker ["ao", aoLocation];
			"ao" setMarkerBrush "Solid";
			"ao" setMarkerColor "ColorRed";
			"ao" setMarkerShape "ELLIPSE";
			"ao" setMarkerAlpha 0.5;
			"ao" setMarkerSize [300,300];

			_taskN = "mission" + format ["%1", waveNum];
			missionNamespace setVariable ["currTask",_taskN,true];
			_taskDescription = "CAS Mission " + format ["%1", waveNum];

			[west,missionNamespace getvariable 'currTask',["Destroy all hostile vehicles in the area",_taskDescription,"ao"],aoLocation,true,2,true,"destroy",false] call BIS_fnc_taskCreate;
			[missionNamespace getvariable 'currTask',"ASSIGNED",true] call BIS_fnc_taskSetState;
					
			_trg = createTrigger ["EmptyDetector",aoLocation];
			_trg setTriggerType "NONE";
			_trg setTriggerArea [300,300,0,false];
			_trg setTriggerTimeout [1,1,1,false];
			_trg setTriggerActivation ["ANY","PRESENT",false];
			_trg setTriggerStatements ["(count (thisList select {alive _x && _x iskindOf ""LandVehicle""}) isEqualTo 0)",
			"if (isServer) then {waveClear = true; publicVariable ""waveClear""; waveNum = waveNum+1; publicVariable ""waveNum"";}; ",
			""];

			editId = b1 addAction ["<t color='#00ffff'>Edit Mission Parameters</t>",{execVM "scripts\openDialog.sqf"}];
			resetId = b1 addAction ["<t color='#fc03f0'>Reset Mission</t>", {params ["_target", "_caller", "_actionId", "_arguments"];[b1] spawn missionReset1;}];
			
			["Jet"] spawn _createWaypoints;
			["Heli"] spawn _createWaypoints;
		};
		sleep 1;
	};
};

0 spawn {
	_aaMissileArray = ["4Rnd_Titan_long_missiles_O","4Rnd_70mm_SAAMI_missiles"];
	while {true} do {
		sleep 10;
		{
			_vehAmmo = 0;
			{
				if ((_x select 0) in _aaMissileArray) then {
					_vehAmmo = _vehAmmo + (_x select 1);
				};
				sleep 0.1;
			} forEach (magazinesAmmo [_x,true]);
			if ((_vehAmmo == 0) && ((_x getVariable ["reloading",0]) == 0)) then {
				[_x] spawn {
					params ["_x"];
					try {
						_x setVariable ["reloading", 1];
						sleep 700;
						_x setVariable ["reloading", 0];
						_x setVehicleAmmoDef 1;
					} catch {};
				};
			};
			sleep 1;
		} forEach aaArray;
	};
};

0 spawn {
	sleep 30; 
	while {true} do {
		private _deadguys = allDead;
		sleep 30;
		{
			deleteVehicle _x;
			sleep 1;
		} forEach _deadguys;
	};
};

0 spawn {
	sleep 30; 
	while {true} do {
		_arrays = guardArray + jetArray + heliArray;
		{
			if ((({alive _x} count crew _x) == 0) && ((_x getVariable ["markedforDelete",0])==0)) then {
				[_x] spawn {
					params ["_x"];
					_x setVariable ["markedforDelete", 1, true]; 
					sleep 15;
					if (({alive _x} count crew _x) == 0) then {
						deleteVehicle _x;
					};
				};
			};
			sleep 1;
		} forEach _arrays;
	};
};