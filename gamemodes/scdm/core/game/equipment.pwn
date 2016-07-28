enum E_EQUIPMENT_DATA
{
	E_EQUIPMENT_RANK,
	E_EQUIPMENT_PRICE
}


static
	EquipmentData[41][E_EQUIPMENT_DATA]=
	{
		{02, 200},		// 01 Brass Knuckles
		{05, 400},		// 02 Golf Club
		{05, 400},		// 03 Nitestick
		{20, 1500},		// 04 Knife
		{10, 800},		// 05 Baseball Bat
		{10, 800},		// 06 Shovel
		{20, 1000},		// 07 Pool Cue
		{50, 3000},		// 08 Katana
		{45, 25000},	// 09 Chainsaw
		{63, 100000},	// 10 Purple Dildo
		{00, 0},		// 11 Dildo
		{00, 0},		// 12 Vibrator
		{00, 0},		// 13 Silver Vibrator
		{00, 0},		// 14 Flowers
		{0, 0},			// 15 Cane
		{20, 15000},	// 16 Grenade
		{10, 5000},		// 17 Tear Gas
		{45, 10000},	// 18 Molotov
		{00, 0},		// 19 Unused
		{00, 0},		// 20 Unused
		{00, 0},		// 21 Unused
		{10, 5000},		// 22 9mm Pistol
		{20, 10000},	// 23 Silenced 9mm Pistol
		{35, 15000},	// 24 Desert Eagle
		{00, 0},		// 25 Standard Shotgun
		{15, 7500},		// 26 Sawn-off Shotgun
		{30, 15000},	// 27 Combat Shotgun
		{20, 5000},		// 28 Micro-SMG
		{00, 0},		// 29 Sub-Machine Gun
		{35, 40000},	// 30 AK-47
		{50, 50000},	// 31 M4
		{25, 10000},	// 32 Tec-9
		{25, 20000},	// 33 Country Rifle
		{40, 30000},	// 34 Sniper Rifle
		{60, 100000},	// 35 RPG
		{00, 0},		// 36 Heatseeker
		{55, 75000},	// 37 Flame Thrower
		{00, 0},		// 38 Minigun
		{40, 30000},	// 39 Statchel Charge
		{00, 0},		// 40 Detonator
		{05, 2000}		// 41 Spraycan
	};


stock GetEquipmentRank(weaponid)
{
	if(!(1 <= weaponid <= 41))
		return 0;

	return EquipmentData[weaponid - 1][E_EQUIPMENT_RANK];
}

stock GetEquipmentPrice(weaponid)
{
	if(!(1 <= weaponid <= 41))
		return 0;

	return EquipmentData[weaponid - 1][E_EQUIPMENT_PRICE];
}

stock GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
		case 1:
			return 331;

		case 2..8:
			return weaponid+331;

		case 9:
			return 341;

		case 10..15:
			return weaponid+311;

		case 16..18:
			return weaponid+326;

		case 22..29:
			return weaponid+324;

		case 30,31:
			return weaponid+325;

		case 32:
			return 372;

		case 33..45:
			return weaponid+324;

		case 46:
			return 371;
	}
	return 0;
}
