/*
	API:

	GetPlayerLoadout(playerid)
	SetPlayerLoadout(playerid, loadoutid)
	GetPlayerLoadoutPrimary(playerid, loadoutid)
	SetPlayerLoadoutPrimary(playerid, loadoutid, weaponid)
	GetPlayerLoadoutSecondary1(playerid, loadoutid)
	SetPlayerLoadoutSecondary1(playerid, loadoutid, weaponid)
	GetPlayerLoadoutSecondary2(playerid, loadoutid)
	SetPlayerLoadoutSecondary2(playerid, loadoutid, weaponid)
	GetPlayerLoadoutExplosive1(playerid, loadoutid)
	SetPlayerLoadoutExplosive1(playerid, loadoutid, weaponid)
	GetPlayerLoadoutExplosive2(playerid, loadoutid)
	SetPlayerLoadoutExplosive2(playerid, loadoutid, weaponid)
	GetPlayerLoadoutPerk(playerid, loadoutid)
	SetPlayerLoadoutPerk(playerid, loadoutid, perk)
*/


#define MAX_LOADOUT (4)


enum E_LOADOUT_DATA
{
	E_LOADOUT_PRIMARY,
	E_LOADOUT_SECONDARY_1,
	E_LOADOUT_SECONDARY_2,
	E_LOADOUT_EXPLOSIVE_1,
	E_LOADOUT_EXPLOSIVE_2,
	E_LOADOUT_PERK
}


static
	lod_Data[MAX_PLAYERS][MAX_LOADOUT][E_LOADOUT_DATA],
	lod_Current[MAX_PLAYERS];


/*==============================================================================

	Internal

==============================================================================*/


hook OnAccountCreate(playerid)
{
	log("[OnAccountCreate/loadout] Creating default loadouts for %p", playerid);

	for(new i; i < MAX_LOADOUT; i++)
	{
		SetPlayerLoadoutPrimary(playerid, i, WEAPON_MP5);
		SetPlayerLoadoutSecondary1(playerid, i, WEAPON_CANE);
		SetPlayerLoadoutSecondary2(playerid, i, WEAPON_SPRAYCAN);
		SetPlayerLoadoutExplosive1(playerid, i, 0);
		SetPlayerLoadoutExplosive1(playerid, i, 0);
		SetPlayerLoadoutPerk(playerid, i, 0b00000);

		dlog("[CREATE] Loadout %d/%d: p:%d s1:%d s2:%d e1:%d e2:%d pk:%d", i, MAX_LOADOUT,
			GetPlayerLoadoutPrimary(playerid, i),
			GetPlayerLoadoutSecondary1(playerid, i),
			GetPlayerLoadoutSecondary2(playerid, i),
			GetPlayerLoadoutExplosive1(playerid, i),
			GetPlayerLoadoutExplosive2(playerid, i));
	}
}

hook OnPlayerLogin(playerid)
{
	log("[OnPlayerLogin/loadout] Loading loadouts for %p", playerid);

	new data[MAX_LOADOUT * _:E_LOADOUT_DATA];

	modio_read(GetPlayerStorageFilename(playerid), _T<L,O,A,D>, sizeof(data), data);

	for(new i, j; i < MAX_LOADOUT; i++)
	{
		SetPlayerLoadoutPrimary(playerid, i, data[j++]);
		SetPlayerLoadoutSecondary1(playerid, i, data[j++]);
		SetPlayerLoadoutSecondary2(playerid, i, data[j++]);
		SetPlayerLoadoutExplosive1(playerid, i, data[j++]);
		SetPlayerLoadoutExplosive1(playerid, i, data[j++]);
		SetPlayerLoadoutPerk(playerid, i, data[j++]);

		dlog("[LOAD] Loadout %d/%d: p:%d s1:%d s2:%d e1:%d e2:%d pk:%d", i, MAX_LOADOUT,
			GetPlayerLoadoutPrimary(playerid, i),
			GetPlayerLoadoutSecondary1(playerid, i),
			GetPlayerLoadoutSecondary2(playerid, i),
			GetPlayerLoadoutExplosive1(playerid, i),
			GetPlayerLoadoutExplosive2(playerid, i));
	}
}

hook OnPlayerLogout(playerid)
{
	log("[OnPlayerLogout/loadout] Storing loadouts for %p", playerid);

	new data[MAX_LOADOUT * _:E_LOADOUT_DATA];

	for(new i, j; i < MAX_LOADOUT; i++)
	{
		data[j++] = GetPlayerLoadoutPrimary(playerid, i);
		data[j++] = GetPlayerLoadoutSecondary1(playerid, i);
		data[j++] = GetPlayerLoadoutSecondary2(playerid, i);
		data[j++] = GetPlayerLoadoutExplosive1(playerid, i);
		data[j++] = GetPlayerLoadoutExplosive1(playerid, i);
		data[j++] = GetPlayerLoadoutPerk(playerid, i);

		dlog("[SAVE] Loadout %d/%d: p:%d s1:%d s2:%d e1:%d e2:%d pk:%d", i, MAX_LOADOUT,
			GetPlayerLoadoutPrimary(playerid, i),
			GetPlayerLoadoutSecondary1(playerid, i),
			GetPlayerLoadoutSecondary2(playerid, i),
			GetPlayerLoadoutExplosive1(playerid, i),
			GetPlayerLoadoutExplosive2(playerid, i));
	}

	modio_push(GetPlayerStorageFilename(playerid), _T<L,O,A,D>, sizeof(data), data);
}


/*==============================================================================

	Interface

==============================================================================*/


stock GetPlayerLoadout(playerid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	return lod_Current[playerid];
}

stock SetPlayerLoadout(playerid, loadoutid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	lod_Current[playerid] = loadoutid;

	return 1;
}

// E_LOADOUT_PRIMARY
stock GetPlayerLoadoutPrimary(playerid, loadoutid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	return lod_Data[playerid][loadoutid][E_LOADOUT_PRIMARY];
}

stock SetPlayerLoadoutPrimary(playerid, loadoutid, weaponid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	lod_Data[playerid][loadoutid][E_LOADOUT_PRIMARY] = weaponid;

	return 1;
}

// E_LOADOUT_SECONDARY_1
stock GetPlayerLoadoutSecondary1(playerid, loadoutid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	return lod_Data[playerid][loadoutid][E_LOADOUT_SECONDARY_1];
}

stock SetPlayerLoadoutSecondary1(playerid, loadoutid, weaponid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	lod_Data[playerid][loadoutid][E_LOADOUT_SECONDARY_1] = weaponid;

	return 1;
}

// E_LOADOUT_SECONDARY_2
stock GetPlayerLoadoutSecondary2(playerid, loadoutid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	return lod_Data[playerid][loadoutid][E_LOADOUT_SECONDARY_2];
}

stock SetPlayerLoadoutSecondary2(playerid, loadoutid, weaponid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	lod_Data[playerid][loadoutid][E_LOADOUT_SECONDARY_2] = weaponid;

	return 1;
}

// E_LOADOUT_EXPLOSIVE_1
stock GetPlayerLoadoutExplosive1(playerid, loadoutid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	return lod_Data[playerid][loadoutid][E_LOADOUT_EXPLOSIVE_1];
}

stock SetPlayerLoadoutExplosive1(playerid, loadoutid, weaponid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	lod_Data[playerid][loadoutid][E_LOADOUT_EXPLOSIVE_1] = weaponid;

	return 1;
}

// E_LOADOUT_EXPLOSIVE_2
stock GetPlayerLoadoutExplosive2(playerid, loadoutid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	return lod_Data[playerid][loadoutid][E_LOADOUT_EXPLOSIVE_2];
}

stock SetPlayerLoadoutExplosive2(playerid, loadoutid, weaponid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	lod_Data[playerid][loadoutid][E_LOADOUT_EXPLOSIVE_2] = weaponid;

	return 1;
}

// E_LOADOUT_PERK
stock GetPlayerLoadoutPerk(playerid, loadoutid)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	return lod_Data[playerid][loadoutid][E_LOADOUT_PERK];
}

stock SetPlayerLoadoutPerk(playerid, loadoutid, perk)
{
	if(!IsPlayerConnected(playerid))
		return 0;

	if(!(0 <= loadoutid < MAX_LOADOUT))
		return 0;

	lod_Data[playerid][loadoutid][E_LOADOUT_PERK] = perk;

	return 1;
}
