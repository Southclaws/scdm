#define MAX_BONUS		(8)
#define MAX_BONUS_NAME	(18)


enum E_BONUS_DATA
{
	E_BONUS_RANK,
	E_BONUS_PRICE,
	E_BONUS_NAME[MAX_BONUS_NAME]
}


static
	BonusData[MAX_BONUS][E_BONUS_DATA]=
	{
		{40, 20000, "Dual-Pistols"},
		{50, 30000, "Dual Sawn-offs"},
		{60, 40000, "Dual-SMG's"},
		{40, 20000, "Steady Aim Sniper"},
		{35, 25000, "Hide From Radar"},
		{20, 10000, "Bonus Ammunition"},
		{30, 20000, "Bonus Grenade"},
		{00, 25000, "Change Name"}
	};


stock GetBonusRank(bonusid)
{
	if(!(0 <= bonusid < 8))
		return 0;

	return BonusData[bonusid][E_BONUS_RANK];
}

stock GetBonusPrice(bonusid)
{
	if(!(0 <= bonusid < 8))
		return 0;

	return BonusData[bonusid][E_BONUS_PRICE];
}

stock GetBonusName(bonusid, string[], len = sizeof(string))
{
	if(!(0 <= bonusid < 8))
		return 0;

	string[0] = EOS;
	strcat(string, BonusData[bonusid][E_BONUS_NAME], len);

	return 1;
}
