jetHandler = 0 spawn {};
heliHandler = 0 spawn {};

jetReset = {
	b1 removeAction resjetAction;
	"敌方喷气式飞机已被远程重置" remoteExec ["systemChat"];
	terminate jetHandler;
	{deleteVehicleCrew _x; deleteVehicle _x;} forEach jetArray;
	jetArray = [];
	publicVariable "jetArray";
	sleep 3;
	resjetAction = b1 addAction ["<t color='#ffea00'>重置敌方战机</t>", {0 spawn jetReset;}];
};

heliReset = {
	b1 removeAction resheliAction;
	"敌方直升机已被远程重置" remoteExec ["systemChat"];
	terminate heliHandler;
	{deleteVehicleCrew _x; deleteVehicle _x;} forEach heliArray;
	heliArray = [];
	publicVariable "heliArray";
	sleep 3;
	resheliAction = b1 addAction ["<t color='#00ff2a'>重置敌方直升机</t>", {0 spawn heliReset;}];
};

0 spawn {
	call compileFinal preprocessFileLineNumbers "scripts\spawnJets.sqf";
	"敌方战机已经出现" remoteExec ["systemChat"];
	["喷气式飞机"] spawn compileFinal preprocessFileLineNumbers "scripts\createWaypoints.sqf";
	while {true} do {
		sleep 1;
		if (!(jetCount == 0) && ((count (jetArray select {alive _x})) isEqualTo 0)) then {
			jetHandler = 0 spawn {
				"敌方喷射波已清除" remoteExec ["systemChat"];
				((str jetSleepTimer) + "敌机重生前剩余时间") remoteExec ["systemChat"];
				jetArray = [];
				publicVariable "jetArray";
				sleep (jetSleepTimer * 60);
				call compileFinal preprocessFileLineNumbers "scripts\spawnJets.sqf";
				"敌方战机已经出现" remoteExec ["systemChat"];
				["喷气式飞机"] spawn compileFinal preprocessFileLineNumbers "scripts\createWaypoints.sqf";
			};
			waitUntil { scriptDone jetHandler };
		};
	};
};

resjetAction = b1 addAction ["<t color='#ffea00'>重置敌方战机</t>", {0 spawn jetReset;}];

sleep 1;
0 spawn {
	call compileFinal preprocessFileLineNumbers "scripts\spawnHeli.sqf";
	"敌方直升机已经出现" remoteExec ["systemChat"];
	["直升机"] spawn compileFinal preprocessFileLineNumbers "scripts\createWaypoints.sqf";
	while {true} do {
		sleep 1;
		if (!(heliCount == 0) && ((count (heliArray select {alive _x})) isEqualTo 0)) then {
			heliHandler = 0 spawn {
				"敌方直升机部队已清除" remoteExec ["systemChat"];
				((str heliSleepTimer) + " 敌方直升机重生前的最短时间") remoteExec ["systemChat"];       
				heliArray = [];
				publicVariable "heliArray";
				sleep (heliSleepTimer * 60);
				call compileFinal preprocessFileLineNumbers "scripts\spawnHeli.sqf";
				"敌方直升机已经出现" remoteExec ["systemChat"];
				["直升机"] spawn compileFinal preprocessFileLineNumbers "scripts\createWaypoints.sqf";
			};
			waitUntil { scriptDone heliHandler };
		};
	};
};

resheliAction = b1 addAction ["<t color='#00ff2a'>重置敌方直升机</t>", {0 spawn heliReset;}];

0 spawn {
	while {true} do {
		sleep 30;
		_acArrays = jetArray + heliArray;
		{
			[_x] spawn {
				params ["_x"];
				try {
					_pylonCount = count (getAllPylonsInfo _x);
					for "_i" from 1 to _pylonCount do {
						if (_x ammoOnPylon _i  == 0 && (_x getVariable ["Pylon" + str (_i),0]) == 0) then {
							[_x,_i] spawn {
								params ["_x","_i"];
								try {
									_x setVariable ["Pylon" + str (_i),1];
									sleep 700;
									_x setAmmoOnPylon [_i, 6];
									_x setVariable ["Pylon" + str (_i),0];
								} catch {};
							};
						};
						sleep 0.1;
					};
				} catch {};
			};
			sleep 0.1;
		} forEach _acArrays;
	};
};