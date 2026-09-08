/// @description Initialize Discord.
if os_type != os_gxgames && os_browser == browser_not_a_browser {
	#macro DISCORD_APP_ID "1338340235830099968"
	ready = false;
	alarm_set(0, 300);

	if !np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty) {
		show_error("NekoPresence init fail. \n(Game will still continue.)", true);
	}
	
	rankChecking = [
		"F", 
		"D", 
		"C",
		"B",
		"A",
		"S",
		"P"
	]
} else {
	instance_destroy();
}
