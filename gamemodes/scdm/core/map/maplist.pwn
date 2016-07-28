#include <YSI\y_hooks>


#define MAX_LOADED_MAPS	(32)
#define MAP_INDEX_FILE	DIRECTORY_MAPS"maplist.txt"


static
	map_List[MAX_LOADED_MAPS][MAX_MAP_NAME],
	map_Total;

hook OnScriptInit()
{
	new
		File:file,
		line[MAX_MAP_NAME + 6], // name + .map + \r\n
		tmpfilename[64 + MAX_MAP_NAME + 5],
		ret;

	file = fopen(MAP_INDEX_FILE, io_read);

	if(!file)
	{
		printf("ERROR: Unable to read map index file '%s'.", MAP_INDEX_FILE);
		for(;;){}
	}

	while(fread(file, line))
	{
		// Strip the carriage return and newline
		strtrim(line, "\r\n");

		if(strlen(line) <= 1)
			continue;

		// Check if the file actually exists
		format(tmpfilename, sizeof(tmpfilename), DIRECTORY_MAPS"%s.map", line);

		if(!fexist(tmpfilename))
		{
			printf("ERROR: Index entry '%s' points to a file that doesn't exist: '%s'.", line, tmpfilename);
			continue;
		}

		// Verify the file contents
		ret = _verifyMapFile(tmpfilename);

		if(ret != 0)
		{
			printf("ERROR: Index entry '%s' isn't a valid map data file (error code: %d)", line, ret);
			continue;
		}

		strcat(map_List[map_Total], line, MAX_MAP_NAME);

		printf("Loaded map '%s'.", map_List[map_Total]);

		map_Total++;
	}

	fclose(file);

	printf("Loaded %d maps", map_Total);

	if(map_Total == 0)
	{
		print("ERROR: No maps were loaded");
		for(;;){}
	}

	LoadMap(random(map_Total));

	return 1;
}

_verifyMapFile(filename[])
{
	new
		File:file,
		line[256],
		teamname,
		teamskin,
		teamspawn;

	file = fopen(filename, io_read);

	while(fread(file, line))
	{
		if(strfind(line, "TeamName", true) != -1)
		{
			teamname++;
			continue;
		}

		if(strfind(line, "TeamSkin", true) != -1)
		{
			teamskin++;
			continue;
		}

		if(strfind(line, "TeamSpawn", true) != -1)
		{
			teamspawn++;
			continue;
		}
	}

	fclose(file);

	if(teamname != 2) // Map must contain one name for each team.
		return 1;

	if(teamskin == 0)
		return 2;

	if(teamspawn == 0)
		return 3;

	return 0;
}


/*==============================================================================

	Initialisation

==============================================================================*/


stock GetMapName(id, name[])
{
	if(!(0 <= id < map_Total))
		return 0;

	name[0] = EOS;
	strcat(name, map_List[id], MAX_MAP_NAME);

	return 1;
}

stock GetMapByName(name[])
{
	for(new i; i < map_Total; i++)
	{
		if(!strcmp(name, map_List[i], true))
			return i;
	}

	return -1;
}

stock GetMapTotal()
{
	return map_Total;
}
