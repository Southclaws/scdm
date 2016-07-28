#include <YSI\y_hooks>


#define DIRECTORY_PLAYERS		DIRECTORY_MAIN"players/"
#define MAX_STORAGE_FILENAME	(42)


static
	store_Filename[MAX_PLAYERS][MAX_STORAGE_FILENAME];


hook OnPlayerConnect(playerid)
{
	new name[MAX_PLAYER_NAME];

	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	format(store_Filename[playerid], MAX_STORAGE_FILENAME, DIRECTORY_PLAYERS"%s.dat", name);

	return 1;
}

hook OnGameModeExit()
{
	new session;

	log("[OnGameModeExit/saveload] Closing open modio sessions for player data.");

	foreach(new i : Player)
	{
		session = modio_getsession_write(store_Filename[i]);

		log("[OnGameModeExit/saveload] Closing file '%s' for playerid: %d (session: %d)", store_Filename[i], i, session);

		if(session != -1)
			modio_finalise_write(session, true);
	}
}


stock GetPlayerStorageFilename(playerid)
{
	return store_Filename[playerid];
}
