////////////////////////////////////////////////////////////////////////
//////////////Dynamic CAS AO Generator by thehungryhippo////////////////
////////////////////////////////////////////////////////////////////////


// Vehicle Classnames
_eastTransportClassnames = ["O_T_Truck_02_fuel_F","O_T_Truck_02_Ammo_F","O_T_Truck_02_Medical_F","O_T_Truck_03_ammo_F","O_T_Truck_03_repair_ghex_F","O_T_Truck_03_device_ghex_F","I_Truck_02_covered_F","I_Truck_02_transport_F","I_Truck_02_ammo_F","I_Truck_02_box_F","I_Truck_02_fuel_F"];

_mrapClassnames = ["O_T_MRAP_02_hmg_ghex_F","O_T_MRAP_02_gmg_ghex_F","I_E_Truck_02_MRL_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","O_T_LSV_02_armed_F","I_MRAP_03_F"];

_eastAPCClassnames = ["O_T_APC_Tracked_02_cannon_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F"];

_allAAClassnames = ["O_T_APC_Tracked_02_AA_ghex_F","I_LT_01_AA_F"];

_eastTankClassnames = ["O_T_MBT_02_cannon_ghex_F","O_T_MBT_04_command_F","O_T_MBT_02_arty_ghex_F","I_MBT_03_cannon_F","I_LT_01_AT_F","I_LT_01_scout_F","I_LT_01_cannon_F"];

_eastInfClassnames = ["O_T_Soldier_AA_F","O_T_Soldier_AAA_F","O_T_Soldier_AA_F","O_T_Soldier_AA_F"];

_randLoc = [];
 
_mapSize = if (isNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize")) 
then {getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");} 
else {15360;};

_infantry = aaSquad;
_transports = tspCount;
_mraps = mrapCount;
_apcs = apcCount;
_aa = aaCount;
_tanks = tankCount;


//Location checker: Check if AO is suitable 位置检查器：检查 AO 是否合适
scopeName "main";
while {true} do {
    _randLoc = [(_mapSize/2),(_mapSize/2)] getPos [((_mapSize/2) * random 1), random 360];
	if (!(_randLoc isFlatEmpty [15, -1, 0.9, 20, 0, false] isEqualTo [])) then {
		_isValid = true;
		{if ((_randLoc distance _x) <= 2000) exitWith {
			_isValid = false;
		};} foreach missionLocationArray;
		if (_isValid) then {
			for '_i' from 0 to 360 step 10 do {
				_ckPos = _randLoc getPos [300,_i];
				if (surfaceIsWater _ckPos) exitWith {_isValid = false;}
			};
			if (_isValid) then {
				breakTo "main";
			};
		};
	};

	//for livonia
	//if ((_randLoc select 0 <= _mapSize) && (_randLoc select 1 <= _mapSize) && (_randLoc select 0 >= 0)  && (_randLoc select 1 >= 0)) then {};
	//{if(_randLoc inArea _x) exitWith {_isValid = false;};} forEach _islandArray;
    
};
aoLocation = _randLoc;

// Functions to handle previous locations 处理先前位置的函数
if ((count missionLocationArray) >= 7) then {
	missionLocationArray set [missionLocationIndex, _randLoc];
} else {
	missionLocationArray pushback _randLoc;
};
if (missionLocationIndex >= 6) then {
	missionLocationIndex = 0
} else {
	missionLocationIndex = missionLocationIndex + 1;
};

_generator = {
	params ["_amount","_type","_feParam"];
	_theGroup = createGroup [eSide,true];
	if (_type == "infantry") then {
		for [{_i=0}, {_i<_amount}, {_i=_i+1}] do {
			_spawnLoc = [];
			while {true} do {
				_spawnLoc = [(_randLoc select 0),(_randLoc select 1)] getPos [300 * sqrt random 1, random 360];
				if ((!(_spawnLoc isFlatEmpty _feParam isEqualTo [])) && ((count (_spawnLoc nearEntities 3)) == 0)) exitWith {};
			};
			_className = selectRandom _eastInfClassnames;
			_theGroup createUnit [_className, _spawnLoc,[],0,"FORM"];	
			infArray pushBack _theGroup;
			publicVariable "infArray";
			sleep 0.01;
		};
		[_theGroup,_randLoc,300] call BIS_fnc_taskPatrol;
	} else {
		for [{_i=0}, {_i<_amount}, {_i=_i+1}] do {
			_className = "";
			switch (_type) do {
				case "transport": {_className = selectRandom _eastTransportClassnames;};
				case "mrap": {_className = selectRandom _mrapClassnames;};
				case "apc": {_className = selectRandom _eastAPCClassnames;};
				case "aa": {_className = selectRandom _allAAClassnames;};
				case "tank": {_className = selectRandom _eastTankClassnames;};
			};
			_spawnLoc = [];
			while {true} do {
				//Before the vehicle is spawned, checks are done to make sure the location is relatively flat, and makes sure there arent any vehicles or objects
				//This is to reduce occurences of vehicles exploding when spawning
				_spawnLoc = [(_randLoc select 0),(_randLoc select 1)] getPos [300 * sqrt random 1, random 360];
				if ((!(_spawnLoc isFlatEmpty _feParam isEqualTo [])) && (count (_spawnLoc nearEntities random [30,40,55]) == 0) && (count (nearestTerrainObjects [_spawnLoc,["Tree", "Building", "House", "ROCK", "WALL", "POWER LINES", "FENCE", "HIDE", "FUELSTATION", "CHURCH", "WATERTOWER","TRANSMITTER", "SHIPWRECK", "TOURISM", "HIDE"], 10]) == 0)) exitWith {};
			};
			_veh = _className createVehicle (_spawnLoc vectorAdd [0,0,2]);
			_veh setUnloadInCombat [FALSE,FALSE];
			_veh lock true;
			[_veh, "Indep_02", ["showcamonethull", 0.5, "showcamonetturret", 0.5, "showcamonetcannon", 0.5, "showcamonetcannon1", 0.5, "showslathull", 0.5, "showslatturret", 0.5, "showcamonetplates1", 0.5, "showcamonetplates2", 0.5]] call bis_fnc_initVehicle;
			_soldierStart = getPos as11;
			if (_type == "transport") then {
				_theDriver = _theGroup createUnit ["O_T_Crew_F", _soldierStart,[],0,"FORM"];
				_theDriver assignAsDriver _veh;
				[_theDriver] orderGetIn true;
				_theDriver moveInDriver _veh;
				if (!(driver _veh == _theDriver)) then {
					deleteVehicle _theDriver;
				};
				_theDriver disableAI "all";
			} else {
				_theGunner = _theGroup createUnit ["O_T_Crew_F", _soldierStart,[],0,"FORM"];
				_theGunner assignAsGunner _veh;
				[_theGunner] orderGetIn true;
				_theGunner moveInGunner _veh;
				if (!(gunner _veh == _theGunner)) then {
					deleteVehicle _theGunner;
				};
				_theCommander = _theGroup createUnit ["O_T_Crew_F", _soldierStart,[],0,"FORM"];
				_theCommander assignAsCommander _veh;
				[_theCommander] orderGetIn true;
				_theCommander moveInCommander _veh;
				if (!(commander _veh == _theCommander)) then {
					deleteVehicle _theCommander;
				};
			};
			switch (_type) do {
				case "transport": {tsArray pushBack _veh; publicVariable "tsArray";};
				case "mrap": {mrapArray pushBack _veh; publicVariable "mrapArray";};
				case "apc": {apcArray pushBack _veh; publicVariable "apcArray";};
				case "aa": {aaArray pushBack _veh; publicVariable "aaArray";};
				case "tank": {tankArray pushBack _veh; publicVariable "tankArray";};
			};
			
		    _veh setVehicleRadar 1;
			_veh setVehicleReportRemoteTargets true;
			_veh setVehicleReceiveRemoteTargets true;
			_veh setVehicleReportOwnPosition true;
		    _veh engineOn true;
		    _veh allowCrewInImmobile true;
		    {
				_x disableAI "FSM";
				_x addEventHandler ["GetOutMan",{params ["_x", "_role", "_vehicle", "_turret"];deleteVehicle _x;}];
				_x addEventHandler ["Killed",{params ["_x", "_killer", "_instigator", "_useEffects"];[_x]spawn { params ["_x"]; sleep 30;deleteVehicle _x;};}];
		    } forEach crew _veh;
		    _veh addEventHandler ["GetOut", {params ["_veh", "_role", "_unit", "_turret"];[_veh]spawn { params ["_veh"]; sleep 30;deleteVehicle _veh;};}];
			_veh addEventHandler ["Killed",{params ["_veh", "_killer", "_instigator", "_useEffects"];[_veh]spawn { params ["_veh"]; sleep 30;deleteVehicle _veh;};}];
		    guardArray pushBack _veh;
			publicVariable "guardArray";
		    _veh setDir (random 360);
			_theGroup setCombatMode "RED";
			_theGroup setBehaviour "COMBAT";
		    sleep 0.001;
		};
	};
};

if (!(_transports==0)) then {
	[_transports,"transport", [10, -1, 0.65, 6, 0, false]] call _generator;
};
if (!(_mraps==0)) then {
	[_mraps,"mrap", [10, -1, 0.7, 6, 0, false]] call _generator;
};
if (!(_apcs==0)) then {
	[_apcs,"apc", [10, -1, 0.7, 6, 0, false]] call _generator;
};
if (!(_aa==0)) then {
	[_aa,"aa", [10, -1, 0.8, 6, 0, false]] call _generator;
};
if (!(_tanks==0)) then {
	[_tanks,"tank", [10, -1, 0.8, 8, 0, false]] call _generator;
};
if (_infantry==1) then {
	[random [5,7,8],"infantry", [3, -1, 0.2, 2, 0, false]] call _generator;
};

"Dynamic Targets created, give them hell!" remoteExec ["systemChat"];