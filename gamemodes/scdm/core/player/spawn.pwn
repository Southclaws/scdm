SpawnPlayerIntoLoadout(playerid)
{
	log("[LOADOUT] Spawning %p into loadout screen", playerid);

	SetPlayerTeam(playerid, random(2));
	SetPlayerSkinID(playerid, GetRandomTeamSkin(GetPlayerTeam(playerid)));
	ShowLoadoutUI(playerid);
}

SpawnPlayerIntoMap(playerid)
{
	new
		Float:x,
		Float:y,
		Float:z;

	GetRandomTeamSpawn(GetPlayerTeam(playerid), x, y, z);

	SpawnPlayer(playerid);
	SetPlayerPos(playerid, x, y, z);
	SetPlayerSkin(playerid, GetPlayerSkinID(playerid));

	TogglePlayerControllable(playerid, true);

	return 1;
}
