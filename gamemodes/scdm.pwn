/*==============================================================================


	SCDM - Southclaw 2014


==============================================================================*/


#include <a_samp>

/*==============================================================================

	Library Predefinitions

==============================================================================*/

#undef MAX_PLAYERS
#define MAX_PLAYERS	(32)

native IsValidVehicle(vehicleid);
native gpci(playerid, serial[], len);

#define _DEBUG							0 // YSI
#define DB_DEBUG						false // SQLitei
#define DB_MAX_STATEMENTS				(128) // SQLitei
#define STRLIB_RETURN_SIZE				(256) // strlib
#define MODIO_DEBUG						(0) // modio
#define MODIO_FILE_STRUCTURE_VERSION	(20) // modio
#define MODIO_SCRIPT_EXIT_FIX			(1) // modio
#define MAX_MODIO_SESSION				(1024) // modio

/*==============================================================================

	Guaranteed first call

==============================================================================*/

public OnGameModeInit()
{
	print("\n[OnGameModeInit] Initialising 'Main'...");

	OnGameModeInit_Setup();

	#if defined main_OnGameModeInit
		return main_OnGameModeInit();
	#else
		return 1;
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
 
#define OnGameModeInit main_OnGameModeInit
#if defined main_OnGameModeInit
	forward main_OnGameModeInit();
#endif

/*==============================================================================

	Libraries and respective links to their release pages

==============================================================================*/

#include <sscanf2>					// By Y_Less:				http://forum.sa-mp.com/showthread.php?t=120356
#include <YSI\y_utils>				// By Y_Less, 3.1:			http://forum.sa-mp.com/showthread.php?p=1696956
#include <YSI\y_va>
#include <YSI\y_timers>
#include <YSI\y_hooks>
#include <YSI\y_iterate>
#include <YSI\y_ini>
#include <YSI\y_dialog>

#include <streamer>					// By Incognito, 2.7:		http://forum.sa-mp.com/showthread.php?t=102865
#include <sqlitei>					// By Slice, v0.9.6:		http://forum.sa-mp.com/showthread.php?t=303682
#include <formatex>					// By Slice:				http://forum.sa-mp.com/showthread.php?t=313488
#include <strlib>					// By Slice:				http://forum.sa-mp.com/showthread.php?t=362764
#include <md-sort>					// By Slice:				http://forum.sa-mp.com/showthread.php?t=343172

#define time ctime_time
#include <CTime>					// By RyDeR:				http://forum.sa-mp.com/showthread.php?t=294054
#undef time

#include <playerprogress>			// By Torbido/Southclaw:	https://github.com/Southclaw/PlayerProgressBar
#include <djson>					// By DracoBlue, 1.6.2 :	http://forum.sa-mp.com/showthread.php?t=48439

#include <modio>					// By Southclaw:			https://github.com/Southclaw/modio

native WP_Hash(buffer[], len, const str[]);
									// By Y_Less:				http://forum.sa-mp.com/showthread.php?t=65290


/*==============================================================================

	Definitions

==============================================================================*/


#define GAMEMODE_VERSION			"0.3.4"

// Limits
#define MAX_PASSWORD_LEN			(32)
#define MAX_PASSWORD_HASH_LEN		(129)


// Directories
#define DIRECTORY_SCRIPTFILES		"./scriptfiles/"
#define DIRECTORY_MAIN				"scdm/"
#define DIRECTORY_MAPS				DIRECTORY_MAIN"maps/"


// Files
#define ACCOUNT_DATABASE			DIRECTORY_MAIN"accounts.db"
#define SETTINGS_FILE				DIRECTORY_MAIN"settings.json"


// Colours
#define YELLOW						0xFFFF00FF

#define RED							0xE85454FF
#define GREEN						0x33AA33FF
#define BLUE						0x33CCFFFF

#define ORANGE						0xFFAA00FF
#define GREY						0xAFAFAFFF
#define PINK						0xFFC0CBFF
#define NAVY						0x000080FF
#define GOLD						0xB8860BFF
#define LGREEN						0x00FD4DFF
#define TEAL						0x008080FF
#define BROWN						0xA52A2AFF
#define AQUA						0xF0F8FFFF

#define BLACK						0x000000FF
#define WHITE						0xFFFFFFFF
#define CHAT_LOCAL					0xADABD1FF
#define CHAT_RADIO					0xCFD1ABFF


// Embedding Colours
#define C_YELLOW					"{FFFF00}"

#define C_RED						"{E85454}"
#define C_GREEN						"{33AA33}"
#define C_BLUE						"{33CCFF}"

#define C_ORANGE					"{FFAA00}"
#define C_GREY						"{AFAFAF}"
#define C_PINK						"{FFC0CB}"
#define C_NAVY						"{000080}"
#define C_GOLD						"{B8860B}"
#define C_LGREEN					"{00FD4D}"
#define C_TEAL						"{008080}"
#define C_BROWN						"{A52A2A}"
#define C_AQUA						"{F0F8FF}"

#define C_BLACK						"{000000}"
#define C_WHITE						"{FFFFFF}"

#define C_SPECIAL					"{0025AA}"


// Body parts
#define BODY_PART_TORSO				(3)
#define BODY_PART_GROIN				(4)
#define BODY_PART_LEFT_ARM			(5)
#define BODY_PART_RIGHT_ARM			(6)
#define BODY_PART_LEFT_LEG			(7)
#define BODY_PART_RIGHT_LEG			(8)
#define BODY_PART_HEAD				(9)


// Macros
#define CMD:%1(%2)					forward cmd_%1(%2);\
									public cmd_%1(%2)

#define ACMD:%1[%2](%3)				forward acmd_%1_%2(%3);\
									public acmd_%1_%2(%3)


/*==============================================================================

	Global

==============================================================================*/


enum {TEAM_BLUE, TEAM_RED}


new stock
	gServerInitialising	= true,

DB:	gAccounts;


/*==============================================================================

	Gamemode Scripts

==============================================================================*/


// UTILITIES
#include "scdm/utils/message.pwn"
#include "scdm/utils/debug.pwn"

// SERVER CORE

// GAME SCRIPTS
#include "scdm/core/game/equipment.pwn"
#include "scdm/core/game/perks.pwn"
#include "scdm/core/game/bonus.pwn"

// MAP SCRIPTS
#include "scdm/core/map/core.pwn"
#include "scdm/core/map/maplist.pwn"

// PLAYER SCRIPTS
#include "scdm/core/player/account.pwn"
#include "scdm/core/player/core.pwn"
#include "scdm/core/player/character.pwn"
#include "scdm/core/player/saveload.pwn"
#include "scdm/core/player/stats.pwn"
#include "scdm/core/player/loadout.pwn"
#include "scdm/core/player/loadout-ui.pwn"
#include "scdm/core/player/spawn.pwn"
#include "scdm/core/player/command.pwn"

// ADMIN
#include "scdm/core/admin/level1.pwn"
#include "scdm/core/admin/level2.pwn"
#include "scdm/core/admin/level3.pwn"
#include "scdm/core/admin/dev.pwn"


/*==============================================================================

	Initialisation

==============================================================================*/


// This is called absolutely first before any other call.
OnGameModeInit_Setup()
{
	print("\n[OnGameModeInit_Setup] Setting up...");
/*
	if(!dir_exists(DIRECTORY_SCRIPTFILES))
	{
		print("ERROR: Directory '"DIRECTORY_SCRIPTFILES"' not found. Creating directory.");
		dir_create(DIRECTORY_SCRIPTFILES);
	}

	if(!dir_exists(DIRECTORY_SCRIPTFILES DIRECTORY_MAIN))
	{
		print("ERROR: Directory '"DIRECTORY_SCRIPTFILES DIRECTORY_MAIN"' not found. Creating directory.");
		dir_create(DIRECTORY_SCRIPTFILES DIRECTORY_MAIN);
	}
*/
	gAccounts = db_open_persistent(ACCOUNT_DATABASE);

	djson_GameModeInit();
}

// Called after everything else has initialised.
main()
{
	print("\n\n/*==============================================================================\n\n");
	print("    Call of Duty for SA:MP - coded by Southclaw");
	print("\n\n==============================================================================*/\n\n");

	gServerInitialising = false;
}


public OnGameModeExit()
{
	print("[OnGameModeExit] Shutting down...");

	djson_GameModeExit();

	return 1;
}

stock DatabaseTableCheck(DB:database, tablename[], expectedcolumns)
{
	new
		query[96],
		DBResult:result,
		sql_string[256],
		dbcolumns;

	format(query, sizeof(query), "pragma table_info(%s)", tablename);
	result = db_query(database, query);
	db_get_field(result, 0, sql_string, sizeof(sql_string));

	dbcolumns = db_num_rows(result);

	if(dbcolumns != expectedcolumns)
	{
		printf("ERROR: Table '%s' has %d columns, expected %d:", tablename, dbcolumns, expectedcolumns);
		print("Please verify table structure against column list in script.");
		print(sql_string);

		// Put the server into a loop to stop it so the user can read the message.
		// It won't function correctly with bad databases anyway.
		for(;;){}
	}
}
