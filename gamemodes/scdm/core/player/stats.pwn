/*
	API:

	GetPlayerRank(playerid)
	SetPlayerRank(playerid, value)
	GetPlayerKills(playerid)
	SetPlayerKills(playerid, value)
	GetPlayerDeaths(playerid)
	SetPlayerDeaths(playerid, value)
	GetPlayerCash(playerid)
	SetPlayerCash(playerid, value)
	GetPlayerRoundsWon(playerid)
	SetPlayerRoundsWon(playerid, value)
	GetPlayerRoundsLost(playerid)
	SetPlayerRoundsLost(playerid, value)
	GetPlayerHeadshots(playerid)
	SetPlayerHeadshots(playerid, value)
	GetPlayerHighestKillstreak(playerid)
	SetPlayerHighestKillstreak(playerid, value)
	GetPlayerDildoKills(playerid)
	SetPlayerDildoKills(playerid, value)
	GetPlayerFistKills(playerid)
	SetPlayerFistKills(playerid, value)
	GetPlayerBaseballKills(playerid)
	SetPlayerBaseballKills(playerid, value)
	GetPlayerKnifeKills(playerid)
	SetPlayerKnifeKills(playerid, value)
	GetPlayerShovelKills(playerid)
	SetPlayerShovelKills(playerid, value)
	GetPlayerKatanaKills(playerid)
	SetPlayerKatanaKills(playerid, value)
	GetPlayerChainsawKills(playerid)
	SetPlayerChainsawKills(playerid, value)
	GetPlayerFlameKills(playerid)
	SetPlayerFlameKills(playerid, value)
	GetPlayerColtKills(playerid)
	SetPlayerColtKills(playerid, value)
	GetPlayerSilencedKills(playerid)
	SetPlayerSilencedKills(playerid, value)
	GetPlayerDeagleKills(playerid)
	SetPlayerDeagleKills(playerid, value)
	GetPlayerShotgunKills(playerid)
	SetPlayerShotgunKills(playerid, value)
	GetPlayerSawnoffKills(playerid)
	SetPlayerSawnoffKills(playerid, value)
	GetPlayerCombatKills(playerid)
	SetPlayerCombatKills(playerid, value)
	GetPlayerUziKills(playerid)
	SetPlayerUziKills(playerid, value)
	GetPlayerTecKills(playerid)
	SetPlayerTecKills(playerid, value)
	GetPlayerSmgKills(playerid)
	SetPlayerSmgKills(playerid, value)
	GetPlayerAk47Kills(playerid)
	SetPlayerAk47Kills(playerid, value)
	GetPlayerM4Kills(playerid)
	SetPlayerM4Kills(playerid, value)
	GetPlayerCountryKills(playerid)
	SetPlayerCountryKills(playerid, value)
	GetPlayerSniperKills(playerid)
	SetPlayerSniperKills(playerid, value)
	GetPlayerGrenadeKills(playerid)
	SetPlayerGrenadeKills(playerid, value)
	GetPlayerRocketKills(playerid)
	SetPlayerRocketKills(playerid, value)
*/


enum E_PLAYER_STATS_DATA
{
	// GAME STATS
	E_PLAYER_RANK,
	E_PLAYER_KILLS,
	E_PLAYER_DEATHS,
	E_PLAYER_CASH,
	E_PLAYER_ROUNDSWON,
	E_PLAYER_ROUNDSLOST,
	E_PLAYER_HEADSHOTS,
	E_PLAYER_HIGHESTKILLSTREAK,

	// WEAPON STATS
	E_PLAYER_DILDO_KILLS,
	E_PLAYER_FIST_KILLS,
	E_PLAYER_BASEBALL_KILLS,
	E_PLAYER_KNIFE_KILLS,
	E_PLAYER_SHOVEL_KILLS,
	E_PLAYER_KATANA_KILLS,
	E_PLAYER_CHAINSAW_KILLS,
	E_PLAYER_FLAME_KILLS,
	E_PLAYER_COLT_KILLS,
	E_PLAYER_SILENCED_KILLS,
	E_PLAYER_DEAGLE_KILLS,
	E_PLAYER_SHOTGUN_KILLS,
	E_PLAYER_SAWNOFF_KILLS,
	E_PLAYER_COMBAT_KILLS,
	E_PLAYER_UZI_KILLS,
	E_PLAYER_TEC_KILLS,
	E_PLAYER_SMG_KILLS,
	E_PLAYER_AK47_KILLS,
	E_PLAYER_M4_KILLS,
	E_PLAYER_COUNTRY_KILLS,
	E_PLAYER_SNIPER_KILLS,
	E_PLAYER_GRENADE_KILLS,
	E_PLAYER_ROCKET_KILLS
}


static
	ply_Data[MAX_PLAYERS][E_PLAYER_STATS_DATA];


/*==============================================================================

	Interface

==============================================================================*/


// E_PLAYER_RANK
stock GetPlayerRank(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_RANK];
}

stock SetPlayerRank(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_RANK] = value;

	return 1;
}

// E_PLAYER_KILLS
stock GetPlayerKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_KILLS];
}

stock SetPlayerKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_KILLS] = value;

	return 1;
}

// E_PLAYER_DEATHS
stock GetPlayerDeaths(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_DEATHS];
}

stock SetPlayerDeaths(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_DEATHS] = value;

	return 1;
}

// E_PLAYER_CASH
stock GetPlayerCash(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_CASH];
}

stock SetPlayerCash(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_CASH] = value;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, value);

	return 1;
}

// E_PLAYER_ROUNDSWON
stock GetPlayerRoundsWon(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_ROUNDSWON];
}

stock SetPlayerRoundsWon(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_ROUNDSWON] = value;

	return 1;
}

// E_PLAYER_ROUNDSLOST
stock GetPlayerRoundsLost(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_ROUNDSLOST];
}

stock SetPlayerRoundsLost(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_ROUNDSLOST] = value;

	return 1;
}

// E_PLAYER_HEADSHOTS
stock GetPlayerHeadshots(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_HEADSHOTS];
}

stock SetPlayerHeadshots(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_HEADSHOTS] = value;

	return 1;
}

// E_PLAYER_HIGHESTKILLSTREAK
stock GetPlayerHighestKillstreak(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_HIGHESTKILLSTREAK];
}

stock SetPlayerHighestKillstreak(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_HIGHESTKILLSTREAK] = value;

	return 1;
}


// E_PLAYER_DILDO_KILLS
stock GetPlayerDildoKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_DILDO_KILLS];
}

stock SetPlayerDildoKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_DILDO_KILLS] = value;

	return 1;
}

// E_PLAYER_FIST_KILLS
stock GetPlayerFistKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_FIST_KILLS];
}

stock SetPlayerFistKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_FIST_KILLS] = value;

	return 1;
}

// E_PLAYER_BASEBALL_KILLS
stock GetPlayerBaseballKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_BASEBALL_KILLS];
}

stock SetPlayerBaseballKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_BASEBALL_KILLS] = value;

	return 1;
}

// E_PLAYER_KNIFE_KILLS
stock GetPlayerKnifeKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_KNIFE_KILLS];
}

stock SetPlayerKnifeKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_KNIFE_KILLS] = value;

	return 1;
}

// E_PLAYER_SHOVEL_KILLS
stock GetPlayerShovelKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_SHOVEL_KILLS];
}

stock SetPlayerShovelKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_SHOVEL_KILLS] = value;

	return 1;
}

// E_PLAYER_KATANA_KILLS
stock GetPlayerKatanaKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_KATANA_KILLS];
}

stock SetPlayerKatanaKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_KATANA_KILLS] = value;

	return 1;
}

// E_PLAYER_CHAINSAW_KILLS
stock GetPlayerChainsawKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_CHAINSAW_KILLS];
}

stock SetPlayerChainsawKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_CHAINSAW_KILLS] = value;

	return 1;
}

// E_PLAYER_FLAME_KILLS
stock GetPlayerFlameKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_FLAME_KILLS];
}

stock SetPlayerFlameKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_FLAME_KILLS] = value;

	return 1;
}

// E_PLAYER_COLT_KILLS
stock GetPlayerColtKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_COLT_KILLS];
}

stock SetPlayerColtKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_COLT_KILLS] = value;

	return 1;
}

// E_PLAYER_SILENCED_KILLS
stock GetPlayerSilencedKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_SILENCED_KILLS];
}

stock SetPlayerSilencedKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_SILENCED_KILLS] = value;

	return 1;
}

// E_PLAYER_DEAGLE_KILLS
stock GetPlayerDeagleKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_DEAGLE_KILLS];
}

stock SetPlayerDeagleKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_DEAGLE_KILLS] = value;

	return 1;
}

// E_PLAYER_SHOTGUN_KILLS
stock GetPlayerShotgunKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_SHOTGUN_KILLS];
}

stock SetPlayerShotgunKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_SHOTGUN_KILLS] = value;

	return 1;
}

// E_PLAYER_SAWNOFF_KILLS
stock GetPlayerSawnoffKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_SAWNOFF_KILLS];
}

stock SetPlayerSawnoffKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_SAWNOFF_KILLS] = value;

	return 1;
}

// E_PLAYER_COMBAT_KILLS
stock GetPlayerCombatKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_COMBAT_KILLS];
}

stock SetPlayerCombatKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_COMBAT_KILLS] = value;

	return 1;
}

// E_PLAYER_UZI_KILLS
stock GetPlayerUziKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_UZI_KILLS];
}

stock SetPlayerUziKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_UZI_KILLS] = value;

	return 1;
}

// E_PLAYER_TEC_KILLS
stock GetPlayerTecKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_TEC_KILLS];
}

stock SetPlayerTecKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_TEC_KILLS] = value;

	return 1;
}

// E_PLAYER_SMG_KILLS
stock GetPlayerSmgKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_SMG_KILLS];
}

stock SetPlayerSmgKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_SMG_KILLS] = value;

	return 1;
}

// E_PLAYER_AK47_KILLS
stock GetPlayerAk47Kills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_AK47_KILLS];
}

stock SetPlayerAk47Kills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_AK47_KILLS] = value;

	return 1;
}

// E_PLAYER_M4_KILLS
stock GetPlayerM4Kills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_M4_KILLS];
}

stock SetPlayerM4Kills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_M4_KILLS] = value;

	return 1;
}

// E_PLAYER_COUNTRY_KILLS
stock GetPlayerCountryKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_COUNTRY_KILLS];
}

stock SetPlayerCountryKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_COUNTRY_KILLS] = value;

	return 1;
}

// E_PLAYER_SNIPER_KILLS
stock GetPlayerSniperKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_SNIPER_KILLS];
}

stock SetPlayerSniperKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_SNIPER_KILLS] = value;

	return 1;
}

// E_PLAYER_GRENADE_KILLS
stock GetPlayerGrenadeKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_GRENADE_KILLS];
}

stock SetPlayerGrenadeKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_GRENADE_KILLS] = value;

	return 1;
}

// E_PLAYER_ROCKET_KILLS
stock GetPlayerRocketKills(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_ROCKET_KILLS];
}

stock SetPlayerRocketKills(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_ROCKET_KILLS] = value;

	return 1;
}

