//For UAV spawn
//Even if not include this, you can use spawner.
//But when you are connecting to UAVs and then killed,
//all player can't reconnect to UAVs.
player addEventHandler ["Killed", {
  if (!isNull getConnectedUAV (_this select 0)) then
  {
    (_this select 0) connectTerminalToUAV objNull;
  };
}];
