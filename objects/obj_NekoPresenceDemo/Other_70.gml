/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	global.discord_initialized = true;
	
	ready = true;
	show_debug_message("date: " + string(date_current_datetime()));
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more(string(charName), "TBAHS", false);
	
	// bruh
	// np_setpresence_buttons(0, "Kremlin", "https://kremlin.ru");
	// np_setpresence_buttons(1, "Russian Facebook", "https://vk.com/");
	// DISCORD_MAX_BUTTONS == 2, so only allowed IDs are 0 and 1.
	
	//np_setpresence() should ALWAYS come the last!!
	if instance_exists(obj_StageTrackerSpeed) {
		np_setpresence(string(levelType) + string(levelName) + string(levelNumber) + "Time: " + string(levelMinutes) + ":" + string(levelSeconds), string(gameplayType) + string(charName), "astraicon", string(charIcon));
	} else {
		np_setpresence(string(levelType) + string(levelName) + string(levelNumber), string(gameplayType) + string(charName), "astraicon", string(charIcon));
	}
}

