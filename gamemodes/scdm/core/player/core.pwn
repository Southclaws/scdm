/*
	API:

	GetPlayerPasswordHash(playerid, output[])
	SetPlayerPasswordHash(playerid, input[])
	GetPlayerRegDate(playerid)
	SetPlayerRegDate(playerid, value)
	GetPlayerLastLog(playerid)
	SetPlayerLastLog(playerid, value)
	GetPlayerAdminLevel(playerid)
	SetPlayerAdminLevel(playerid, value)
	GetPlayerDonatorLevel(playerid)
	SetPlayerDonatorLevel(playerid, value)
	GetPlayerBannedState(playerid)
	SetPlayerBannedState(playerid, value)
	GetPlayerJailedState(playerid)
	SetPlayerJailedState(playerid, value)
*/


// Default pos is where the player will be spawned upon joining.
#define DEFAULT_POS_X				(10000.0)
#define DEFAULT_POS_Y				(10000.0)
#define DEFAULT_POS_Z				(1.0)
#define SetSpawn(%0,%1,%2,%3,%4)	SetSpawnInfo(%0, NO_TEAM, 0, %1, %2, %3, %4, 0,0,0,0,0,0)


enum E_PLAYER_ACCOUNT_DATA
{
	// ACCOUNT INFORMATION
	E_PLAYER_PASSWORD[129],
	E_PLAYER_IPV4,
	E_PLAYER_REG_DATE,
	E_PLAYER_LAST_LOG,
	E_PLAYER_ADMIN_LEVEL,
	E_PLAYER_DONATOR_LEVEL,
	E_PLAYER_BANNED,
	E_PLAYER_JAILED
}

static
	ply_Data[MAX_PLAYERS][E_PLAYER_ACCOUNT_DATA];


/*==============================================================================

	Connect

==============================================================================*/


public OnPlayerConnect(playerid)
{
	log("[JOIN] %p joined", playerid);

	SetPlayerColor(playerid, 0xB8B8B800);
	SetPlayerWeather(playerid, 0);

	if(IsPlayerNPC(playerid))
		return 1;

	new
		ipstring[16],
		ipbyte[4];

	GetPlayerIp(playerid, ipstring, 16);

	sscanf(ipstring, "p<.>a<d>[4]", ipbyte);
	ply_Data[playerid][E_PLAYER_IPV4] = ((ipbyte[0] << 24) | (ipbyte[1] << 16) | (ipbyte[2] << 8) | ipbyte[3]);

	_core_LoadAccount(playerid);

	LoadUI(playerid);
	TogglePlayerControllable(playerid, false);
	Streamer_ToggleIdleUpdate(playerid, true);

	SetSpawn(playerid, DEFAULT_POS_X, DEFAULT_POS_Y, DEFAULT_POS_Z, 0.0);
	SpawnPlayer(playerid);

	SendClientMessageToAllF(WHITE, " >  %P (%d)"C_WHITE" has joined", playerid, playerid);

	return 1;
}

_core_LoadAccount(playerid)
{
	new loadresult = LoadAccount(playerid);

	if(loadresult == 0) // Account does not exist
	{
		DisplayRegisterPrompt(playerid);
	}

	if(loadresult == 1) // Account does exist, prompt login
	{
		DisplayLoginPrompt(playerid);
	}

	if(loadresult == 2) // Account is banned
	{
		Kick(playerid);
	}
}

public OnPlayerRequestClass(playerid, classid)
{
	SetSpawn(playerid, DEFAULT_POS_X, DEFAULT_POS_Y, DEFAULT_POS_Z, 0.0);
	TogglePlayerControllable(playerid, false);

	return 0;
}

public OnPlayerRequestSpawn(playerid)
{
	SetSpawn(playerid, DEFAULT_POS_X, DEFAULT_POS_Y, DEFAULT_POS_Z, 0.0);
	TogglePlayerControllable(playerid, false);

	return 1;
}


/*==============================================================================

	Disconnect

==============================================================================*/


public OnPlayerDisconnect(playerid, reason)
{
	Logout(playerid);

	return 1;
}


/*==============================================================================

	Interface

==============================================================================*/


// E_PLAYER_PASSWORD
stock GetPlayerPasswordHash(playerid, output[])
{
	if(!IsPlayerConnected(playerid))
		return 0;

	output[0] = EOS;
	strcat(output, ply_Data[playerid][E_PLAYER_PASSWORD], 129);

	return 1;
}

stock SetPlayerPasswordHash(playerid, input[])
{
	if(!IsPlayerConnected(playerid))
		return 0;

	strcat(ply_Data[playerid][E_PLAYER_PASSWORD], input, 129);

	return 1;
}

// E_PLAYER_IPV4
stock GetPlayerIPV4(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_IPV4];
}

// E_PLAYER_REG_DATE
stock GetPlayerRegDate(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_REG_DATE];
}

stock SetPlayerRegDate(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_REG_DATE] = value;

	return 1;
}

// E_PLAYER_LAST_LOG
stock GetPlayerLastLog(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_LAST_LOG];
}

stock SetPlayerLastLog(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_LAST_LOG] = value;

	return 1;
}

// E_PLAYER_ADMIN_LEVEL
stock GetPlayerAdminLevel(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_ADMIN_LEVEL];
}

stock SetPlayerAdminLevel(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_ADMIN_LEVEL] = value;

	return 1;
}
// E_PLAYER_DONATOR_LEVEL
stock GetPlayerDonatorLevel(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_DONATOR_LEVEL];
}

stock SetPlayerDonatorLevel(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_DONATOR_LEVEL] = value;

	return 1;
}
// E_PLAYER_BANNED
stock GetPlayerBannedState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_BANNED];
}

stock SetPlayerBannedState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_BANNED] = value;

	return 1;
}
// E_PLAYER_JAILED
stock GetPlayerJailedState(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return ply_Data[playerid][E_PLAYER_JAILED];
}

stock SetPlayerJailedState(playerid, value)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	ply_Data[playerid][E_PLAYER_JAILED] = value;

	return 1;
}
