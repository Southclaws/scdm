// Account data
CMD:adminlevel(playerid, params[])
{
	if(!IsPlayerAdmin(playerid))
		return 0;

	SetPlayerAdminLevel(playerid, strval(params));
	return 1;
}

ACMD:donatorlevel[4](playerid, params[])
{
	SetPlayerDonatorLevel(playerid, strval(params));
	return 1;
}

ACMD:bannedstate[4](playerid, params[])
{
	SetPlayerBannedState(playerid, strval(params));
	return 1;
}

ACMD:jailedstate[4](playerid, params[])
{
	SetPlayerJailedState(playerid, strval(params));
	return 1;
}


// Character data
ACMD:skinid[4](playerid, params[])
{
	SetPlayerSkinID(playerid, strval(params));
	return 1;
}

ACMD:dualpistolstate[4](playerid, params[])
{
	SetPlayerDualPistolState(playerid, strval(params));
	return 1;
}

ACMD:dualsubstate[4](playerid, params[])
{
	SetPlayerDualSubState(playerid, strval(params));
	return 1;
}

ACMD:dualsawnstate[4](playerid, params[])
{
	SetPlayerDualSawnState(playerid, strval(params));
	return 1;
}

ACMD:steadysniperstate[4](playerid, params[])
{
	SetPlayerSteadySniperState(playerid, strval(params));
	return 1;
}

ACMD:radarhidestate[4](playerid, params[])
{
	SetPlayerRadarHideState(playerid, strval(params));
	return 1;
}

ACMD:bonusammostate[4](playerid, params[])
{
	SetPlayerBonusAmmoState(playerid, strval(params));
	return 1;
}

ACMD:bonusgrenadestate[4](playerid, params[])
{
	SetPlayerBonusGrenadeState(playerid, strval(params));
	return 1;
}


// Stats data
ACMD:rank[4](playerid, params[])
{
	SetPlayerRank(playerid, strval(params));
	return 1;
}

ACMD:kills[4](playerid, params[])
{
	SetPlayerKills(playerid, strval(params));
	return 1;
}

ACMD:deaths[4](playerid, params[])
{
	SetPlayerDeaths(playerid, strval(params));
	return 1;
}

ACMD:cash[4](playerid, params[])
{
	SetPlayerCash(playerid, strval(params));
	return 1;
}

ACMD:roundswon[4](playerid, params[])
{
	SetPlayerRoundsWon(playerid, strval(params));
	return 1;
}

ACMD:roundslost[4](playerid, params[])
{
	SetPlayerRoundsLost(playerid, strval(params));
	return 1;
}

ACMD:headshots[4](playerid, params[])
{
	SetPlayerHeadshots(playerid, strval(params));
	return 1;
}

ACMD:highestkillstreak[4](playerid, params[])
{
	SetPlayerHighestKillstreak(playerid, strval(params));
	return 1;
}

ACMD:dildokills[4](playerid, params[])
{
	SetPlayerDildoKills(playerid, strval(params));
	return 1;
}

ACMD:fistkills[4](playerid, params[])
{
	SetPlayerFistKills(playerid, strval(params));
	return 1;
}

ACMD:baseballkills[4](playerid, params[])
{
	SetPlayerBaseballKills(playerid, strval(params));
	return 1;
}

ACMD:knifekills[4](playerid, params[])
{
	SetPlayerKnifeKills(playerid, strval(params));
	return 1;
}

ACMD:shovelkills[4](playerid, params[])
{
	SetPlayerShovelKills(playerid, strval(params));
	return 1;
}

ACMD:katanakills[4](playerid, params[])
{
	SetPlayerKatanaKills(playerid, strval(params));
	return 1;
}

ACMD:chainsawkills[4](playerid, params[])
{
	SetPlayerChainsawKills(playerid, strval(params));
	return 1;
}

ACMD:flamekills[4](playerid, params[])
{
	SetPlayerFlameKills(playerid, strval(params));
	return 1;
}

ACMD:coltkills[4](playerid, params[])
{
	SetPlayerColtKills(playerid, strval(params));
	return 1;
}

ACMD:silencedkills[4](playerid, params[])
{
	SetPlayerSilencedKills(playerid, strval(params));
	return 1;
}

ACMD:deaglekills[4](playerid, params[])
{
	SetPlayerDeagleKills(playerid, strval(params));
	return 1;
}

ACMD:shotgunkills[4](playerid, params[])
{
	SetPlayerShotgunKills(playerid, strval(params));
	return 1;
}

ACMD:sawnoffkills[4](playerid, params[])
{
	SetPlayerSawnoffKills(playerid, strval(params));
	return 1;
}

ACMD:combatkills[4](playerid, params[])
{
	SetPlayerCombatKills(playerid, strval(params));
	return 1;
}

ACMD:uzikills[4](playerid, params[])
{
	SetPlayerUziKills(playerid, strval(params));
	return 1;
}

ACMD:teckills[4](playerid, params[])
{
	SetPlayerTecKills(playerid, strval(params));
	return 1;
}

ACMD:smgkills[4](playerid, params[])
{
	SetPlayerSmgKills(playerid, strval(params));
	return 1;
}

ACMD:ak47kills[4](playerid, params[])
{
	SetPlayerAk47Kills(playerid, strval(params));
	return 1;
}

ACMD:m4kills[4](playerid, params[])
{
	SetPlayerM4Kills(playerid, strval(params));
	return 1;
}

ACMD:countrykills[4](playerid, params[])
{
	SetPlayerCountryKills(playerid, strval(params));
	return 1;
}

ACMD:sniperkills[4](playerid, params[])
{
	SetPlayerSniperKills(playerid, strval(params));
	return 1;
}

ACMD:grenadekills[4](playerid, params[])
{
	SetPlayerGrenadeKills(playerid, strval(params));
	return 1;
}

ACMD:rocketkills[4](playerid, params[])
{
	SetPlayerRocketKills(playerid, strval(params));
	return 1;
}

