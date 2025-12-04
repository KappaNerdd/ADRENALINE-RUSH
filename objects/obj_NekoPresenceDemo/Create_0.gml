/// @description Initialize Discord.
if os_type != os_gxgames && os_browser == browser_not_a_browser {
	#macro DISCORD_APP_ID "1338340235830099968"

	ready = false;

	alarm[0] = room_speed * 5;

	if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty)) {
		show_error("NekoPresence init fail. \n(Game will still continue.)", true);
	}
	
	//Set some shit up ("You think you got more sauce than Yung Cash Register A.K.A. Lil' BROOMstick?")

	//State
	levelType = "";
	levelName = "";
	levelNumber = "";
	levelSeconds = "";
	levelMinutes = "";
	levelRank = "";

	//Details
	gameplayType = "";

	//Game & Character
	gameName = "";
	charName = "";
	charIcon = "";
} else {
	instance_destroy();
}
