#include <YSI\y_hooks>


static
			lod_StorePage[MAX_PLAYERS],
			lod_SelectedItem[MAX_PLAYERS],

PlayerText:	lod_Background[5][MAX_PLAYERS],
PlayerText:	lod_LoadoutTitle[MAX_PLAYERS],
PlayerText:	lod_LethalTactical[MAX_PLAYERS],
PlayerText:	lod_WeaponStatsTitle[MAX_PLAYERS],
PlayerText:	lod_WeaponStatsSubHead[MAX_PLAYERS],
PlayerText:	lod_Perk[5][MAX_PLAYERS],
PlayerText:	lod_LoadoutSelect[5][MAX_PLAYERS],
PlayerText:	lod_CODVersion[MAX_PLAYERS],
PlayerText:	lod_RankCash[MAX_PLAYERS],
PlayerText:	lod_SkinModel[MAX_PLAYERS],
PlayerText:	lod_PrimaryGunModel[MAX_PLAYERS],
PlayerText:	lod_SecondaryGunModel1[MAX_PLAYERS],
PlayerText:	lod_SecondaryGunModel2[MAX_PLAYERS],
PlayerText:	lod_ExplosiveModel1[MAX_PLAYERS],
PlayerText:	lod_ExplosiveModel2[MAX_PLAYERS],
PlayerText:	lod_PrimaryWeaponText[MAX_PLAYERS],
PlayerText:	lod_SecondaryWeaponText1[MAX_PLAYERS],
PlayerText:	lod_SecondaryWeaponText2[MAX_PLAYERS],
PlayerText:	lod_PerkText[MAX_PLAYERS],
PlayerText:	lod_SelectedGunModel[MAX_PLAYERS],
PlayerText:	lod_SelectedGunModelTitle[MAX_PLAYERS],
PlayerText:	lod_SelectedGunModelDesc[MAX_PLAYERS],
PlayerText:	lod_WeaponStats[MAX_PLAYERS],
PlayerText:	lod_StartGame[MAX_PLAYERS],
PlayerText:	lod_TipText[MAX_PLAYERS],
PlayerText:	lod_PlayerStats[MAX_PLAYERS],
PlayerText:	lod_CODQuit[MAX_PLAYERS],
PlayerText:	lod_Stats[MAX_PLAYERS],
PlayerText:	lod_StoreOption[12][MAX_PLAYERS],
PlayerText:	lod_StoreBackground[MAX_PLAYERS],
PlayerText:	lod_StoreTitle[MAX_PLAYERS],
PlayerText:	lod_StoreDesc[MAX_PLAYERS],
PlayerText:	lod_StoreBack[MAX_PLAYERS],
PlayerText:	lod_StoreBuy[MAX_PLAYERS],

Timer:		RandomTipTimer[MAX_PLAYERS],

			RandomTip[12][72]=
			{
				{"~y~TIP: ~w~Use your mouse to select different screen options."},
				{"~y~TIP: ~w~Unlock new weapons and Perks from ranking up."},
				{"~y~TIP: ~w~Customise your weapon Loadouts when you reach level 10."},
				{"~y~TIP: ~w~Unlock more Loadouts by getting your rank up."},
				{"~y~TIP: ~w~Donators can access bonus Cash and Killstrike perks."},
				{"~y~TIP: ~w~Donators can access the 4th Loadout."},
				{"~y~TIP: ~w~If you quit a match before it end you will lose rep!"},
				{"~y~TIP: ~w~You can create and submit your own maps at project-samp.net!"},
				{"~y~TIP: ~w~Higher levels can have 2 secondary weapons."},
				{"~y~TIP: ~w~Higher levels can use Tactical explosives."},
				{"~y~TIP: ~w~Each 3 kill streak will reward you with your chosen Perk."},
				{"~y~TIP: ~w~Purchase upgrades in the shop such as; double Perks!"}
			};

LoadUI(playerid)
{
	lod_Background[0][playerid] = CreatePlayerTextDraw(playerid,320.000000, 30.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	PlayerTextDrawAlignment(playerid,lod_Background[0][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Background[0][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Background[0][playerid], 1);
	PlayerTextDrawLetterSize(playerid,lod_Background[0][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Background[0][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_Background[0][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Background[0][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Background[0][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Background[0][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Background[0][playerid], 826436736);
	PlayerTextDrawTextSize(playerid,lod_Background[0][playerid], 650.000000, 650.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Background[0][playerid], 0);

	lod_Background[1][playerid] = CreatePlayerTextDraw(playerid,320.000000, -8.000000, "~n~~n~~n~~n~~n~~n~");
	PlayerTextDrawAlignment(playerid,lod_Background[1][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Background[1][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Background[1][playerid], 1);
	PlayerTextDrawLetterSize(playerid,lod_Background[1][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Background[1][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_Background[1][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Background[1][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Background[1][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Background[1][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Background[1][playerid], 286331391);
	PlayerTextDrawTextSize(playerid,lod_Background[1][playerid], 650.000000, 650.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Background[1][playerid], 0);

	lod_Background[2][playerid] = CreatePlayerTextDraw(playerid,320.000000, 402.000000, "~n~~n~~n~~n~~n~~n~");
	PlayerTextDrawAlignment(playerid,lod_Background[2][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Background[2][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Background[2][playerid], 1);
	PlayerTextDrawLetterSize(playerid,lod_Background[2][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Background[2][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_Background[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Background[2][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Background[2][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Background[2][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Background[2][playerid], 286331391);
	PlayerTextDrawTextSize(playerid,lod_Background[2][playerid], 650.000000, 650.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Background[2][playerid], 0);

	lod_LoadoutTitle[playerid] = CreatePlayerTextDraw(playerid,55.000000, 120.000000, "~y~LOADOUT 1");
	PlayerTextDrawBackgroundColor(playerid,lod_LoadoutTitle[playerid], 255);
	PlayerTextDrawFont(playerid,lod_LoadoutTitle[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_LoadoutTitle[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_LoadoutTitle[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_LoadoutTitle[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_LoadoutTitle[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_LoadoutTitle[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_LoadoutTitle[playerid], 0);

	lod_CODVersion[playerid] = CreatePlayerTextDraw(playerid,600.000000, 427.000000, "v0.01");
	PlayerTextDrawBackgroundColor(playerid,lod_CODVersion[playerid], 255);
	PlayerTextDrawFont(playerid,lod_CODVersion[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_CODVersion[playerid], 0.140000, 0.899999);
	PlayerTextDrawColor(playerid,lod_CODVersion[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_CODVersion[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_CODVersion[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_CODVersion[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_CODVersion[playerid], 0);

	lod_RankCash[playerid] = CreatePlayerTextDraw(playerid,490.000000, 26.000000, "RANK 9999_____~g~$ 9999999");
	PlayerTextDrawBackgroundColor(playerid,lod_RankCash[playerid], -256);
	PlayerTextDrawFont(playerid,lod_RankCash[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_RankCash[playerid], 0.239999, 1.899999);
	PlayerTextDrawColor(playerid,lod_RankCash[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_RankCash[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_RankCash[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_RankCash[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_RankCash[playerid], 0);

	lod_SkinModel[playerid] = CreatePlayerTextDraw(playerid,370.000000, 122.000000, "lod_SKINMODEL");
	PlayerTextDrawAlignment(playerid,lod_SkinModel[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_SkinModel[playerid], 0xFFFFFF00);
	PlayerTextDrawFont(playerid,lod_SkinModel[playerid], 5);
	PlayerTextDrawLetterSize(playerid,lod_SkinModel[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_SkinModel[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_SkinModel[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SkinModel[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SkinModel[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_SkinModel[playerid], 0);
	PlayerTextDrawBoxColor(playerid,lod_SkinModel[playerid], -256);
	PlayerTextDrawTextSize(playerid,lod_SkinModel[playerid], 150.000000, 200.000000);
	PlayerTextDrawSetPreviewModel(playerid, lod_SkinModel[playerid], 137);
	PlayerTextDrawSetPreviewRot(playerid, lod_SkinModel[playerid], 0.000000, 0.000000, -30.000000, 0.850000);
	PlayerTextDrawSetSelectable(playerid,lod_SkinModel[playerid], 0);

	lod_PrimaryGunModel[playerid] = CreatePlayerTextDraw(playerid,61.000000, 115.000000, "PRIMARYMODEL");
	PlayerTextDrawBackgroundColor(playerid,lod_PrimaryGunModel[playerid], 0xFFFFFF00);
	PlayerTextDrawFont(playerid,lod_PrimaryGunModel[playerid], 5);
	PlayerTextDrawLetterSize(playerid,lod_PrimaryGunModel[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_PrimaryGunModel[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_PrimaryGunModel[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_PrimaryGunModel[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_PrimaryGunModel[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_PrimaryGunModel[playerid], 0);
	PlayerTextDrawBoxColor(playerid,lod_PrimaryGunModel[playerid], 255);
	PlayerTextDrawTextSize(playerid,lod_PrimaryGunModel[playerid], 90.000000, 80.000000);
	PlayerTextDrawSetPreviewModel(playerid, lod_PrimaryGunModel[playerid], 359);
	PlayerTextDrawSetPreviewRot(playerid, lod_PrimaryGunModel[playerid], -16.000000, 0.000000, 0.000000, 2.500000);
	PlayerTextDrawSetSelectable(playerid,lod_PrimaryGunModel[playerid], 1);

	lod_SecondaryGunModel1[playerid] = CreatePlayerTextDraw(playerid,55.000000, 197.000000, "SECONDARYMODEL1");
	PlayerTextDrawBackgroundColor(playerid,lod_SecondaryGunModel1[playerid], 0xFFFFFF00);
	PlayerTextDrawFont(playerid,lod_SecondaryGunModel1[playerid], 5);
	PlayerTextDrawLetterSize(playerid,lod_SecondaryGunModel1[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_SecondaryGunModel1[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_SecondaryGunModel1[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SecondaryGunModel1[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SecondaryGunModel1[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_SecondaryGunModel1[playerid], 0);
	PlayerTextDrawBoxColor(playerid,lod_SecondaryGunModel1[playerid], 255);
	PlayerTextDrawTextSize(playerid,lod_SecondaryGunModel1[playerid], 50.000000, 50.000000);
	PlayerTextDrawSetPreviewModel(playerid, lod_SecondaryGunModel1[playerid], 353);
	PlayerTextDrawSetPreviewRot(playerid, lod_SecondaryGunModel1[playerid], -16.000000, 60.000000, 0.000000, 1.100000);
	PlayerTextDrawSetSelectable(playerid,lod_SecondaryGunModel1[playerid], 1);

	lod_SecondaryGunModel2[playerid] = CreatePlayerTextDraw(playerid,124.000000, 197.000000, "SECONDARYMODEL2");
	PlayerTextDrawBackgroundColor(playerid,lod_SecondaryGunModel2[playerid], 0xFFFFFF00);
	PlayerTextDrawFont(playerid,lod_SecondaryGunModel2[playerid], 5);
	PlayerTextDrawLetterSize(playerid,lod_SecondaryGunModel2[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_SecondaryGunModel2[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_SecondaryGunModel2[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SecondaryGunModel2[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SecondaryGunModel2[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_SecondaryGunModel2[playerid], 0);
	PlayerTextDrawBoxColor(playerid,lod_SecondaryGunModel2[playerid], 255);
	PlayerTextDrawTextSize(playerid,lod_SecondaryGunModel2[playerid], 50.000000, 50.000000);
	PlayerTextDrawSetPreviewModel(playerid, lod_SecondaryGunModel2[playerid], 353);
	PlayerTextDrawSetPreviewRot(playerid, lod_SecondaryGunModel2[playerid], -16.000000, 60.000000, 0.000000, 1.100000);
	PlayerTextDrawSetSelectable(playerid,lod_SecondaryGunModel2[playerid], 1);

	lod_ExplosiveModel1[playerid] = CreatePlayerTextDraw(playerid,46.000000, 249.000000, "lod_EXPLOSIVEMODEL1");
	PlayerTextDrawBackgroundColor(playerid,lod_ExplosiveModel1[playerid], 0xFFFFFF00);
	PlayerTextDrawFont(playerid,lod_ExplosiveModel1[playerid], 5);
	PlayerTextDrawLetterSize(playerid,lod_ExplosiveModel1[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_ExplosiveModel1[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_ExplosiveModel1[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_ExplosiveModel1[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_ExplosiveModel1[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_ExplosiveModel1[playerid], 0);
	PlayerTextDrawBoxColor(playerid,lod_ExplosiveModel1[playerid], 255);
	PlayerTextDrawTextSize(playerid,lod_ExplosiveModel1[playerid], 50.000000, 50.000000);
	PlayerTextDrawSetPreviewModel(playerid, lod_ExplosiveModel1[playerid], 342);
	PlayerTextDrawSetPreviewRot(playerid, lod_ExplosiveModel1[playerid], -16.000000, 0.000000, 60.000000, 0.699999);
	PlayerTextDrawSetSelectable(playerid,lod_ExplosiveModel1[playerid], 1);

	lod_ExplosiveModel2[playerid] = CreatePlayerTextDraw(playerid,121.000000, 249.000000, "lod_EXPLOSIVEMODEL2");
	PlayerTextDrawBackgroundColor(playerid,lod_ExplosiveModel2[playerid], 0xFFFFFF00);
	PlayerTextDrawFont(playerid,lod_ExplosiveModel2[playerid], 5);
	PlayerTextDrawLetterSize(playerid,lod_ExplosiveModel2[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_ExplosiveModel2[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_ExplosiveModel2[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_ExplosiveModel2[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_ExplosiveModel2[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_ExplosiveModel2[playerid], 0);
	PlayerTextDrawBoxColor(playerid,lod_ExplosiveModel2[playerid], 255);
	PlayerTextDrawTextSize(playerid,lod_ExplosiveModel2[playerid], 50.000000, 50.000000);
	PlayerTextDrawSetPreviewModel(playerid, lod_ExplosiveModel2[playerid], 344);
	PlayerTextDrawSetPreviewRot(playerid, lod_ExplosiveModel2[playerid], -16.000000, 0.000000, 60.000000, 0.800000);
	PlayerTextDrawSetSelectable(playerid,lod_ExplosiveModel2[playerid], 1);

	lod_PrimaryWeaponText[playerid] = CreatePlayerTextDraw(playerid,100.000000, 135.000000, "PRIMARY i LONG_WEAPON_NAME");
	PlayerTextDrawAlignment(playerid,lod_PrimaryWeaponText[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_PrimaryWeaponText[playerid], 255);
	PlayerTextDrawFont(playerid,lod_PrimaryWeaponText[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_PrimaryWeaponText[playerid], 0.150000, 1.099998);
	PlayerTextDrawColor(playerid,lod_PrimaryWeaponText[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_PrimaryWeaponText[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_PrimaryWeaponText[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_PrimaryWeaponText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_PrimaryWeaponText[playerid], 0);

	lod_SecondaryWeaponText1[playerid] = CreatePlayerTextDraw(playerid,100.000000, 178.000000, "SECONDARY i LONG WEAPON NAME");
	PlayerTextDrawAlignment(playerid,lod_SecondaryWeaponText1[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_SecondaryWeaponText1[playerid], 255);
	PlayerTextDrawFont(playerid,lod_SecondaryWeaponText1[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_SecondaryWeaponText1[playerid], 0.150000, 1.099998);
	PlayerTextDrawColor(playerid,lod_SecondaryWeaponText1[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_SecondaryWeaponText1[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SecondaryWeaponText1[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SecondaryWeaponText1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_SecondaryWeaponText1[playerid], 0);

	lod_SecondaryWeaponText2[playerid] = CreatePlayerTextDraw(playerid,100.000000, 188.000000, "SECONDARY i LONG WEAPON NAME");
	PlayerTextDrawAlignment(playerid,lod_SecondaryWeaponText2[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_SecondaryWeaponText2[playerid], 255);
	PlayerTextDrawFont(playerid,lod_SecondaryWeaponText2[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_SecondaryWeaponText2[playerid], 0.150000, 1.099997);
	PlayerTextDrawColor(playerid,lod_SecondaryWeaponText2[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_SecondaryWeaponText2[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SecondaryWeaponText2[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SecondaryWeaponText2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_SecondaryWeaponText2[playerid], 0);

	lod_LethalTactical[playerid] = CreatePlayerTextDraw(playerid,48.000000, 242.000000, "LETHAL_____________________________TACTICAL");
	PlayerTextDrawBackgroundColor(playerid,lod_LethalTactical[playerid], 255);
	PlayerTextDrawFont(playerid,lod_LethalTactical[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_LethalTactical[playerid], 0.150000, 1.099999);
	PlayerTextDrawColor(playerid,lod_LethalTactical[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_LethalTactical[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_LethalTactical[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_LethalTactical[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_LethalTactical[playerid], 0);

	lod_Background[3][playerid] = CreatePlayerTextDraw(playerid,112.000000, 118.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	PlayerTextDrawAlignment(playerid,lod_Background[3][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Background[3][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Background[3][playerid], 1);
	PlayerTextDrawLetterSize(playerid,lod_Background[3][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Background[3][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_Background[3][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Background[3][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Background[3][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Background[3][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Background[3][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_Background[3][playerid], 540.000000, 146.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Background[3][playerid], 0);

	lod_PerkText[playerid] = CreatePlayerTextDraw(playerid,48.000000, 306.000000, "PERKS i LONG_PERK_NAME");
	PlayerTextDrawBackgroundColor(playerid,lod_PerkText[playerid], 255);
	PlayerTextDrawFont(playerid,lod_PerkText[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_PerkText[playerid], 0.150000, 1.099999);
	PlayerTextDrawColor(playerid,lod_PerkText[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_PerkText[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_PerkText[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_PerkText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_PerkText[playerid], 0);

	lod_Perk[0][playerid] = CreatePlayerTextDraw(playerid,41.000000, 321.000000, "hud:radar_ammugun");
	PlayerTextDrawAlignment(playerid,lod_Perk[0][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Perk[0][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Perk[0][playerid], 4);
	PlayerTextDrawLetterSize(playerid,lod_Perk[0][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Perk[0][playerid], 1717986928);
	PlayerTextDrawSetOutline(playerid,lod_Perk[0][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Perk[0][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Perk[0][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Perk[0][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Perk[0][playerid], 858993552);
	PlayerTextDrawTextSize(playerid,lod_Perk[0][playerid], 20.000000, 23.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Perk[0][playerid], 1);

	lod_Perk[1][playerid] = CreatePlayerTextDraw(playerid,71.000000, 321.000000, "hud:radar_girlfriend");
	PlayerTextDrawAlignment(playerid,lod_Perk[1][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Perk[1][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Perk[1][playerid], 4);
	PlayerTextDrawLetterSize(playerid,lod_Perk[1][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Perk[1][playerid], 1717986928);
	PlayerTextDrawSetOutline(playerid,lod_Perk[1][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Perk[1][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Perk[1][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Perk[1][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Perk[1][playerid], 858993552);
	PlayerTextDrawTextSize(playerid,lod_Perk[1][playerid], 20.000000, 23.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Perk[1][playerid], 1);

	lod_Perk[2][playerid] = CreatePlayerTextDraw(playerid,101.000000, 321.000000, "hud:radar_gangn");
	PlayerTextDrawAlignment(playerid,lod_Perk[2][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Perk[2][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Perk[2][playerid], 4);
	PlayerTextDrawLetterSize(playerid,lod_Perk[2][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Perk[2][playerid], 1717986928);
	PlayerTextDrawSetOutline(playerid,lod_Perk[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Perk[2][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Perk[2][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Perk[2][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Perk[2][playerid], 858993552);
	PlayerTextDrawTextSize(playerid,lod_Perk[2][playerid], 20.000000, 23.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Perk[2][playerid], 1);

	lod_Perk[3][playerid] = CreatePlayerTextDraw(playerid,131.000000, 321.000000, "hud:radar_cash");
	PlayerTextDrawAlignment(playerid,lod_Perk[3][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Perk[3][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Perk[3][playerid], 4);
	PlayerTextDrawLetterSize(playerid,lod_Perk[3][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Perk[3][playerid], 1717986928);
	PlayerTextDrawSetOutline(playerid,lod_Perk[3][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Perk[3][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Perk[3][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Perk[3][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Perk[3][playerid], 858993552);
	PlayerTextDrawTextSize(playerid,lod_Perk[3][playerid], 20.000000, 23.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Perk[3][playerid], 1);

	lod_Perk[4][playerid] = CreatePlayerTextDraw(playerid,161.000000, 321.000000, "hud:radar_airyard");
	PlayerTextDrawAlignment(playerid,lod_Perk[4][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Perk[4][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Perk[4][playerid], 4);
	PlayerTextDrawLetterSize(playerid,lod_Perk[4][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Perk[4][playerid], 1717986928);
	PlayerTextDrawSetOutline(playerid,lod_Perk[4][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Perk[4][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Perk[4][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Perk[4][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Perk[4][playerid], 858993552);
	PlayerTextDrawTextSize(playerid,lod_Perk[4][playerid], 20.000000, 23.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Perk[4][playerid], 1);

	lod_SelectedGunModel[playerid] = CreatePlayerTextDraw(playerid,203.000000, 120.000000, "SELECTEDGUNMODEL");
	PlayerTextDrawBackgroundColor(playerid,lod_SelectedGunModel[playerid], 0xFFFFFF00);
	PlayerTextDrawFont(playerid,lod_SelectedGunModel[playerid], 5);
	PlayerTextDrawLetterSize(playerid,lod_SelectedGunModel[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_SelectedGunModel[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_SelectedGunModel[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SelectedGunModel[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SelectedGunModel[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_SelectedGunModel[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_SelectedGunModel[playerid], 255);
	PlayerTextDrawTextSize(playerid,lod_SelectedGunModel[playerid], 160.000000, 120.000000);
	PlayerTextDrawSetPreviewModel(playerid, lod_SelectedGunModel[playerid], 359);
	PlayerTextDrawSetPreviewRot(playerid, lod_SelectedGunModel[playerid], -16.000000, 0.000000, 45.000000, 2.150000);
	PlayerTextDrawSetSelectable(playerid,lod_SelectedGunModel[playerid], 0);

	lod_SelectedGunModelTitle[playerid] = CreatePlayerTextDraw(playerid,236.000000, 124.000000, "LONG_WEAPON_NAME");
	PlayerTextDrawBackgroundColor(playerid,lod_SelectedGunModelTitle[playerid], 255);
	PlayerTextDrawFont(playerid,lod_SelectedGunModelTitle[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_SelectedGunModelTitle[playerid], 0.209999, 1.599998);
	PlayerTextDrawColor(playerid,lod_SelectedGunModelTitle[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_SelectedGunModelTitle[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SelectedGunModelTitle[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SelectedGunModelTitle[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_SelectedGunModelTitle[playerid], 0);

	lod_SelectedGunModelDesc[playerid] = CreatePlayerTextDraw(playerid,218.000000, 222.000000, "ROCKET LAUNCHER HAS A LOW~n~FIRE RATE BIG EXCEEDINGLY HIGH DAMAGE.");
	PlayerTextDrawBackgroundColor(playerid,lod_SelectedGunModelDesc[playerid], 255);
	PlayerTextDrawFont(playerid,lod_SelectedGunModelDesc[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_SelectedGunModelDesc[playerid], 0.150000, 1.099999);
	PlayerTextDrawColor(playerid,lod_SelectedGunModelDesc[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_SelectedGunModelDesc[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_SelectedGunModelDesc[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_SelectedGunModelDesc[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_SelectedGunModelDesc[playerid], 0);

	lod_Background[4][playerid] = CreatePlayerTextDraw(playerid,282.000000, 262.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	PlayerTextDrawAlignment(playerid,lod_Background[4][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Background[4][playerid], 255);
	PlayerTextDrawFont(playerid,lod_Background[4][playerid], 1);
	PlayerTextDrawLetterSize(playerid,lod_Background[4][playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Background[4][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_Background[4][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Background[4][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Background[4][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_Background[4][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_Background[4][playerid], 858993488);
	PlayerTextDrawTextSize(playerid,lod_Background[4][playerid], 540.000000, 143.000000);
	PlayerTextDrawSetSelectable(playerid,lod_Background[4][playerid], 0);

	lod_WeaponStatsTitle[playerid] = CreatePlayerTextDraw(playerid,246.000000, 254.000000, "WEAPON STATS");
	PlayerTextDrawBackgroundColor(playerid,lod_WeaponStatsTitle[playerid], 255);
	PlayerTextDrawFont(playerid,lod_WeaponStatsTitle[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_WeaponStatsTitle[playerid], 0.209999, 1.599998);
	PlayerTextDrawColor(playerid,lod_WeaponStatsTitle[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_WeaponStatsTitle[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_WeaponStatsTitle[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_WeaponStatsTitle[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_WeaponStatsTitle[playerid], 0);

	lod_WeaponStatsSubHead[playerid] = CreatePlayerTextDraw(playerid,246.000000, 274.000000, "Accuracy:~n~Damage:~n~Range:~n~Fire Rate:~n~");
	PlayerTextDrawAlignment(playerid,lod_WeaponStatsSubHead[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_WeaponStatsSubHead[playerid], 255);
	PlayerTextDrawFont(playerid,lod_WeaponStatsSubHead[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_WeaponStatsSubHead[playerid], 0.209999, 1.599998);
	PlayerTextDrawColor(playerid,lod_WeaponStatsSubHead[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_WeaponStatsSubHead[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_WeaponStatsSubHead[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_WeaponStatsSubHead[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_WeaponStatsSubHead[playerid], 0);

	lod_WeaponStats[playerid] = CreatePlayerTextDraw(playerid,306.000000, 274.000000, "~g~iiiiiiiiii~r~~n~~g~iiiiiiiiii~r~~n~~g~iiiiiiiiii~r~~n~~g~iiiiiiiiii~r~~n~");
	PlayerTextDrawAlignment(playerid,lod_WeaponStats[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_WeaponStats[playerid], 255);
	PlayerTextDrawFont(playerid,lod_WeaponStats[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_WeaponStats[playerid], 0.209999, 1.599998);
	PlayerTextDrawColor(playerid,lod_WeaponStats[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_WeaponStats[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_WeaponStats[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_WeaponStats[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_WeaponStats[playerid], 0);

	lod_StartGame[playerid] = CreatePlayerTextDraw(playerid,322.000000, 407.000000, "~g~START~n~GAME");
	PlayerTextDrawAlignment(playerid,lod_StartGame[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StartGame[playerid], 255);
	PlayerTextDrawFont(playerid,lod_StartGame[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StartGame[playerid], 0.399999, 1.200000);
	PlayerTextDrawColor(playerid,lod_StartGame[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StartGame[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StartGame[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StartGame[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StartGame[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StartGame[playerid], 826436752);
	PlayerTextDrawTextSize(playerid,lod_StartGame[playerid], 20.000000, 143.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StartGame[playerid], 1);

	lod_LoadoutSelect[0][playerid] = CreatePlayerTextDraw(playerid,582.000000, 180.000000, "LOADOUT 1");
	PlayerTextDrawAlignment(playerid,lod_LoadoutSelect[0][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_LoadoutSelect[0][playerid], 255);
	PlayerTextDrawFont(playerid,lod_LoadoutSelect[0][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_LoadoutSelect[0][playerid], 0.300000, 2.000000);
	PlayerTextDrawColor(playerid,lod_LoadoutSelect[0][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_LoadoutSelect[0][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_LoadoutSelect[0][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_LoadoutSelect[0][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_LoadoutSelect[0][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_LoadoutSelect[0][playerid], 858993488);
	PlayerTextDrawTextSize(playerid,lod_LoadoutSelect[0][playerid], 20.000000, 73.000000);
	PlayerTextDrawSetSelectable(playerid,lod_LoadoutSelect[0][playerid], 1);

	lod_LoadoutSelect[1][playerid] = CreatePlayerTextDraw(playerid,582.000000, 210.000000, "LOADOUT 2");
	PlayerTextDrawAlignment(playerid,lod_LoadoutSelect[1][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_LoadoutSelect[1][playerid], 255);
	PlayerTextDrawFont(playerid,lod_LoadoutSelect[1][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_LoadoutSelect[1][playerid], 0.300000, 2.000000);
	PlayerTextDrawColor(playerid,lod_LoadoutSelect[1][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_LoadoutSelect[1][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_LoadoutSelect[1][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_LoadoutSelect[1][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_LoadoutSelect[1][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_LoadoutSelect[1][playerid], 858993488);
	PlayerTextDrawTextSize(playerid,lod_LoadoutSelect[1][playerid], 20.000000, 73.000000);
	PlayerTextDrawSetSelectable(playerid,lod_LoadoutSelect[1][playerid], 1);

	lod_LoadoutSelect[2][playerid] = CreatePlayerTextDraw(playerid,582.000000, 240.000000, "LOADOUT 3");
	PlayerTextDrawAlignment(playerid,lod_LoadoutSelect[2][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_LoadoutSelect[2][playerid], 255);
	PlayerTextDrawFont(playerid,lod_LoadoutSelect[2][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_LoadoutSelect[2][playerid], 0.300000, 2.000000);
	PlayerTextDrawColor(playerid,lod_LoadoutSelect[2][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_LoadoutSelect[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_LoadoutSelect[2][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_LoadoutSelect[2][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_LoadoutSelect[2][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_LoadoutSelect[2][playerid], 858993488);
	PlayerTextDrawTextSize(playerid,lod_LoadoutSelect[2][playerid], 20.000000, 73.000000);
	PlayerTextDrawSetSelectable(playerid,lod_LoadoutSelect[2][playerid], 1);

	lod_LoadoutSelect[3][playerid] = CreatePlayerTextDraw(playerid,582.000000, 270.000000, "LOADOUT 4");
	PlayerTextDrawAlignment(playerid,lod_LoadoutSelect[3][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_LoadoutSelect[3][playerid], 255);
	PlayerTextDrawFont(playerid,lod_LoadoutSelect[3][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_LoadoutSelect[3][playerid], 0.300000, 2.000000);
	PlayerTextDrawColor(playerid,lod_LoadoutSelect[3][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_LoadoutSelect[3][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_LoadoutSelect[3][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_LoadoutSelect[3][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_LoadoutSelect[3][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_LoadoutSelect[3][playerid], 858993488);
	PlayerTextDrawTextSize(playerid,lod_LoadoutSelect[3][playerid], 20.000000, 73.000000);
	PlayerTextDrawSetSelectable(playerid,lod_LoadoutSelect[3][playerid], 1);

	lod_LoadoutSelect[4][playerid] = CreatePlayerTextDraw(playerid,582.000000, 300.000000, "~y~STORE");
	PlayerTextDrawAlignment(playerid,lod_LoadoutSelect[4][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_LoadoutSelect[4][playerid], 255);
	PlayerTextDrawFont(playerid,lod_LoadoutSelect[4][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_LoadoutSelect[4][playerid], 0.300000, 2.000000);
	PlayerTextDrawColor(playerid,lod_LoadoutSelect[4][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_LoadoutSelect[4][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_LoadoutSelect[4][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_LoadoutSelect[4][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_LoadoutSelect[4][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_LoadoutSelect[4][playerid], 858993488);
	PlayerTextDrawTextSize(playerid,lod_LoadoutSelect[4][playerid], 20.000000, 73.000000);
	PlayerTextDrawSetSelectable(playerid,lod_LoadoutSelect[4][playerid], 1);

	lod_TipText[playerid] = CreatePlayerTextDraw(playerid,636.000000, 390.000000, "~y~TIP: ~w~Use your mouse to select different screen options.");
	PlayerTextDrawAlignment(playerid,lod_TipText[playerid], 3);
	PlayerTextDrawBackgroundColor(playerid,lod_TipText[playerid], 255);
	PlayerTextDrawFont(playerid,lod_TipText[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_TipText[playerid], 0.140000, 0.899999);
	PlayerTextDrawColor(playerid,lod_TipText[playerid], -1717986817);
	PlayerTextDrawSetOutline(playerid,lod_TipText[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_TipText[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_TipText[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_TipText[playerid], 0);

	lod_PlayerStats[playerid] = CreatePlayerTextDraw(playerid,582.000000, 150.000000, "STATS");
	PlayerTextDrawAlignment(playerid,lod_PlayerStats[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_PlayerStats[playerid], 255);
	PlayerTextDrawFont(playerid,lod_PlayerStats[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_PlayerStats[playerid], 0.300000, 2.000000);
	PlayerTextDrawColor(playerid,lod_PlayerStats[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_PlayerStats[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_PlayerStats[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_PlayerStats[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_PlayerStats[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_PlayerStats[playerid], 858993488);
	PlayerTextDrawTextSize(playerid,lod_PlayerStats[playerid], 20.000000, 73.000000);
	PlayerTextDrawSetSelectable(playerid,lod_PlayerStats[playerid], 1);

	lod_CODQuit[playerid] = CreatePlayerTextDraw(playerid,322.000000, 436.000000, "~r~Quit");
	PlayerTextDrawAlignment(playerid,lod_CODQuit[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_CODQuit[playerid], 255);
	PlayerTextDrawFont(playerid,lod_CODQuit[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_CODQuit[playerid], 0.369998, 0.799998);
	PlayerTextDrawColor(playerid,lod_CODQuit[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_CODQuit[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_CODQuit[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_CODQuit[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_CODQuit[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_CODQuit[playerid], 826436752);
	PlayerTextDrawTextSize(playerid,lod_CODQuit[playerid], 10.000000, 143.000000);
	PlayerTextDrawSetSelectable(playerid,lod_CODQuit[playerid], 1);

	lod_Stats[playerid] = CreatePlayerTextDraw(playerid,450.000000, 320.000000, "~r~Kills: ~w~9999~n~~r~Deaths: ~w~9999~n~~r~K/D Ratio: ~w~99:99~n~~r~Highest Kill Streak: ~w~99");
	PlayerTextDrawAlignment(playerid,lod_Stats[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_Stats[playerid], 255);
	PlayerTextDrawFont(playerid,lod_Stats[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_Stats[playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_Stats[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_Stats[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_Stats[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_Stats[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,lod_Stats[playerid], 0);


/*==============================================================================

	Store

==============================================================================*/


	lod_StoreBackground[playerid] = CreatePlayerTextDraw(playerid,440.000000, 118.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	PlayerTextDrawAlignment(playerid,lod_StoreBackground[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreBackground[playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreBackground[playerid], 1);
	PlayerTextDrawLetterSize(playerid,lod_StoreBackground[playerid], 0.500000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreBackground[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreBackground[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreBackground[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreBackground[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreBackground[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreBackground[playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreBackground[playerid], 170.000000, 120.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreBackground[playerid], 1);

	lod_StoreTitle[playerid] = CreatePlayerTextDraw(playerid,440.000000, 118.000000, "~y~Primary Weapons");
	PlayerTextDrawAlignment(playerid,lod_StoreTitle[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreTitle[playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreTitle[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreTitle[playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreTitle[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreTitle[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreTitle[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreTitle[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreTitle[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreTitle[playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreTitle[playerid], 170.000000, 120.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreTitle[playerid], 0);

	lod_StoreOption[0][playerid] = CreatePlayerTextDraw(playerid,440.000000, 132.000000, "Sub-Machine Gun");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[0][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[0][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[0][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[0][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[0][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[0][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[0][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[0][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[0][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[0][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[0][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[0][playerid], 1);

	lod_StoreOption[1][playerid] = CreatePlayerTextDraw(playerid,440.000000, 146.000000, "Micro-SMG");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[1][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[1][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[1][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[1][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[1][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[1][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[1][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[1][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[1][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[1][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[1][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[1][playerid], 1);

	lod_StoreOption[2][playerid] = CreatePlayerTextDraw(playerid,440.000000, 160.000000, "Tec-9");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[2][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[2][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[2][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[2][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[2][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[2][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[2][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[2][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[2][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[2][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[2][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[2][playerid], 1);

	lod_StoreOption[3][playerid] = CreatePlayerTextDraw(playerid,440.000000, 174.000000, "Standard Shotgun");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[3][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[3][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[3][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[3][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[3][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[3][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[3][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[3][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[3][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[3][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[3][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[3][playerid], 1);

	lod_StoreOption[4][playerid] = CreatePlayerTextDraw(playerid,440.000000, 189.000000, "Sawn-off Shotgun");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[4][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[4][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[4][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[4][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[4][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[4][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[4][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[4][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[4][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[4][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[4][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[4][playerid], 1);

	lod_StoreOption[5][playerid] = CreatePlayerTextDraw(playerid,440.000000, 204.000000, "Combat Shotgun");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[5][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[5][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[5][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[5][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[5][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[5][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[5][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[5][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[5][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[5][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[5][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[5][playerid], 1);

	lod_StoreOption[6][playerid] = CreatePlayerTextDraw(playerid,440.000000, 219.000000, "Country Rifle");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[6][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[6][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[6][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[6][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[6][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[6][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[6][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[6][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[6][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[6][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[6][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[6][playerid], 1);

	lod_StoreOption[7][playerid] = CreatePlayerTextDraw(playerid,440.000000, 233.000000, "Sniper Rifle");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[7][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[7][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[7][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[7][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[7][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[7][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[7][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[7][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[7][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[7][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[7][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[7][playerid], 1);

	lod_StoreOption[8][playerid] = CreatePlayerTextDraw(playerid,440.000000, 247.000000, "M4");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[8][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[8][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[8][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[8][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[8][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[8][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[8][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[8][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[8][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[8][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[8][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[8][playerid], 1);

	lod_StoreOption[9][playerid] = CreatePlayerTextDraw(playerid,440.000000, 261.000000, "AK-74");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[9][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[9][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[9][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[9][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[9][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[9][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[9][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[9][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[9][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[9][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[9][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[9][playerid], 1);

	lod_StoreOption[10][playerid] = CreatePlayerTextDraw(playerid,440.000000, 275.000000, "Flame Thrower");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[10][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[10][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[10][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[10][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[10][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[10][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[10][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[10][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[10][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[10][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[10][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[10][playerid], 1);

	lod_StoreOption[11][playerid] = CreatePlayerTextDraw(playerid,440.000000, 289.000000, "RPG");
	PlayerTextDrawAlignment(playerid,lod_StoreOption[11][playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreOption[11][playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreOption[11][playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreOption[11][playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreOption[11][playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreOption[11][playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreOption[11][playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreOption[11][playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreOption[11][playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreOption[11][playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreOption[11][playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreOption[11][playerid], 1);

	lod_StoreDesc[playerid] = CreatePlayerTextDraw(playerid,440.000000, 308.000000, "Price: ~g~$99999~n~~w~Rank: ~r~999");
	PlayerTextDrawAlignment(playerid,lod_StoreDesc[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreDesc[playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreDesc[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreDesc[playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreDesc[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreDesc[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreDesc[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreDesc[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreDesc[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreDesc[playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreDesc[playerid], 10.000000, 110.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreDesc[playerid], 0);

	lod_StoreBack[playerid] = CreatePlayerTextDraw(playerid,410.000000, 332.000000, "~n~< Back~n~");
	PlayerTextDrawAlignment(playerid,lod_StoreBack[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreBack[playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreBack[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreBack[playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreBack[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreBack[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreBack[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreBack[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreBack[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreBack[playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreBack[playerid], 15.000000, 50.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreBack[playerid], 1);

	lod_StoreBuy[playerid] = CreatePlayerTextDraw(playerid,470.000000, 332.000000, "~n~$ Buy~n~");
	PlayerTextDrawAlignment(playerid,lod_StoreBuy[playerid], 2);
	PlayerTextDrawBackgroundColor(playerid,lod_StoreBuy[playerid], 255);
	PlayerTextDrawFont(playerid,lod_StoreBuy[playerid], 2);
	PlayerTextDrawLetterSize(playerid,lod_StoreBuy[playerid], 0.200000, 1.000000);
	PlayerTextDrawColor(playerid,lod_StoreBuy[playerid], -1);
	PlayerTextDrawSetOutline(playerid,lod_StoreBuy[playerid], 0);
	PlayerTextDrawSetProportional(playerid,lod_StoreBuy[playerid], 1);
	PlayerTextDrawSetShadow(playerid,lod_StoreBuy[playerid], 1);
	PlayerTextDrawUseBox(playerid,lod_StoreBuy[playerid], 1);
	PlayerTextDrawBoxColor(playerid,lod_StoreBuy[playerid], 112);
	PlayerTextDrawTextSize(playerid,lod_StoreBuy[playerid], 15.000000, 50.000000);
	PlayerTextDrawSetSelectable(playerid,lod_StoreBuy[playerid], 1);
}

ShowLoadoutUI(playerid)
{
	new
		rank = GetPlayerRank(playerid),
		cash = GetPlayerCash(playerid),
		skin = GetPlayerSkinID(playerid),
		primarygun = GetPlayerLoadoutPrimary(playerid, GetPlayerLoadout(playerid)),
		secondary1 = GetPlayerLoadoutSecondary1(playerid, GetPlayerLoadout(playerid)),
		secondary2 = GetPlayerLoadoutSecondary2(playerid, GetPlayerLoadout(playerid)),
		explosive1 = GetPlayerLoadoutExplosive1(playerid, GetPlayerLoadout(playerid)),
		explosive2 = GetPlayerLoadoutExplosive1(playerid, GetPlayerLoadout(playerid)),
		lod_perk = GetPlayerLoadoutPerk(playerid, GetPlayerLoadout(playerid)),
		primarygunname[32],
		secondary1name[32],
		secondary2name[32],
		perkname[32],
		kills = GetPlayerKills(playerid),
		deaths = GetPlayerDeaths(playerid),
		Float:ratio = (deaths == 0) ? float(kills) : floatdiv(kills, deaths),
		higheststreak = GetPlayerHighestKillstreak(playerid);

	GetWeaponName(primarygun, primarygunname, sizeof(primarygunname));
	GetWeaponName(secondary1, secondary1name, sizeof(secondary1name));
	GetWeaponName(secondary2, secondary2name, sizeof(secondary2name));
	GetPerkName(lod_perk, perkname, sizeof(perkname));

	SelectTextDraw(playerid, 0xFFCC00FF);

	RandomTipTimer[playerid] = repeat _SetRandomTipString(playerid);

	PlayerTextDrawSetString(playerid, lod_LoadoutTitle[playerid], sprintf("LOADOUT %d", GetPlayerLoadout(playerid) + 1));
	PlayerTextDrawSetString(playerid, lod_CODVersion[playerid], GAMEMODE_VERSION);
	PlayerTextDrawSetString(playerid, lod_RankCash[playerid], sprintf("RANK %d_____~g~$ %d", rank, cash));
	PlayerTextDrawSetPreviewModel(playerid, lod_SkinModel[playerid], skin);
	PlayerTextDrawSetPreviewModel(playerid, lod_PrimaryGunModel[playerid], GetWeaponModel(primarygun));
	PlayerTextDrawSetPreviewModel(playerid, lod_SecondaryGunModel1[playerid], GetWeaponModel(secondary1));
	PlayerTextDrawSetPreviewModel(playerid, lod_SecondaryGunModel2[playerid], GetWeaponModel(secondary2));
	PlayerTextDrawSetPreviewModel(playerid, lod_ExplosiveModel1[playerid], GetWeaponModel(explosive1));
	PlayerTextDrawSetPreviewModel(playerid, lod_ExplosiveModel2[playerid], GetWeaponModel(explosive2));
	PlayerTextDrawSetString(playerid, lod_PrimaryWeaponText[playerid], sprintf("PRIMARY i %s", primarygunname));
	PlayerTextDrawSetString(playerid, lod_SecondaryWeaponText1[playerid], sprintf("SECONDARY i %s", secondary1name));
	PlayerTextDrawSetString(playerid, lod_SecondaryWeaponText2[playerid], sprintf("SECONDARY i %s", secondary2name));
	PlayerTextDrawSetString(playerid, lod_PerkText[playerid], sprintf("lod_PERK i %s", perkname));
	PlayerTextDrawSetString(playerid, lod_Stats[playerid], sprintf("~r~Kills: ~w~%d~n~~r~Deaths: ~w~%d~n~~r~K/D Ratio: ~w~%.2f~n~~r~Highest Kill Streak: ~w~%d", kills, deaths, ratio, higheststreak));

	for(new i; i < 5; i++)
		PlayerTextDrawShow(playerid, lod_Background[i][playerid]);

	PlayerTextDrawShow(playerid, lod_LoadoutTitle[playerid]);
	PlayerTextDrawShow(playerid, lod_LethalTactical[playerid]);

	for(new i; i < 5; i++)
		PlayerTextDrawShow(playerid, lod_Perk[i][playerid]);

	for(new i; i < 5; i++)
		PlayerTextDrawShow(playerid, lod_LoadoutSelect[i][playerid]);

	PlayerTextDrawShow(playerid, lod_CODVersion[playerid]);
	PlayerTextDrawShow(playerid, lod_RankCash[playerid]);
	PlayerTextDrawShow(playerid, lod_SkinModel[playerid]);

	if(primarygun != 0)
		PlayerTextDrawShow(playerid, lod_PrimaryGunModel[playerid]);

	if(secondary1 != 0)
		PlayerTextDrawShow(playerid, lod_SecondaryGunModel1[playerid]);

	if(secondary2 != 0)
		PlayerTextDrawShow(playerid, lod_SecondaryGunModel2[playerid]);

	if(explosive1 != 0)
		PlayerTextDrawShow(playerid, lod_ExplosiveModel1[playerid]);

	if(explosive2 != 0)
		PlayerTextDrawShow(playerid, lod_ExplosiveModel2[playerid]);

	PlayerTextDrawShow(playerid, lod_PrimaryWeaponText[playerid]);
	PlayerTextDrawShow(playerid, lod_SecondaryWeaponText1[playerid]);
	PlayerTextDrawShow(playerid, lod_SecondaryWeaponText2[playerid]);
	PlayerTextDrawShow(playerid, lod_PerkText[playerid]);
	PlayerTextDrawShow(playerid, lod_StartGame[playerid]);
	PlayerTextDrawShow(playerid, lod_TipText[playerid]);
	PlayerTextDrawShow(playerid, lod_PlayerStats[playerid]);
	PlayerTextDrawShow(playerid, lod_CODQuit[playerid]);
	PlayerTextDrawShow(playerid, lod_Stats[playerid]);

	PlayerTextDrawHide(playerid, lod_WeaponStatsTitle[playerid]);
	PlayerTextDrawHide(playerid, lod_WeaponStatsSubHead[playerid]);
	PlayerTextDrawHide(playerid, lod_WeaponStats[playerid]);

	return 1;
}

_ShowStoreUI(playerid)
{
	for(new i; i<12; i++)
	{
		PlayerTextDrawShow(playerid, lod_StoreOption[i][playerid]);
	}

	PlayerTextDrawShow(playerid, lod_StoreBackground[playerid]);
	PlayerTextDrawShow(playerid, lod_StoreTitle[playerid]);
	PlayerTextDrawShow(playerid, lod_StoreDesc[playerid]);
	PlayerTextDrawShow(playerid, lod_StoreBack[playerid]);
	PlayerTextDrawShow(playerid, lod_StoreBuy[playerid]);
	return 1;
}

HideLoadoutUI(playerid)
{
	stop RandomTipTimer[playerid];

	for(new i; i < 5; i++)
		PlayerTextDrawHide(playerid, lod_Background[i][playerid]);

	PlayerTextDrawHide(playerid, lod_LoadoutTitle[playerid]);
	PlayerTextDrawHide(playerid, lod_LethalTactical[playerid]);
	PlayerTextDrawHide(playerid, lod_WeaponStatsTitle[playerid]);
	PlayerTextDrawHide(playerid, lod_WeaponStatsSubHead[playerid]);

	for(new i; i < 5; i++)
		PlayerTextDrawHide(playerid, lod_Perk[i][playerid]);

	for(new i; i < 5; i++)
		PlayerTextDrawHide(playerid, lod_LoadoutSelect[i][playerid]);

	PlayerTextDrawHide(playerid, lod_CODVersion[playerid]);
	PlayerTextDrawHide(playerid, lod_RankCash[playerid]);
	PlayerTextDrawHide(playerid, lod_SkinModel[playerid]);
	PlayerTextDrawHide(playerid, lod_PrimaryGunModel[playerid]);
	PlayerTextDrawHide(playerid, lod_SecondaryGunModel1[playerid]);
	PlayerTextDrawHide(playerid, lod_SecondaryGunModel2[playerid]);
	PlayerTextDrawHide(playerid, lod_ExplosiveModel1[playerid]);
	PlayerTextDrawHide(playerid, lod_ExplosiveModel2[playerid]);
	PlayerTextDrawHide(playerid, lod_PrimaryWeaponText[playerid]);
	PlayerTextDrawHide(playerid, lod_SecondaryWeaponText1[playerid]);
	PlayerTextDrawHide(playerid, lod_SecondaryWeaponText2[playerid]);
	PlayerTextDrawHide(playerid, lod_PerkText[playerid]);
	PlayerTextDrawHide(playerid, lod_SelectedGunModel[playerid]);
	PlayerTextDrawHide(playerid, lod_SelectedGunModelTitle[playerid]);
	PlayerTextDrawHide(playerid, lod_SelectedGunModelDesc[playerid]);
	PlayerTextDrawHide(playerid, lod_WeaponStats[playerid]);
	PlayerTextDrawHide(playerid, lod_StartGame[playerid]);
	PlayerTextDrawHide(playerid, lod_TipText[playerid]);
	PlayerTextDrawHide(playerid, lod_PlayerStats[playerid]);
	PlayerTextDrawHide(playerid, lod_CODQuit[playerid]);
	PlayerTextDrawHide(playerid, lod_Stats[playerid]);

	_HideStoreUI(playerid);

	return 1;
}

_HideStoreUI(playerid)
{
	for(new i; i < 12; i++)
		PlayerTextDrawHide(playerid, lod_StoreOption[i][playerid]);

	PlayerTextDrawHide(playerid, lod_StoreBackground[playerid]);
	PlayerTextDrawHide(playerid, lod_StoreTitle[playerid]);
	PlayerTextDrawHide(playerid, lod_StoreDesc[playerid]);
	PlayerTextDrawHide(playerid, lod_StoreBack[playerid]);
	PlayerTextDrawHide(playerid, lod_StoreBuy[playerid]);

	return 1;
}

timer _SetRandomTipString[10000](playerid)
{
	PlayerTextDrawSetString(playerid, lod_TipText[playerid], RandomTip[random(sizeof(RandomTip))]);

	return 1;
}

hook OnPlayerClickPlayerTD(playerid, PlayerText:playertextid)
{
	if(playertextid == lod_CODQuit[playerid])
	{
		HideLoadoutUI(playerid);
		CancelSelectTextDraw(playerid);

		//SEND BACK TO MAIN TOWER
		//REMOVE REP FOR EARLY QUIT
	}

	if(playertextid == lod_StartGame[playerid])
	{
		SpawnPlayerIntoMap(playerid);
		HideLoadoutUI(playerid);
		_HideStoreUI(playerid);
	}

	if(playertextid == lod_PlayerStats[playerid])
	{
		PlayerTextDrawShow(playerid, lod_SkinModel[playerid]);
		PlayerTextDrawShow(playerid, lod_Stats[playerid]);
		_SetStorePage(playerid, 0);
		_HideStoreUI(playerid);
		ShowLoadoutUI(playerid);
	}

	if(playertextid == lod_LoadoutSelect[0][playerid])
	{
		SetPlayerLoadout(playerid, 0);
		ShowLoadoutUI(playerid);
	}

	if(playertextid == lod_LoadoutSelect[1][playerid])
	{
		SetPlayerLoadout(playerid, 1);
		ShowLoadoutUI(playerid);
	}

	if(playertextid == lod_LoadoutSelect[2][playerid])
	{
		SetPlayerLoadout(playerid, 2);
		ShowLoadoutUI(playerid);
	}

	if(playertextid == lod_LoadoutSelect[3][playerid])
	{
		SetPlayerLoadout(playerid, 3);
		ShowLoadoutUI(playerid);
	}

	if(playertextid == lod_LoadoutSelect[4][playerid])
	{
		PlayerTextDrawHide(playerid, lod_SkinModel[playerid]);
		PlayerTextDrawHide(playerid, lod_Stats[playerid]);
		_SetStorePage(playerid, 0);
		_ShowStoreUI(playerid);
	}


	if(lod_StorePage[playerid] == 0) // MAIN PAGE
	{
		if(playertextid == lod_StoreOption[0][playerid]) _SetStorePage(playerid, 1);
		if(playertextid == lod_StoreOption[1][playerid]) _SetStorePage(playerid, 2);
		if(playertextid == lod_StoreOption[2][playerid]) _SetStorePage(playerid, 3);
		if(playertextid == lod_StoreOption[3][playerid]) _SetStorePage(playerid, 4);
		if(playertextid == lod_StoreOption[4][playerid]) _SetStorePage(playerid, 5);
		if(playertextid == lod_StoreOption[5][playerid]) _SetStorePage(playerid, 6);
		if(playertextid == lod_StoreOption[6][playerid]) _SetStorePage(playerid, 7);

		if(playertextid == lod_StoreBack[playerid])
		{
			PlayerTextDrawShow(playerid, lod_SkinModel[playerid]);
			PlayerTextDrawShow(playerid, lod_Stats[playerid]);
			_SetStorePage(playerid, 0);
			_HideStoreUI(playerid);
			ShowLoadoutUI(playerid);
		}
	}
	else if(lod_StorePage[playerid] == 1) // PRIMARY PAGE
	{
		if(playertextid == lod_StoreBack[playerid])
		{
			_SetStorePage(playerid, 0);
		}
		else if(playertextid == lod_StoreOption[0][playerid]) // Sub-Machine Gun/SMG
		{
			_SetSelectedWeapon(playerid, WEAPON_MP5, "Sub-Machine Gun", "Standard SMG, average~n~range, damage and firerate.", 10, 10, 10, 12);
		}
		else if(playertextid == lod_StoreOption[1][playerid]) // Micro-SMG
		{
			_SetSelectedWeapon(playerid, WEAPON_UZI, "Micro-SMG", "Small light SMG,~n~low range, high firerate.", 6, 10, 10, 14);
		}
		else if(playertextid == lod_StoreOption[2][playerid]) // Tec-9
		{
			_SetSelectedWeapon(playerid, WEAPON_TEC9, "Tec-9", "Light and accurate,~n~low range, high firerate.", 6, 10, 10, 14);
		}
		else if(playertextid == lod_StoreOption[3][playerid]) // Standard Shotgun
		{
			_SetSelectedWeapon(playerid, WEAPON_SHOTGUN, "Standard Shotgun", "Heavy single shot,~n~Medium range, low firerate.", 10, 12, 6, 3);
		}
		else if(playertextid == lod_StoreOption[4][playerid]) // Sawn-off Shotgun
		{
			_SetSelectedWeapon(playerid, WEAPON_SAWEDOFF, "Sawn-off Shotgun", "Light double barrel,~n~shotgun, low range.", 4, 15, 5, 2);
		}
		else if(playertextid == lod_StoreOption[5][playerid]) // Combat Shotgun
		{
			_SetSelectedWeapon(playerid, WEAPON_SHOTGSPA, "Combat Shotgun", "Heavy Combat Shotgun,~n~High accuracy, high firerate.", 8, 5, 7, 16);
		}
		else if(playertextid == lod_StoreOption[6][playerid]) // Country Rifle
		{
			_SetSelectedWeapon(playerid, WEAPON_RIFLE, "Country Rifle", "High powered rifle,~n~Single shot, low firerate.", 18, 15, 10, 2);
		}
		else if(playertextid == lod_StoreOption[7][playerid]) // Sniper Rifle
		{
			_SetSelectedWeapon(playerid, WEAPON_SNIPER, "Sniper Rifle", "High powered Sniper,~n~Single shot, high accuracy.", 20, 2, 19, 2);
		}
		else if(playertextid == lod_StoreOption[8][playerid]) // AK-47
		{
			_SetSelectedWeapon(playerid, WEAPON_AK47, "AK-47", "High powered automatic ~n~rifle, high accuracy, high firerate.", 6, 13, 13, 14);
		}
		else if(playertextid == lod_StoreOption[9][playerid]) // M4
		{
			_SetSelectedWeapon(playerid, WEAPON_M4, "M4", "High powered automatic ~n~rifle, high accuracy, high firerate.", 6, 13, 13, 14);
		}
		else if(playertextid == lod_StoreOption[10][playerid]) // Flamethrower
		{
			_SetSelectedWeapon(playerid, WEAPON_FLAMETHROWER, "Flame Thrower", "Devistating damage,~n~, medium firerate.", 5, 19, 2, 10);
		}
		else if(playertextid == lod_StoreOption[11][playerid]) // RPG
		{
			_SetSelectedWeapon(playerid, WEAPON_ROCKETLAUNCHER, "RPG", "Devistating damage,~n~, low firerate.", 2, 19, 15, 1);
		}
	}
	else if(lod_StorePage[playerid] == 2) // SECONDARY PAGE 1
	{
		if(playertextid == lod_StoreBack[playerid])
		{
			_SetStorePage(playerid, 0);
		}
		else if(playertextid == lod_StoreOption[0][playerid]) // Cane
		{
			_SetSelectedWeapon(playerid, WEAPON_CANE, "Cane", "An old man's cane", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[1][playerid]) // Brass Knuckles
		{
			_SetSelectedWeapon(playerid, WEAPON_BRASSKNUCKLE, "Brass Knuckles", "Standard Brass knuckles,~n~perfect for sandwiches", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[2][playerid]) // Golf Club
		{
			_SetSelectedWeapon(playerid, WEAPON_GOLFCLUB, "Golf Club", "Par: 4", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[3][playerid]) // Nitestick
		{
			_SetSelectedWeapon(playerid, WEAPON_NITESTICK, "Nitestick", "Police baton, used for...~n~batting", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[4][playerid]) // Baseball bat
		{
			_SetSelectedWeapon(playerid, WEAPON_BAT, "Baseball Bat", "American Baseball bat", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[5][playerid]) // Shovel
		{
			_SetSelectedWeapon(playerid, WEAPON_SHOVEL, "Shovel", "Good for grave digging", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[6][playerid]) // Pool Cue
		{
			_SetSelectedWeapon(playerid, WEAPON_POOLSTICK, "Pool cue", "Spots or stripes?", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[7][playerid]) // Knife
		{
			_SetSelectedWeapon(playerid, WEAPON_KNIFE, "Knife", "That's not a knife...~n~This is a Knife!", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[8][playerid]) // Katana
		{
			_SetSelectedWeapon(playerid, WEAPON_KATANA, "Katana", "For the stealthiest of ninjas", 5, 1, 1, 10);
		}
		else if(playertextid == lod_StoreOption[9][playerid]) // Purple Dildo
		{
			_SetSelectedWeapon(playerid, WEAPON_DILDO, "Purple Dildo", "Double-ended purple dildo", 5, 1, 1, 10);
		}
	}
	else if(lod_StorePage[playerid] == 3) // SECONDARY PAGE 2
	{
		if(playertextid == lod_StoreBack[playerid])
		{
			_SetStorePage(playerid, 0);
		}
		else if(playertextid == lod_StoreOption[0][playerid]) // Spraycan
		{
			_SetSelectedWeapon(playerid, WEAPON_SPRAYCAN, "Spray Can", "Short range, effective~n~at stunning", 8, 5, 5, 9);
		}
		else if(playertextid == lod_StoreOption[1][playerid]) // 9mm Pistol
		{
			_SetSelectedWeapon(playerid, WEAPON_COLT45, "9mm Pistol", "Standard 9mm pistol", 8, 5, 5, 9);
		}
		else if(playertextid == lod_StoreOption[2][playerid]) // Silenced 9mm Pistol
		{
			_SetSelectedWeapon(playerid, WEAPON_SILENCED, "Silenced 9mm Pistol", "Quiet, supressed 9mm pistol", 8, 5, 5, 9);
		}
		else if(playertextid == lod_StoreOption[3][playerid]) // Desert Eagle
		{
			_SetSelectedWeapon(playerid, WEAPONSKILL_DESERT_EAGLE, "Desert Eagle", "Powerful .50 Desert Eagle", 12, 14, 5, 5);
		}
		else if(playertextid == lod_StoreOption[4][playerid]) // Chainsaw
		{	
			_SetSelectedWeapon(playerid, WEAPON_CHAINSAW, "Chainsaw", "Loud petrol powered chainsaw", 3, 17, 1, 10);
		}
	}
	else if(lod_StorePage[playerid] == 4) // EXPLOSIVE PAGE 1
	{
		if(playertextid == lod_StoreBack[playerid])
		{
			_SetStorePage(playerid, 0);
		}
		else if(playertextid == lod_StoreOption[0][playerid])
		{
			_SetSelectedWeapon(playerid, WEAPON_GRENADE, "Grenade", "Heavy damage but~n~short ranged", 3, 18, 1, 1);
		}
		else if(playertextid == lod_StoreOption[1][playerid])
		{
			_SetSelectedWeapon(playerid, WEAPON_MOLTOV, "Molotov", "Heavy damage but~n~short ranged", 3, 18, 1, 1);
		}
	}
	else if(lod_StorePage[playerid] == 5) // EXPLOSIVE PAGE 2
	{
		if(playertextid == lod_StoreBack[playerid])
		{
			_SetStorePage(playerid, 0);
		}
		else if(playertextid == lod_StoreOption[0][playerid])
		{
			_SetSelectedWeapon(playerid, WEAPON_TEARGAS, "Teargas", "Block your opponents view", 3, 0, 1, 1);
		}
		else if(playertextid == lod_StoreOption[1][playerid])
		{
			_SetSelectedWeapon(playerid, WEAPON_SATCHEL, "Satchel", "Heavy damage and~n~remote detonation", 3, 18, 1, 1);
		}
	}
	else if(lod_StorePage[playerid] == 6) // PERK PAGE
	{
		if(playertextid == lod_StoreBack[playerid])
		{
			_SetStorePage(playerid, 0);
		}
		else if(playertextid == lod_StoreOption[0][playerid])
		{
			_SetSelectedPerk(playerid, 0, "Bonus Ammunition", "Bonus Ammunition");
		}
		else if(playertextid == lod_StoreOption[1][playerid])
		{
			_SetSelectedPerk(playerid, 1, "Bonus Health", "Bonus Health");
		}
		else if(playertextid == lod_StoreOption[2][playerid])
		{
			_SetSelectedPerk(playerid, 2, "Enemy Radar", "Enemy Radar");
		}
		else if(playertextid == lod_StoreOption[3][playerid])
		{
			_SetSelectedPerk(playerid, 3, "Bonus Cash", "(DONATOR ONLY) Bonus Cash");
		}
		else if(playertextid == lod_StoreOption[4][playerid])
		{
			_SetSelectedPerk(playerid, 4, "Airstrike", "(DONATOR ONLY) Airstrike");
		}
	}
	else if(lod_StorePage[playerid] == 7) // BONUSES PAGE
	{
		if(playertextid == lod_StoreBack[playerid])
		{
			_SetStorePage(playerid, 0);
		}
		else if(playertextid == lod_StoreOption[0][playerid])
		{
			_SetSelectedBonus(playerid, 0, "Dual-Pistols", "Dual-Pistols");
		}
		else if(playertextid == lod_StoreOption[1][playerid])
		{
			_SetSelectedBonus(playerid, 1, "Dual Sawn-offs", "Dual Sawn-offs");
		}
		else if(playertextid == lod_StoreOption[2][playerid])
		{
			_SetSelectedBonus(playerid, 2, "Dual-SMG's", "Dual-SMG's");
		}
		else if(playertextid == lod_StoreOption[3][playerid])
		{
			_SetSelectedBonus(playerid, 3, "Steady Aim Sniper", "Steady Aim Sniper");
		}
		else if(playertextid == lod_StoreOption[4][playerid])
		{
			_SetSelectedBonus(playerid, 4, "Hide From Radar", "Hide From Radar");
		}
		else if(playertextid == lod_StoreOption[5][playerid])
		{
			_SetSelectedBonus(playerid, 5, "Bonus Ammunition", "Bonus Ammunition");
		}
		else if(playertextid == lod_StoreOption[6][playerid])
		{
			_SetSelectedBonus(playerid, 6, "Bonus Grenade", "Bonus Grenade");
		}
		else if(playertextid == lod_StoreOption[7][playerid])
		{
			_SetSelectedBonus(playerid, 7, "Change Name", "Change Name");
		}
	}

	if(playertextid == lod_StoreBuy[playerid])
	{
		if(1 <= lod_StorePage[playerid] <= 5)
		{
			if(1 <= lod_SelectedItem[playerid] <= WEAPON_SATCHEL)
				_HandleWeaponPurchase(playerid, lod_SelectedItem[playerid]);
		}
		else if(lod_StorePage[playerid] == 6)
		{
			if(0 <= lod_SelectedItem[playerid] < MAX_PERK)
				_HandlePerkPurchase(playerid, lod_SelectedItem[playerid]);
		}
		else if(lod_StorePage[playerid] == 7)
		{
			if(0 <= lod_SelectedItem[playerid] < MAX_BONUS)
				_HandleBonusPurchase(playerid, lod_SelectedItem[playerid]);
		}
		else
		{
			printf("ERROR: invalid storepage: %d", lod_StorePage[playerid]);
		}
	}

	return 0;
}


_SetStorePage(playerid, page)
{
	lod_StorePage[playerid] = page;
	if(page == 0) // MAIN PAGE
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Player Store");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Primary Weapons");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "Secondary Weapons 1");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "Secondary Weapons 2");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "Lethal Explosives");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "Tactical Explosives");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "Killstreak Perks");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "Bonus Content");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "-");

		PlayerTextDrawSetString(playerid, lod_StoreDesc[playerid], "Price: ~g~$-~n~~w~Rank: ~r~-");
	}
	else if(page == 1) // PRIMARY WEAPONS
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Primary Weapons");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Sub-Machine Gun");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "Micro-SMG");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "Tec-9");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "Standard Shotgun");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "Sawn-off Shotgun");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "Combat Shotgun");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "Country Rifle");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "Sniper Rifle");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "AK-47");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "M4");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "Flame Thrower");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "RPG");
	}
	else if(page == 2) // SECONDARYWEAPONS 1
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Secondary Weapons 1");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Cane");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "Brass Knuckles");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "Golf Club");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "Nitestick");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "Baseball Bat");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "Shovel");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "Pool Cue");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "Knife");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "Katana");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "Purple Dildo");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "-");
	}
	else if(page == 3) // SECONDARYWEAPONS 2
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Secondary Weapons 2");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Spraycan");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "9mm Pistol");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "Silenced 9mm Pistol");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "Desert Eagle");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "Chainsaw");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "-");
	}
	else if(page == 4) // EXPLOSIVES
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Lethal Explosives");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Grenade");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "Molotov");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "-");
	}
	else if(page == 5) // EXPLOSIVES
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Tactical Explosives");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Tear Gas");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "Statchel Charge");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "-");
	}
	else if(page == 6) // PERKS
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Killstreak Perks");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Bonus Ammunition");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "Bonus Health");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "Enemy Radar");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "Bonus Cash");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "Airstrike");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "-");
	}
	else if(page == 7) // BONUSES
	{	
		PlayerTextDrawSetString(playerid, lod_StoreTitle[playerid], "~y~Permanent Bonuses");

		PlayerTextDrawSetString(playerid, lod_StoreOption[0][playerid], "Dual-Pistols");
		PlayerTextDrawSetString(playerid, lod_StoreOption[1][playerid], "Dual Sawn-offs");
		PlayerTextDrawSetString(playerid, lod_StoreOption[2][playerid], "Dual-SMG's");
		PlayerTextDrawSetString(playerid, lod_StoreOption[3][playerid], "Steady Aim Sniper");
		PlayerTextDrawSetString(playerid, lod_StoreOption[4][playerid], "Hide From Radar");
		PlayerTextDrawSetString(playerid, lod_StoreOption[5][playerid], "Bonus Ammunition");
		PlayerTextDrawSetString(playerid, lod_StoreOption[6][playerid], "Bonus Grenade");
		PlayerTextDrawSetString(playerid, lod_StoreOption[7][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[8][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[9][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[10][playerid], "-");
		PlayerTextDrawSetString(playerid, lod_StoreOption[11][playerid], "-");
	}
	return 1;
}

_SetSelectedWeapon(playerid, weaponid, title[], description[], accuracy, damage, range, firerate)
{
	new stats[256] = "~g~iiiiiiiiiiiiiiiiiiiii~n~~g~iiiiiiiiiiiiiiiiiiiii~n~~g~iiiiiiiiiiiiiiiiiiiii~n~~g~iiiiiiiiiiiiiiiiiiiii~n~";

	lod_SelectedItem[playerid] = weaponid;

	PlayerTextDrawHide(playerid, lod_SelectedGunModel[playerid]);
	PlayerTextDrawSetPreviewModel(playerid, lod_SelectedGunModel[playerid], GetWeaponModel(weaponid));
	PlayerTextDrawSetString(playerid, lod_SelectedGunModelTitle[playerid], title);
	PlayerTextDrawSetString(playerid, lod_SelectedGunModelDesc[playerid], description);

	strins(stats, "~r~", 84 + firerate);
	strins(stats, "~r~", 57 + range);
	strins(stats, "~r~", 30 + damage);
	strins(stats, "~r~", 03 + accuracy);

	PlayerTextDrawSetString(playerid, lod_WeaponStats[playerid], stats);

	PlayerTextDrawShow(playerid, lod_SelectedGunModel[playerid]);
	PlayerTextDrawShow(playerid, lod_SelectedGunModelTitle[playerid]);
	PlayerTextDrawShow(playerid, lod_SelectedGunModelDesc[playerid]);
	PlayerTextDrawShow(playerid, lod_WeaponStats[playerid]);
}

_SetSelectedPerk(playerid, perkid, title[], description[])
{
	lod_SelectedItem[playerid] = perkid;

	PlayerTextDrawHide(playerid, lod_SelectedGunModel[playerid]);
	PlayerTextDrawSetString(playerid, lod_SelectedGunModelTitle[playerid], title);
	PlayerTextDrawSetString(playerid, lod_SelectedGunModelDesc[playerid], description);

	PlayerTextDrawShow(playerid, lod_SelectedGunModelTitle[playerid]);
	PlayerTextDrawShow(playerid, lod_SelectedGunModelDesc[playerid]);
}

_SetSelectedBonus(playerid, bonusid, title[], description[])
{
	lod_SelectedItem[playerid] = bonusid;

	PlayerTextDrawHide(playerid, lod_SelectedGunModel[playerid]);
	PlayerTextDrawSetString(playerid, lod_SelectedGunModelTitle[playerid], title);
	PlayerTextDrawSetString(playerid, lod_SelectedGunModelDesc[playerid], description);

	PlayerTextDrawShow(playerid, lod_SelectedGunModelTitle[playerid]);
	PlayerTextDrawShow(playerid, lod_SelectedGunModelDesc[playerid]);
}

_HandleWeaponPurchase(playerid, weaponid)
{
	new
		rank = GetEquipmentRank(weaponid);

	if(rank < GetPlayerRank(playerid))
	{
		SendClientMessage(playerid, -1, "You are not a high enough rank to buy that.");
		return 1;
	}

	new
		price = GetEquipmentPrice(weaponid),
		cash = GetPlayerCash(playerid);

	if(price < cash)
	{
		SendClientMessage(playerid, -1, "Insufficient funds.");
		return 2;
	}

	SetPlayerCash(playerid, cash - price);

	switch(lod_StorePage[playerid])
	{
		case 1: // PRIMARY WEAPONS
			SetPlayerLoadoutPrimary(playerid, GetPlayerLoadout(playerid), weaponid);

		case 2: // SECONDARYWEAPONS 1
			SetPlayerLoadoutSecondary1(playerid, GetPlayerLoadout(playerid), weaponid);

		case 3: // SECONDARYWEAPONS 2
			SetPlayerLoadoutSecondary2(playerid, GetPlayerLoadout(playerid), weaponid);

		case 4: // EXPLOSIVES
			SetPlayerLoadoutExplosive1(playerid, GetPlayerLoadout(playerid), weaponid);

		case 5: // EXPLOSIVES
			SetPlayerLoadoutExplosive2(playerid, GetPlayerLoadout(playerid), weaponid);
	}

	ShowLoadoutUI(playerid);

	return 0;
}

_HandlePerkPurchase(playerid, perkid)
{
	new
		rank = GetPerkRank(perkid);

	if(rank < GetPlayerRank(playerid))
	{
		SendClientMessage(playerid, -1, "You are not a high enough rank to buy that.");
		return 1;
	}

	new
		price = GetPerkPrice(perkid),
		cash = GetPlayerCash(playerid);

	if(price < cash)
	{
		SendClientMessage(playerid, -1, "Insufficient funds.");
		return 2;
	}

	SetPlayerCash(playerid, cash - price);
	SetPlayerLoadoutPerk(playerid, GetPlayerLoadout(playerid), perkid);

	ShowLoadoutUI(playerid);

	return 0;
}

_HandleBonusPurchase(playerid, bonusid)
{
	new
		rank = GetBonusRank(bonusid);

	if(rank < GetPlayerRank(playerid))
	{
		SendClientMessage(playerid, -1, "You are not a high enough rank to buy that.");
		return 1;
	}

	new
		price = GetBonusPrice(bonusid),
		cash = GetPlayerCash(playerid);

	if(price < cash)
	{
		SendClientMessage(playerid, -1, "Insufficient funds.");
		return 2;
	}

	switch(bonusid)
	{
		case 0: // Dual-Pistols
			SetPlayerDualPistolState(playerid, 1);

		case 1: // Dual Sawn-offs
			SetPlayerDualSubState(playerid, 1);

		case 2: // Dual-SMG's
			SetPlayerDualSawnState(playerid, 1);

		case 3: // Steady Aim Sniper
			SetPlayerSteadySniperState(playerid, 1);

		case 4: // Hide From Radar
			SetPlayerRadarHideState(playerid, 1);

		case 5: // Bonus Ammunition
			SetPlayerBonusAmmoState(playerid, 1);

		case 6: // Bonus Grenade
			SetPlayerBonusGrenadeState(playerid, 1);

		case 7: // Change Name
			SendClientMessage(playerid, -1, "Not implemented"); // TODO
	}

	ShowLoadoutUI(playerid);

	return 0;
}
