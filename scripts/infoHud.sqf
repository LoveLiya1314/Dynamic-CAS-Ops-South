"infoLayer" cutRsc ["infoHud","plain",0];
while {true} do {

    0 spawn {
        _vehAmount = count (guardArray select {alive _x});
        _vehCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 54334);
        if (!(ctrlText _vehCtrl isEqualTo str _vehAmount)) then {
            if (parseNumber (ctrlText _vehCtrl) > _vehAmount) then{
                _vehCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _vehCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _vehCtrl ctrlSetFade 1;
            _vehCtrl ctrlCommit 0.5;
            sleep 0.5;
            _vehCtrl ctrlSetText str _vehAmount;
            _vehCtrl ctrlSetFade 0;
            _vehCtrl ctrlCommit 0.5;
            sleep 1;
            _vehCtrl ctrlSetTextColor [1,1,1,1];
        };
    };

    0 spawn {
        _aaCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 3678);
        _aaAmount = count (aaArray select {alive _x});
        if (!(ctrlText _aaCtrl isEqualTo str _aaAmount)) then {
            if (parseNumber (ctrlText _aaCtrl) > _aaAmount) then{
                _aaCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _aaCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _aaCtrl ctrlSetFade 1;
            _aaCtrl ctrlCommit 0.5;
            sleep 0.5;
            _aaCtrl ctrlSetText str _aaAmount;
            _aaCtrl ctrlSetFade 0;
            _aaCtrl ctrlCommit 0.5;
            sleep 1;
            _aaCtrl ctrlSetTextColor [1,1,1,1];
        };
    };

    0 spawn {
        _tsCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 02988);
        _tsAmount = count (tsArray select {alive _x});
        if (!(ctrlText _tsCtrl isEqualTo str _tsAmount)) then {
            if (parseNumber (ctrlText _tsCtrl) > _tsAmount) then{
                _tsCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _tsCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _tsCtrl ctrlSetFade 1;
            _tsCtrl ctrlCommit 0.5;
            sleep 0.5;
            _tsCtrl ctrlSetText str _tsAmount;
            _tsCtrl ctrlSetFade 0;
            _tsCtrl ctrlCommit 0.5;
            sleep 1;
            _tsCtrl ctrlSetTextColor [1,1,1,1];
        };
    };

    0 spawn {
        _mrapCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 10984);
        _mrapAmount = count (mrapArray select {alive _x});
        if (!(ctrlText _mrapCtrl isEqualTo str _mrapAmount)) then {
            if (parseNumber (ctrlText _mrapCtrl) > _mrapAmount) then{
                _mrapCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _mrapCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _mrapCtrl ctrlSetFade 1;
            _mrapCtrl ctrlCommit 0.5;
            sleep 0.5;
            _mrapCtrl ctrlSetText str _mrapAmount;
            _mrapCtrl ctrlSetFade 0;
            _mrapCtrl ctrlCommit 0.5;
            sleep 1;
            _mrapCtrl ctrlSetTextColor [1,1,1,1];
        };
    };

    0 spawn {
        _apcCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 98912);
        _apcAmount = count (apcArray select {alive _x});
        if (!(ctrlText _apcCtrl isEqualTo str _apcAmount)) then {
            if (parseNumber (ctrlText _apcCtrl) > _apcAmount) then{
                _apcCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _apcCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _apcCtrl ctrlSetFade 1;
            _apcCtrl ctrlCommit 0.5;
            sleep 0.5;
            _apcCtrl ctrlSetText str _apcAmount;
            _apcCtrl ctrlSetFade 0;
            _apcCtrl ctrlCommit 0.5;
            sleep 1;
            _apcCtrl ctrlSetTextColor [1,1,1,1];
        };
    };

    0 spawn {
        _tankCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 54671);
        _tankAmount = count (tankArray select {alive _x});
        if (!(ctrlText _tankCtrl isEqualTo str _tankAmount)) then {
            if (parseNumber (ctrlText _tankCtrl) > _tankAmount) then{
                _tankCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _tankCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _tankCtrl ctrlSetFade 1;
            _tankCtrl ctrlCommit 0.5;
            sleep 0.5;
            _tankCtrl ctrlSetText str _tankAmount;
            _tankCtrl ctrlSetFade 0;
            _tankCtrl ctrlCommit 0.5;
            sleep 1;
            _tankCtrl ctrlSetTextColor [1,1,1,1];
        };
    };

    0 spawn {
        _jetCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 345325);
        _JetAmount = count (jetArray select {alive _x});
        if (!(ctrlText _jetCtrl isEqualTo str _JetAmount)) then {
            if (parseNumber (ctrlText _jetCtrl) > _JetAmount) then{
                _jetCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _jetCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _jetCtrl ctrlSetFade 1;
            _jetCtrl ctrlCommit 0.5;
            sleep 0.5;
            _jetCtrl ctrlSetText str _JetAmount;
            _jetCtrl ctrlSetFade 0;
            _jetCtrl ctrlCommit 0.5;
            sleep 1;
            _jetCtrl ctrlSetTextColor [1,1,1,1];
        };
    };

    0 spawn {
        _heliCtrl = ((uiNamespace getVariable "TAG_infoHud") displayCtrl 547654);
        _heliAmount = count (heliArray select {alive _x});
        if (!(ctrlText _heliCtrl isEqualTo str _heliAmount)) then {
            if (parseNumber (ctrlText _heliCtrl) > _heliAmount) then{
                _heliCtrl ctrlSetTextColor [255,0,0,1];
            } else {
                _heliCtrl ctrlSetTextColor [255,255,0,1];
            };
            sleep 1;
            _heliCtrl ctrlSetFade 1;
            _heliCtrl ctrlCommit 0.5;
            sleep 0.5;
            _heliCtrl ctrlSetText str _heliAmount;
            _heliCtrl ctrlSetFade 0;
            _heliCtrl ctrlCommit 0.5;
            sleep 1;
            _heliCtrl ctrlSetTextColor [1,1,1,1];
        };
    };
    sleep 3;
};