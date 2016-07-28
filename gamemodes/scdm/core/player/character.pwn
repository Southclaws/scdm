/*
	API:

	GetPlayerSkinID(playerid)
	SetPlayerSkinID(playerid, value)
	GetPlayerDualPistolState(playerid)
	SetPlayerDualPistolState(playerid, value)
	GetPlayerDualSubState(playerid)
	SetPlayerDualSubState(playerid, value)
	GetPlayerDualSawnState(playerid)
	SetPlayerDualSawnState(playerid, value)
	GetPlayerSteadySniperState(playerid)
	SetPlayerSteadySniperState(playerid, value)
	GetPlayerRadarHideState(playerid)
	SetPlayerRadarHideState(playerid, value)
	GetPlayerBonusAmmoState(playerid)
	SetPlayerBonusAmmoState(playerid, value)
	GetPlayerBonusGrenadeState(playerid)
	SetPlayerBonusGrenadeState(playerid, value)
*/


enum E_PLAYER_CHARACTER_DATA
{
	E_PLAYER_SKIN,
	E_PLAYER_DUAL_PISTOLS,
	E_PLAYER_DUAL_SUBS,
	E_PLAYER_DUAL_SAWNOFFS,
	E_PLAYER_STEADY_SNIPER,
	E_PLAYER_RADAR_HIDE,
	E_PLAYER_BONUS_AMMO,
	E_PLAYER_BONUS_GRENADE
}


static
	ply_Data[MAX_PLAYERS][E_PLAYER_CHARACTER_DATA];


// E_PLAYER_SKIN
stock GetPlayerSkinID(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_SKIN];
}

stock SetPlayerSkinID(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_SKIN] = value;

	return 1;
}

// E_PLAYER_DUAL_PISTOLS
stock GetPlayerDualPistolState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_DUAL_PISTOLS];
}

stock SetPlayerDualPistolState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_DUAL_PISTOLS] = value;

	return 1;
}

// E_PLAYER_DUAL_SUBS
stock GetPlayerDualSubState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_DUAL_SUBS];
}

stock SetPlayerDualSubState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_DUAL_SUBS] = value;

	return 1;
}

// E_PLAYER_DUAL_SAWNOFFS
stock GetPlayerDualSawnState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_DUAL_SAWNOFFS];
}

stock SetPlayerDualSawnState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_DUAL_SAWNOFFS] = value;

	return 1;
}

// E_PLAYER_STEADY_SNIPER
stock GetPlayerSteadySniperState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_STEADY_SNIPER];
}

stock SetPlayerSteadySniperState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_STEADY_SNIPER] = value;

	return 1;
}

// E_PLAYER_RADAR_HIDE
stock GetPlayerRadarHideState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_RADAR_HIDE];
}

stock SetPlayerRadarHideState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_RADAR_HIDE] = value;

	return 1;
}

// E_PLAYER_BONUS_AMMO
stock GetPlayerBonusAmmoState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_BONUS_AMMO];
}

stock SetPlayerBonusAmmoState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_BONUS_AMMO] = value;

	return 1;
}

// E_PLAYER_BONUS_GRENADE
stock GetPlayerBonusGrenadeState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_BONUS_GRENADE];
}

stock SetPlayerBonusGrenadeState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_BONUS_GRENADE] = value;

	return 1;
}
