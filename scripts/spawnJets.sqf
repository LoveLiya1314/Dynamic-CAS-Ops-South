if (!(jetCount==0)) then {
	_ingressPoint = (selectRandom [jetSpawn0,jetSpawn1,jetSpawn2,jetSpawn3,jetSpawn4,jetSpawn5,jetSpawn6]);
	for [{_i=0}, {_i<jetCount}, {_i=_i+1}] do {
		_spawnLoc = _ingressPoint getPos [random 3000, random 360];
		_group = createGroup [eSide,true];
		_className = selectRandom ["O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","O_Plane_CAS_02_dynamicLoadout_F","I_Plane_Fighter_03_AA_F","I_Plane_Fighter_04_F","O_T_VTOL_02_infantry_dynamicLoadout_F"];
		_vehicle = createVehicle [_className, _spawnLoc, [], random 5500, "FLY"];
	
		_vehicle flyInHeight random [1000,1500,2000];

		_soldierStart = getPos as11;
		_theDriver = _group createUnit ["O_T_Pilot_F", _soldierStart,[],0,"FORM"];
		_theDriver assignAsDriver _vehicle;
		[_theDriver] orderGetIn true;
		_theDriver moveInDriver _vehicle;
		if (!(driver _vehicle == _theDriver)) then {
			deleteVehicle _theDriver;
		};
		_theGunner = _group createUnit ["O_T_Pilot_F", _soldierStart,[],0,"FORM"];
		_theGunner assignAsGunner _vehicle;
		[_theGunner] orderGetIn true;
		_theGunner moveInGunner _vehicle;
		if (!(gunner _vehicle == _theGunner)) then {
			deleteVehicle _theGunner;
		};
		_theCommander = _group createUnit ["O_T_Pilot_F", _soldierStart,[],0,"FORM"];
		_theCommander assignAsCommander _vehicle;
		[_theCommander] orderGetIn true;
		_theCommander moveInCommander _vehicle;
		if (!(commander _vehicle == _theCommander)) then {
			deleteVehicle _theCommander;
		};
	
		private _pylons = [];
		switch (_className) do {
			case "O_Plane_Fighter_02_F": {_pylons = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1"]; [_vehicle, ["CamoBlue", 0.5, "CamoGreyHex", 0.5], []] call bis_fnc_initVehicle;};
			case "O_Plane_Fighter_02_Stealth_F": {_pylons = ["","","","","","","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1"]; [_vehicle, ["CamoBlue", 0.5, "CamoGreyHex", 0.5], []] call bis_fnc_initVehicle;};
			case "I_Plane_Fighter_04_F": {_pylons = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_AMRAAM_C_x2"];[_vehicle, ["DigitalCamoGrey", 0.5, "CamoGrey", 0.5], []] call bis_fnc_initVehicle;};
			case "O_Plane_CAS_02_dynamicLoadout_F": {_pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F"];};
			case "O_T_VTOL_02_infantry_dynamicLoadout_F": {_pylons = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F"];};
			case "I_Plane_Fighter_03_AA_F": {[_vehicle, ["Grey", 0.5, "Hex", 0.5], []] call bis_fnc_initVehicle;};
	
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
			_x disableAI "FSM";
			_x addEventHandler ["GetOutMan",{params ["_x", "_role", "_vehicle", "_turret"];[_x]spawn { params ["_x"]; sleep 30; deleteVehicle _x;}}];
			_x addEventHandler ["Killed",{params ["_x", "_killer", "_instigator", "_useEffects"];[_x]spawn { params ["_x"]; sleep 30;deleteVehicle _x;};}];
		} forEach crew _vehicle;
		_vehicle addEventHandler ["Killed",{params ["_vehicle", "_killer", "_instigator", "_useEffects"];[_vehicle]spawn { params ["_vehicle"]; sleep 30;deleteVehicle _vehicle;};}];
		_vehicle addEventHandler ["GetOut", {params ["_vehicle", "_role", "_unit", "_turret"];[_vehicle]spawn { params ["_vehicle"]; sleep 30;deleteVehicle _vehicle;};}];
		jetArray pushBack _vehicle;
		publicVariable "jetArray";
		(units _vehicle) join _group;
		sleep 0.001;
	};
};

