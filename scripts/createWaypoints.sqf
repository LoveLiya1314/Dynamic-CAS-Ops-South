params ["_type"];

_theArray = [];
_locationDistance = 0;

if (_type == "Jet") then {
	_theArray = jetArray;
	_locationDistance = 2000;
} else {
	_theArray = heliArray;
	_locationDistance = 1000;
};

if (((count _theArray) > 0) && (count (_theArray select {alive _x}) > 0)) then {
		_aliveVeh = (_theArray select {alive _x});
		{
			while {(count (waypoints (group _x))) > 0} do {deleteWaypoint ((waypoints (group _x)) select 0);};
			sleep 0.001;
		} forEach _aliveVeh;		
		{
			[(group _x),aoLocation,_locationDistance] call BIS_fnc_taskPatrol; 
			{
				_x setWaypointSpeed "NORMAL";
				_x setWaypointPosition [waypointPosition _x, -1];
			} forEach waypoints group _x;
			group _x setCombatMode "RED";
			group _x setBehaviour "COMBAT";
			group _x setSpeedMode "NORMAL";
			sleep 0.001;
		} forEach _aliveVeh;		
};