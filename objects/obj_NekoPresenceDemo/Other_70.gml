/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if ev_type == "DiscordReady" {
	global.discord_initialized = true;
	
	ready = true;
	//show_debug_message("date: " + string(date_current_datetime()));
	//np_setpresence_timestamps(date_current_datetime(), 0, false);
	//np_setpresence_more(string(charName), "TBAHS", false);
	
	// bruh
	// np_setpresence_buttons(0, "Kremlin", "https://kremlin.ru");
	// np_setpresence_buttons(1, "Russian Facebook", "https://vk.com/");
	// DISCORD_MAX_BUTTONS == 2, so only allowed IDs are 0 and 1.
	
	//np_setpresence() should ALWAYS come the last!!
	//np_setpresence(string(levelType) + string(levelName) + string(levelNumber), string(gameplayType) + string(charName), "astraicon", string(charIcon));
	
	//Update some extra bullshit ("I'M ABOUT TO BEAT SOME ASSETS IN THIS KITCHEN!")
	var _charCheck = global.PlayerCostume;

	if global.MIND or global.PlayerChar == 0 {
		_charCheck = 0;
	}

	var _charIcon = global.PlayerSelection[global.PlayerChar][27][_charCheck];
	
	if instance_exists(obj_Player) {
		if !instance_exists(obj_StageTrackerSpeed) && !instance_exists(obj_StageTrackerAction) {
			np_setpresence("", "", "astraicon", string(_charIcon));
		} else if instance_exists(obj_StageTrackerSpeed) {
			//SPEED Stage Shit
			var _stageName = global.speedStageData[global.SpeedSelected].stage_Name;
			var _levelName = global.speedStageData[global.SpeedSelected].stage_Type;
			var _levelNum = global.speedStageData[global.SpeedSelected].level_Num;
			var _speedExtra0 = ":0";

			if global.seconds >= 10 {
				_speedExtra0 = ":";
			}
			
			np_setpresence(
				string(global.minutes) + string(_speedExtra0) + string(global.seconds) + 
				" || " + string(global.GameScore) + 
				" || " + string(global.Rings) + 
				" || " + string(global.EnemyCount) +
				" - " + string(rankChecking[global.Rank]),
				scr_LocalText(string(_stageName)) + ": " + scr_LocalText(string(_levelName)) + scr_LocalText(string(_levelNum)), 
				"astraicon", string(_charIcon)
			);
		}
	} else {
		var _roomName = "";
		var _altShit = "";
		
		if !instance_exists(obj_NewerPauseMenu) {
			if room == rm_MainMenuNew {
				_roomName = "menu_MainMenu";
			
				if instance_exists(obj_Boombox) {
					_altShit = global.JukeboxPlaylist[global.JukeBoxChoice][1];
				}
			} else if room == rm_FreeplayNew {
				_roomName = "title_Freeplay";
			
				if instance_exists(obj_Boombox) {
					_altShit = global.JukeboxPlaylist[global.JukeBoxChoice][1];
				}
			} else if room == rm_CharSelectNew {
				_roomName = "freeplay_CharSelect";
				_altShit = global.PlayerSelection[global.PlayerChar][0][0];
			}
		} else {
			_roomName = "menu_Paused";
		}
		
		np_setpresence(scr_LocalText(string(_altShit)), scr_LocalText(string(_roomName)), "astraicon", string(_charIcon));
	}
}

