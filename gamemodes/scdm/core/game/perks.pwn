#define MAX_PERK		(5)
#define MAX_PERK_NAME	(18)


enum E_PERK_DATA
{
	E_PERK_RANK,
	E_PERK_PRICE,
	E_PERK_NAME[MAX_PERK_NAME]
}


static
	PerkData[MAX_PERK][E_PERK_DATA]=
	{
		{05, 5000, "Bonus Ammunition"},
		{10, 10000, "Bonus Health"},
		{20, 20000, "Enemy Radar"},
		{30, 30000, "Bonus Cash"},
		{45, 40000, "Airstrike"}
	};


stock GetPerkRank(perkid)
{
	if(!(0 <= perkid < 8))
		return 0;

	return PerkData[perkid][E_PERK_RANK];
}

stock GetPerkPrice(perkid)
{
	if(!(0 <= perkid < 8))
		return 0;

	return PerkData[perkid][E_PERK_PRICE];
}

stock GetPerkName(perkid, string[], len = sizeof(string))
{
	if(!(0 <= perkid < 8))
		return 0;

	string[0] = EOS;
	strcat(string, PerkData[perkid][E_PERK_NAME], len);

	return 1;
}

