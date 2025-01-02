createDialog "missionEdit";

sliderSetPosition [435654, aaCount];
ctrlSetText [76876,str (sliderPosition 435654)];

sliderSetPosition [29085, tspCount];
ctrlSetText [12084,str (sliderPosition 29085)];

sliderSetPosition [7678, apcCount];
ctrlSetText [131298,str (sliderPosition 7678)];

sliderSetPosition [26548, mrapCount];
ctrlSetText [34854,str (sliderPosition 26548)];

sliderSetPosition [344555, tankCount];
ctrlSetText [45343,str (sliderPosition 344555)];

sliderSetPosition [16546, jetCount];
ctrlSetText [81627,str (sliderPosition 16546)];

sliderSetPosition [569965, heliCount];
ctrlSetText [51656,str (sliderPosition 569965)];

sliderSetPosition [35667, jetSleepTimer];
ctrlSetText [40294,str (sliderPosition 35667)];

sliderSetPosition [20319, heliSleepTimer];
ctrlSetText [9769,str (sliderPosition 20319)];

lbAdd [80789,"Disabled"];
lbAdd [80789,"Enabled"];

lbSetCurSel [80789, aaSquad];