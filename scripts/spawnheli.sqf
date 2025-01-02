if (!(heliCount==0)) then {
	_spawnPos = [(aoLocation select 0),(aoLocation select 1)] getPos [5, random 360];
	_spawnPos set [2, 1000];
	for [{_i=0}, {_i<heliCount}, {_i=_i+1}] do {
		_group = createGroup [eSide,true];
		_className = selectRandom ["O_Heli_Attack_02_dynamicLoadout_black_F","B_Heli_Attack_01_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F","I_Heli_light_03_dynamicLoadout_F"];
		_vehicle = createVehicle [_className, _spawnPos, [], 8000, "FLY"];
		_vehicle flyInHeight random [300,400,500];
		
		_soldierStart = getPos as11;
		_theDriver = _group createUnit ["O_T_Helipilot_F", _soldierStart,[],0,"FORM"];
		_theDriver assignAsDriver _vehicle;
		[_theDriver] orderGetIn true;
		_theDriver moveInDriver _vehicle;
		if (!(driver _vehicle == _theDriver)) then {
			deleteVehicle _theDriver;
		};
		_theGunner = _group createUnit ["O_T_Helicrew_F", _soldierStart,[],0,"FORM"];
		_theGunner assignAsGunner _vehicle;
		[_theGunner] orderGetIn true;
		_theGunner moveInGunner _vehicle;
		if (!(gunner _vehicle == _theGunner)) then {
			deleteVehicle _theGunner;
		};
		_theCommander = _group createUnit ["O_T_Helicrew_F", _soldierStart,[],0,"FORM"];
		_theCommander assignAsCommander _vehicle;
		[_theCommander] orderGetIn true;
		_theCommander moveInCommander _vehicle;
		if (!(commander _vehicle == _theCommander)) then {
			deleteVehicle _theCommander;
		};
		
		private _pylons = [];
		switch (_className) do {
			case "O_Heli_Attack_02_dynamicLoadout_black_F": {_pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F"];};
			case "O_Heli_Light_02_dynamicLoadout_F": {_pylons = ["PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles"]; [_vehicle, "BlackCustom", []] call bis_fnc_initVehicle;};
			case "B_Heli_Attack_01_dynamicLoadout_F": {_pylons = ["PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles","PylonMissile_1Rnd_AAA_missiles"];};
			case "I_Heli_light_03_dynamicLoadout_F": {_pylons = ["PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles"];[_vehicle, "Green", []] call bis_fnc_initVehicle;};
		};
		private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
		{ _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _vehicle;
		{ _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex] } forEach _pylons;
		_vehicle setVehicleRadar 1;
		_vehicle setVehicleReportRemoteTargets true;
		_vehicle setVehicleReceiveRemoteTargets true;
		_vehicle setVehicleReportOwnPosition true;
		_vehicle allowCrewInImmobile true;
		_vehicle lock true;
		{
			_x addEventHandler ["GetOutMan",{params ["_x", "_role", "_vehicle", "_turret"];deleteVehicle _x;}];
			_x addEventHandler ["Killed",{params ["_x", "_killer", "_instigator", "_useEffects"];[_x]spawn { params ["_x"]; sleep 30;deleteVehicle _x;};}];
		} forEach crew _vehicle;
		_vehicle addEventHandler ["Killed",{params ["_vehicle", "_killer", "_instigator", "_useEffects"];[_vehicle]spawn { params ["_vehicle"]; sleep 30;deleteVehicle _vehicle;};}];
		_vehicle addEventHandler ["GetOut", {params ["_vehicle", "_role", "_unit", "_turret"];[_vehicle]spawn { params ["_vehicle"]; sleep 30;deleteVehicle _vehicle;};}];
		heliArray pushBack _vehicle;
		publicVariable "heliArray";
		(units _vehicle) join _group;
		sleep 0.001;
	};
};