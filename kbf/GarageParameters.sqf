//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Define parameters of Garage Spawner with Dynamic Loadout
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//If you want to change spawn crew, change here.
//If you want to change spawn crew in random, use selectRandom.
//GPs_bluforCrew = selectRandom ["B_crew_F", "B_Deck_Crew_F"];
GPs_bluforCrew = "B_helicrew_F";
GPs_opforCrew = "O_crew_F";
GPs_independentCrew = "I_crew_F";
GPs_civilianCrew = "C_man_w_worker_F";
GPs_otherCrew = "C_man_polo_1_F";

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//If you want to use white list or black list, change here.
//0: Disable List, 1: Enable White List, 2: Enable Black List
GPs_useListType = 0;

//Separate list of spawnable vehicle based on player side
//Neither true or false, when GPs_useListType true, the list will include GPs_vehicleList_All.
//Dependence: GPs_useListType
GPs_separateListBySide = false;

//Limit spawnable vehicle based on player side
GPs_limitVehicleBySide = false;

//true: Disable UAV spawn, false: Enable UAV spawn
GPs_uavDisabled = false;

//List of vehicle types (Not name)
//You can get the vehicle type in 3DEN editor
//or console "copyToClipboard str (typeOf (vehicle player));".
//For all side
GPs_vehicleList_All = [
"C_SUV_01_F"
];
//For blufor, west side
GPs_vehicleList_BLUFOR = [
"B_MRAP_01_F",
"B_MRAP_01_gmg_F",
"B_MRAP_01_hmg_F"
];
//For opfor, east side
GPs_vehicleList_OPFOR = [
"O_MRAP_02_F",
"O_MRAP_02_gmg_F",
"O_MRAP_02_hmg_F"
];
//For independent or resistance
GPs_vehicleList_INDEP = [
"I_MRAP_03_F",
"I_MRAP_03_gmg_F",
"I_MRAP_03_hmg_F"
];
//For civilian
GPs_vehicleList_CIV = [
"C_Van_01_transport_F",
"C_Van_01_box_F"
];
