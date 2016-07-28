#include <YSI\y_hooks>


#define ACCOUNTS_TABLE_PLAYER		"player"
#define FIELD_PLAYER_NAME			"name"		// 00 STRING
#define FIELD_PLAYER_PASS			"pass"		// 01 STRING
#define FIELD_PLAYER_IPV4			"ipv4"		// 02 INT32
#define FIELD_PLAYER_REG_DATE		"regdate"	// 03 INT32
#define FIELD_PLAYER_LAST_LOG		"lastlog"	// 04 INT32
#define FIELD_PLAYER_ADMIN_LEVEL	"admin"		// 05 INT32
#define FIELD_PLAYER_DONATOR_LEVEL	"donator"	// 06 INT32
#define FIELD_PLAYER_BANNED			"banned"	// 07 INT32
#define FIELD_PLAYER_JAILED			"jailed"	// 08 INT32

enum
{
	FIELD_ID_PLAYER_NAME,
	FIELD_ID_PLAYER_PASSWORD,
	FIELD_ID_PLAYER_IPV4,
	FIELD_ID_PLAYER_REG_DATE,
	FIELD_ID_PLAYER_LAST_LOG,
	FIELD_ID_PLAYER_ADMIN_LEVEL,
	FIELD_ID_PLAYER_DONATOR_LEVEL,
	FIELD_ID_PLAYER_BANNED,
	FIELD_ID_PLAYER_JAILED
}


static stock
				LoginPasswordAttempts[MAX_PLAYERS],

DBStatement:	stmt_AccountExists,
DBStatement:	stmt_AccountCreate,
DBStatement:	stmt_AccountLoad,

// FIELD_PLAYER_PASS
DBStatement:	stmt_AccountGetPassword,
DBStatement:	stmt_AccountSetPassword,

// FIELD_PLAYER_IPV4
DBStatement:	stmt_AccountGetIpv4,
DBStatement:	stmt_AccountSetIpv4,

// FIELD_PLAYER_REG_DATE
DBStatement:	stmt_AccountGetRegDate,
DBStatement:	stmt_AccountSetRegDate,

// FIELD_PLAYER_LAST_LOG
DBStatement:	stmt_AccountGetLastLog,
DBStatement:	stmt_AccountSetLastLog,

// FIELD_PLAYER_ADMIN_LEVEL
DBStatement:	stmt_AccountGetAdminLevel,
DBStatement:	stmt_AccountSetAdminLevel,

// FIELD_PLAYER_DONATOR_LEVEL
DBStatement:	stmt_AccountGetDonator,
DBStatement:	stmt_AccountSetDonator,

// FIELD_PLAYER_BANNED
DBStatement:	stmt_AccountGetBannedState,
DBStatement:	stmt_AccountSetBannedState,

// FIELD_PLAYER_JAILED
DBStatement:	stmt_AccountGetJailedState,
DBStatement:	stmt_AccountSetJailedState;


forward OnAccountLoad(playerid);
forward OnAccountCreate(playerid);
forward OnPlayerLogin(playerid);
forward OnPlayerLogout(playerid);


hook OnScriptInit()
{
	print("\n[OnScriptInit] Initialising 'Accounts'...");

	db_query(gAccounts, "CREATE TABLE IF NOT EXISTS "ACCOUNTS_TABLE_PLAYER" (\
		"FIELD_PLAYER_NAME" TEXT,\
		"FIELD_PLAYER_PASS" TEXT,\
		"FIELD_PLAYER_IPV4" INTEGER,\
		"FIELD_PLAYER_REG_DATE" INTEGER,\
		"FIELD_PLAYER_LAST_LOG" INTEGER,\
		"FIELD_PLAYER_ADMIN_LEVEL" INTEGER,\
		"FIELD_PLAYER_DONATOR_LEVEL" INTEGER,\
		"FIELD_PLAYER_BANNED" INTEGER,\
		"FIELD_PLAYER_JAILED" INTEGER)");

	db_query(gAccounts, "CREATE INDEX IF NOT EXISTS "ACCOUNTS_TABLE_PLAYER"_index ON "ACCOUNTS_TABLE_PLAYER"("FIELD_PLAYER_NAME")");

	DatabaseTableCheck(gAccounts, ACCOUNTS_TABLE_PLAYER, 9);

	stmt_AccountExists			= db_prepare(gAccounts, "SELECT COUNT(*) FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountCreate			= db_prepare(gAccounts, "INSERT INTO "ACCOUNTS_TABLE_PLAYER" VALUES(?,?,?,?,?,?,?,?,?)");
	stmt_AccountLoad			= db_prepare(gAccounts, "SELECT COUNT(*), * FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetPassword		= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_PASS" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetPassword		= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_PASS"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetIpv4			= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_IPV4" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetIpv4			= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_IPV4"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetRegDate		= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_REG_DATE" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetRegDate		= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_REG_DATE"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetLastLog		= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_LAST_LOG" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetLastLog		= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_LAST_LOG"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetAdminLevel	= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_ADMIN_LEVEL" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetAdminLevel	= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_ADMIN_LEVEL"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetDonator		= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_DONATOR_LEVEL" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetDonator		= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_DONATOR_LEVEL"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetBannedState	= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_BANNED" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetBannedState	= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_BANNED"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");

	stmt_AccountGetJailedState	= db_prepare(gAccounts, "SELECT "FIELD_PLAYER_JAILED" FROM "ACCOUNTS_TABLE_PLAYER" WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
	stmt_AccountSetJailedState	= db_prepare(gAccounts, "UPDATE "ACCOUNTS_TABLE_PLAYER" SET "FIELD_PLAYER_JAILED"=? WHERE "FIELD_PLAYER_NAME"=? COLLATE NOCASE");
}


/*==============================================================================

	Loads database data into memory and applies it to the player.

==============================================================================*/


LoadAccount(playerid)
{
	new
		name[MAX_PLAYER_NAME],
		exists,
		password[MAX_PASSWORD_HASH_LEN],
		ipv4,
		regdate,
		lastlog,
		adminlevel,
		donator,
		banned,
		jailed;

	GetPlayerName(playerid, name, MAX_PLAYER_NAME);

	stmt_bind_value(stmt_AccountLoad, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);
	stmt_bind_result_field(stmt_AccountLoad, 0, DB::TYPE_INTEGER, exists);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_PASSWORD, DB::TYPE_STRING, password, MAX_PASSWORD_HASH_LEN);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_IPV4, DB::TYPE_INTEGER, ipv4);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_REG_DATE, DB::TYPE_INTEGER, regdate);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_LAST_LOG, DB::TYPE_INTEGER, lastlog);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_ADMIN_LEVEL, DB::TYPE_INTEGER, adminlevel);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_DONATOR_LEVEL, DB::TYPE_INTEGER, donator);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_BANNED, DB::TYPE_INTEGER, banned);
	stmt_bind_result_field(stmt_AccountLoad, 1 + FIELD_ID_PLAYER_JAILED, DB::TYPE_INTEGER, jailed);

	if(!stmt_execute(stmt_AccountLoad))
	{
		print("ERROR: [LoadAccount] executing statement 'stmt_AccountLoad'.");
		return 0;
	}

	stmt_fetch_row(stmt_AccountLoad);

	if(!exists)
		return 0;

	if(banned)
		return 2;

	SetPlayerPasswordHash(playerid, password);
	SetPlayerRegDate(playerid, regdate);
	SetPlayerLastLog(playerid, lastlog);
	SetPlayerAdminLevel(playerid, adminlevel);
	SetPlayerDonatorLevel(playerid, donator);
	SetPlayerBannedState(playerid, banned);
	SetPlayerJailedState(playerid, jailed);

	CallLocalFunction("OnAccountLoad", "d", playerid);

	return 1;
}


/*==============================================================================

	Creates a new account for a player with the specified password hash.

==============================================================================*/


CreateAccount(playerid, passhash[])
{
	log("[REGISTER] %p registered", playerid);

	new
		name[MAX_PLAYER_NAME];

	GetPlayerName(playerid, name, MAX_PLAYER_NAME);

	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_NAME, DB::TYPE_STRING, name, MAX_PLAYER_NAME); 
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_PASSWORD, DB::TYPE_STRING, passhash, MAX_PASSWORD_HASH_LEN); 
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_IPV4, DB::TYPE_INTEGER, GetPlayerIPV4(playerid)); 
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_REG_DATE, DB::TYPE_INTEGER, gettime()); 
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_LAST_LOG, DB::TYPE_INTEGER, gettime()); 
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_ADMIN_LEVEL, DB::TYPE_INTEGER, GetPlayerAdminLevel(playerid));
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_DONATOR_LEVEL, DB::TYPE_INTEGER, GetPlayerDonatorLevel(playerid));
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_BANNED, DB::TYPE_INTEGER, GetPlayerBannedState(playerid));
	stmt_bind_value(stmt_AccountCreate, FIELD_ID_PLAYER_JAILED, DB::TYPE_INTEGER, GetPlayerJailedState(playerid));
	stmt_execute(stmt_AccountCreate);

	CallLocalFunction("OnAccountCreate", "d", playerid);

	SpawnPlayerIntoLoadout(playerid);

	return 1;
}


/*==============================================================================

	Dialog prompt functions for registration and login.

==============================================================================*/


DisplayRegisterPrompt(playerid)
{
	new str[150];
	format(str, 150, ""C_WHITE"Hello %P"C_WHITE", You must be new here!\nPlease create an account by entering a "C_BLUE"password"C_WHITE" below:", playerid);

	log("[REGPROMPT] %p is registering", playerid);

	inline Response(pid, dialogid, response, listitem, string:inputtext[])
	{
		#pragma unused pid, dialogid, listitem

		if(response)
		{
			if(!(4 <= strlen(inputtext) <= MAX_PASSWORD_LEN))
			{
				SendClientMessageF(playerid, YELLOW, " >  Password must be between 4 and %d characters.", MAX_PASSWORD_LEN);
				DisplayRegisterPrompt(playerid);
				return 0;
			}

			new buffer[MAX_PASSWORD_HASH_LEN];

			WP_Hash(buffer, MAX_PASSWORD_HASH_LEN, inputtext);

			CreateAccount(playerid, buffer);
		}
		else
		{
			Kick(playerid);
		}

		return 1;
	}
	Dialog_ShowCallback(playerid, using inline Response, DIALOG_STYLE_PASSWORD, "Register For A New Account", str, "Accept", "Leave");

	return 1;
}

DisplayLoginPrompt(playerid, badpass = 0)
{
	new str[128];

	if(badpass)
		format(str, 128, "Incorrect password! %d out of 5 tries", LoginPasswordAttempts[playerid]);

	else
		format(str, 128, ""C_WHITE"Welcome Back %P"C_WHITE", Please log into to your account below!\n\n"C_YELLOW"Enjoy your stay :)", playerid);

	log("[LOGPROMPT] %p is logging in", playerid);

	inline Response(pid, dialogid, response, listitem, string:inputtext[])
	{
		#pragma unused pid, dialogid, listitem

		if(response)
		{
			if(strlen(inputtext) < 4)
			{
				DisplayLoginPrompt(playerid);
				return 1;
			}

			new
				inputhash[MAX_PASSWORD_HASH_LEN],
				storedhash[MAX_PASSWORD_HASH_LEN];

			WP_Hash(inputhash, MAX_PASSWORD_HASH_LEN, inputtext);
			GetPlayerPasswordHash(playerid, storedhash);

			if(!strcmp(inputhash, storedhash))
			{
				Login(playerid);
			}
			else
			{
				LoginPasswordAttempts[playerid]++;

				if(LoginPasswordAttempts[playerid] < 5)
				{
					DisplayLoginPrompt(playerid);
				}
				else
				{
					Kick(playerid);
				}
			}
		}
		else
		{
			SendClientMessageToAllF(GREY, " >  %p left the server without logging in.", playerid);
			Kick(playerid);
		}

		return 1;
	}
	Dialog_ShowCallback(playerid, using inline Response, DIALOG_STYLE_PASSWORD, "Login To Your Account", str, "Accept", "Leave");

	return 1;
}


/*==============================================================================

	Loads a player's account, updates some data and spawns them.

==============================================================================*/


Login(playerid)
{
	SpawnPlayerIntoLoadout(playerid);

	CallLocalFunction("OnPlayerLogin", "d", playerid);
}


/*==============================================================================

	Logs the player out, saving their data and deleting their items.

==============================================================================*/


Logout(playerid)
{
	log("[LOGOUT] %p logged out", playerid);

	CallLocalFunction("OnPlayerLogout", "d", playerid);
}


/*==============================================================================

	Interface

==============================================================================*/


// FIELD_ID_PLAYER_NAME
stock AccountExists(name[])
{
	new exists;

	stmt_bind_value(stmt_AccountExists, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);
	stmt_bind_result_field(stmt_AccountExists, 0, DB::TYPE_INTEGER, exists);

	if(stmt_execute(stmt_AccountExists))
	{
		stmt_fetch_row(stmt_AccountExists);

		if(exists)
			return 1;
	}

	return 0;
}

// FIELD_PLAYER_PASS
stock GetAccountPassword(name[], password[MAX_PASSWORD_LEN])
{
	stmt_bind_result_field(stmt_AccountGetPassword, 0, DB::TYPE_STRING, password, MAX_PASSWORD_LEN);
	stmt_bind_value(stmt_AccountGetPassword, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetPassword))
		return 0;

	stmt_fetch_row(stmt_AccountGetPassword);

	return 1;
}

stock SetAccountPassword(name[], password[MAX_PASSWORD_LEN])
{
	stmt_bind_value(stmt_AccountSetPassword, 0, DB::TYPE_STRING, password, MAX_PASSWORD_LEN);
	stmt_bind_value(stmt_AccountSetPassword, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetPassword);
}

// FIELD_PLAYER_IPV4
stock GetAccountIP(name[], &ip)
{
	stmt_bind_result_field(stmt_AccountGetIpv4, 0, DB::TYPE_INTEGER, ip);
	stmt_bind_value(stmt_AccountGetIpv4, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetIpv4))
		return 0;

	stmt_fetch_row(stmt_AccountGetIpv4);

	return 1;
}

stock SetAccountIP(name[], ip)
{
	stmt_bind_value(stmt_AccountSetIpv4, 0, DB::TYPE_INTEGER, ip);
	stmt_bind_value(stmt_AccountSetIpv4, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetIpv4);
}

// FIELD_PLAYER_REG_DATE
stock GetAccountRegistrationDate(name[], &timestamp)
{
	stmt_bind_result_field(stmt_AccountGetRegdate, 0, DB::TYPE_INTEGER, timestamp);
	stmt_bind_value(stmt_AccountGetRegdate, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetRegdate))
		return 0;

	stmt_fetch_row(stmt_AccountGetRegdate);

	return 1;
}

stock SetAccountRegistrationDate(name[], timestamp)
{
	stmt_bind_value(stmt_AccountSetRegdate, 0, DB::TYPE_INTEGER, timestamp);
	stmt_bind_value(stmt_AccountSetRegdate, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetRegdate);
}

// FIELD_ID_PLAYER_LASTLOG
stock GetAccountLastLogin(name[], &timestamp)
{
	stmt_bind_result_field(stmt_AccountGetLastLog, 0, DB::TYPE_INTEGER, timestamp);
	stmt_bind_value(stmt_AccountGetLastLog, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetLastLog))
		return 0;

	stmt_fetch_row(stmt_AccountGetLastLog);

	return 1;
}

stock SetAccountLastLogin(name[], timestamp)
{
	stmt_bind_value(stmt_AccountSetLastLog, 0, DB::TYPE_INTEGER, timestamp);
	stmt_bind_value(stmt_AccountSetLastLog, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetLastLog);
}

// FIELD_PLAYER_ADMIN_LEVEL
stock GetAccountAdminLevel(name[], &level)
{
	stmt_bind_result_field(stmt_AccountGetAdminLevel, 0, DB::TYPE_INTEGER, level);
	stmt_bind_value(stmt_AccountGetAdminLevel, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetAdminLevel))
		return 0;

	stmt_fetch_row(stmt_AccountGetAdminLevel);

	return 1;
}

stock SetAccountAdminLevel(name[], level)
{
	stmt_bind_value(stmt_AccountSetAdminLevel, 0, DB::TYPE_INTEGER, level);
	stmt_bind_value(stmt_AccountSetAdminLevel, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetAdminLevel);
}

// FIELD_PLAYER_DONATOR_LEVEL
stock GetAccountDonatorLevel(name[], &level)
{
	stmt_bind_result_field(stmt_AccountGetDonator, 0, DB::TYPE_INTEGER, level);
	stmt_bind_value(stmt_AccountGetDonator, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetDonator))
		return 0;

	stmt_fetch_row(stmt_AccountGetDonator);

	return 1;
}

stock SetAccountDonatorLevel(name[], level)
{
	stmt_bind_value(stmt_AccountSetDonator, 0, DB::TYPE_INTEGER, level);
	stmt_bind_value(stmt_AccountSetDonator, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetDonator);
}

// FIELD_PLAYER_BANNED
stock GetAccountBannedState(name[], banned)
{
	stmt_bind_result_field(stmt_AccountGetBannedState, 0, DB::TYPE_INTEGER , banned);
	stmt_bind_value(stmt_AccountGetBannedState, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetBannedState))
		return 0;

	stmt_fetch_row(stmt_AccountGetBannedState);

	return 1;
}

stock SetAccountBannedState(name[], banned)
{
	stmt_bind_value(stmt_AccountSetBannedState, 0, DB::TYPE_INTEGER, banned);
	stmt_bind_value(stmt_AccountSetBannedState, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetBannedState);
}

// FIELD_PLAYER_JAILED
stock GetAccountJailedState(name[], jailed)
{
	stmt_bind_result_field(stmt_AccountGetJailedState, 0, DB::TYPE_INTEGER , jailed);
	stmt_bind_value(stmt_AccountGetJailedState, 0, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	if(!stmt_execute(stmt_AccountGetJailedState))
		return 0;

	stmt_fetch_row(stmt_AccountGetJailedState);

	return 1;
}

stock SetAccountJailedState(name[], jailed)
{
	stmt_bind_value(stmt_AccountSetJailedState, 0, DB::TYPE_INTEGER, jailed);
	stmt_bind_value(stmt_AccountSetJailedState, 1, DB::TYPE_STRING, name, MAX_PLAYER_NAME);

	return stmt_execute(stmt_AccountSetJailedState);
}

