/*
	Map object:

	Map Name[string]
	Team Names[2][string]
	Team Skins:[n][int]
	Team Spawns[n][3]
	Objects[n][7]
	Vehicles[n][5]
*/

#define MAX_MAP_NAME		(32)
#define MAX_MAP_TEAM_NAME	(24)
#define MAX_MAP_TEAM_SKIN	(5)
#define MAX_MAP_SPAWNS		(64)
#define MAX_MAP_OBJECTS		(4096)
#define MAX_MAP_VEHICLES	(20)


enum E_SPAWN_DATA{Float:E_SPAWN_X, Float:E_SPAWN_Y, Float:E_SPAWN_Z}


static
	map_Name			[MAX_MAP_NAME],

	map_TeamName		[2][MAX_MAP_TEAM_NAME],
	map_TeamSkins		[2][MAX_MAP_TEAM_SKIN],
	map_TeamSkinsTotal	[2],
	map_TeamSpawns		[2][MAX_MAP_SPAWNS][E_SPAWN_DATA],
	map_TeamSpawnsTotal	[2],

	map_Object			[MAX_MAP_OBJECTS],
	map_TotalObjects,
	map_Vehicle			[MAX_MAP_VEHICLES],
	map_TotalVehicles;

static
	map_CurrentMap = -1;


stock LoadMap(id)
{
	if(map_CurrentMap != -1)
		_UnloadMap();

	new
		mapname[MAX_MAP_NAME],
		filename[64 + MAX_MAP_NAME + 5],
		File:file,
		line[256],
		funcname[32],
		funcargs[128],
		linenumber,

		team_id,
		team_name[MAX_MAP_TEAM_NAME],
		team_skin,
		Float:team_spawn_x,
		Float:team_spawn_y,
		Float:team_spawn_z,

		modelid,
		Float:posx,
		Float:posy,
		Float:posz,
		Float:rotx,
		Float:roty,
		Float:rotz,
		colour1,
		colour2,
		respawn_delay;

	GetMapName(id, mapname);

	format(filename, sizeof(filename), DIRECTORY_MAPS"%s.map", mapname);
	file = fopen(filename, io_read);

	printf("Loading map '%s' from '%s'.", mapname, filename);

	while(fread(file, line))
	{
		linenumber++;

		if(line[0] < 65)
			continue;

		if(sscanf(line, "p<(>s[32]p<)>s[128]{s[96]}", funcname, funcargs))
			continue;

		if(!strcmp(funcname, "TeamName", false))
		{
			sscanf(funcargs, "p<,>ds[24]", team_id, team_name);
			_SetTeamName(team_id, team_name, linenumber);
			continue;
		}

		if(!strcmp(funcname, "TeamSkin", false))
		{
			sscanf(funcargs, "p<,>dd", team_id, team_skin);
			_AddTeamSkin(team_id, team_skin, linenumber);
			continue;
		}

		if(!strcmp(funcname, "TeamSpawn", false))
		{
			sscanf(funcargs, "p<,>dfff", team_id, team_spawn_x, team_spawn_y, team_spawn_z);
			_AddTeamSpawn(team_id, team_spawn_x, team_spawn_y, team_spawn_z, linenumber);
			continue;
		}

		if(!strcmp(funcname, "CreateObject", false))
		{
			sscanf(funcargs, "p<,>dffffff", modelid, posx, posy, posz, rotx, roty, rotz);
			map_Object[map_TotalObjects++] = CreateObject(modelid, posx, posy, posz, rotx, roty, rotz);
			continue;
		}

		if(!strcmp(funcname, "CreateVehicle", false))
		{
			sscanf(funcargs, "p<,>dffffD(-1)D(-1)D(100)", modelid, posx, posy, posz, rotz, colour1, colour2, respawn_delay);
			map_Vehicle[map_TotalVehicles++] = CreateVehicle(modelid, posx, posy, posz, rotz, colour1, colour2, respawn_delay);
			continue;
		}
	}

	printf("Load complete: '%s' vs '%s', %d/%d skins, %d/%d spawns, %d objects, %d vehicles",
		map_TeamName[TEAM_BLUE],
		map_TeamName[TEAM_RED],
		map_TeamSkinsTotal[TEAM_BLUE],
		map_TeamSkinsTotal[TEAM_RED],
		map_TeamSpawnsTotal[TEAM_BLUE],
		map_TeamSpawnsTotal[TEAM_RED],
		map_TotalObjects,
		map_TotalVehicles);

	fclose(file);
}

_SetTeamName(teamid, name[], linenumber)
{
	if(!_validateTeamID(teamid, linenumber))
		return 0;

	if(!isnull(map_TeamName[teamid]))
	{
		printf("ERROR: (Line %d) Tried to assign name '%s' to team %d, team already has a name: '%s'.", linenumber, name, teamid, map_TeamName[teamid]);
		return 0;
	}

	strcat(map_TeamName[teamid], name, MAX_MAP_TEAM_NAME);

	return 1;
}

_AddTeamSkin(teamid, skin, linenumber)
{
	if(!_validateTeamID(teamid, linenumber))
		return 0;

	if(map_TeamSkinsTotal[teamid] == MAX_MAP_TEAM_SKIN)
	{
		printf("ERROR: (Line %d) Team %d has reached the limit for skins.", linenumber, teamid);
		return 0;
	}

	map_TeamSkins[teamid][map_TeamSkinsTotal[teamid]++] = skin;

	return 1;
}

_AddTeamSpawn(teamid, Float:x, Float:y, Float:z, linenumber)
{
	if(!_validateTeamID(teamid, linenumber))
		return 0;

	if(map_TeamSpawnsTotal[teamid] == MAX_MAP_TEAM_SKIN)
	{
		printf("ERROR: (Line %d) Team %d has reached the limit for skins.", linenumber, teamid);
		return 0;
	}

	map_TeamSpawns[teamid][map_TeamSpawnsTotal[teamid]][E_SPAWN_X] = x;
	map_TeamSpawns[teamid][map_TeamSpawnsTotal[teamid]][E_SPAWN_Y] = y;
	map_TeamSpawns[teamid][map_TeamSpawnsTotal[teamid]][E_SPAWN_Z] = z;

	map_TeamSpawnsTotal[teamid]++;

	return 1;
}

_validateTeamID(teamid, linenumber)
{
	if(!(0 <= teamid <= 1))
	{
		printf("ERROR: (Line %d) Team ID %d is invalid. Team ID must be 0 or 1.", linenumber, teamid);
		return 0;
	}

	return 1;
}

_UnloadMap()
{
	map_Name[0] = EOS;

	// Team 0
	map_TeamName		[TEAM_BLUE][0] = EOS;
	map_TeamSkinsTotal	[TEAM_BLUE] = 0;
	map_TeamSpawnsTotal	[TEAM_BLUE] = 0;

	// Team 1
	map_TeamName		[TEAM_RED][0] = EOS;
	map_TeamSkinsTotal	[TEAM_RED] = 0;
	map_TeamSpawnsTotal	[TEAM_RED] = 0;

	// Map stuff
	for(new i; i < map_TotalObjects; i++)
		DestroyDynamicObject(map_Object[i]);

	for(new i; i < map_TotalVehicles; i++)
		DestroyVehicle(map_Vehicle[i]);
}


// map_Name
stock GetCurrentMapName(name[])
{
	name[0] = EOS;
	strcat(name, map_Name, MAX_MAP_NAME);
	return 1;
}

// map_TeamName
stock GetTeamName(teamid, name[])
{
	name[0] = EOS;
	strcat(name, map_TeamName[teamid], MAX_MAP_NAME);
	return 1;
}

// map_TeamSkins
stock GetTeamSkin(teamid, skin)
{
	return map_TeamSkins[teamid][skin];
}

stock GetRandomTeamSkin(teamid)
{
	return map_TeamSkins[teamid][random(map_TeamSkinsTotal[teamid])];
}

// map_TeamSkinsTotal
stock GetTeamTotalSkins(teamid)
{
	return map_TeamSkinsTotal[teamid];
}

// map_TeamSpawns
stock GetTeamSpawn(teamid, spawn, &Float:x, &Float:y, &Float:z)
{
	x = map_TeamSpawns[teamid][spawn][E_SPAWN_X];
	y = map_TeamSpawns[teamid][spawn][E_SPAWN_Y];
	z = map_TeamSpawns[teamid][spawn][E_SPAWN_Z];
}

stock GetRandomTeamSpawn(teamid, &Float:x, &Float:y, &Float:z)
{
	new spawn = random(map_TeamSpawnsTotal[teamid]);
	x = map_TeamSpawns[teamid][spawn][E_SPAWN_X];
	y = map_TeamSpawns[teamid][spawn][E_SPAWN_Y];
	z = map_TeamSpawns[teamid][spawn][E_SPAWN_Z];
}

// map_TeamSpawnsTotal
stock GetTeamTotalSpawns(teamid)
{
	return map_TeamSpawnsTotal[teamid];
}

// map_Object
stock GetMapObjectID(index)
{
	return map_Object[index];
}

// map_TotalObjects
stock GetMapTotalObjects()
{
	return map_TotalObjects;
}

// map_Vehicle
stock GetMapVehicleID(index)
{
	return map_Vehicle[index];
}

// map_TotalVehicles
stock GetMapTotalVehicles()
{
	return map_TotalVehicles;
}
