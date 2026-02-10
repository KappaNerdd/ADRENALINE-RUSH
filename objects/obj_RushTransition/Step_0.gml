if !transd {
	rushX = lerp(rushX, -20, 0.15);
	
	if rushX <= -19.5 {
		transd = true;
		
		if !speedStage && !restart {
			room_goto(target_rm);
		}
	}
} else {
	if !restart {
		if !speedStage {
			rushX = lerp(rushX, -400, 0.15);
		
			if rushX <= -399.5 {
				instance_destroy();
			}
		} else {
			if speedAlpha < 1.5 {
				speedAlpha += 0.025;
			} else {
				room_goto(target_rm);
				instance_destroy();
				
				if global.Jukebox {
					var _custArray = global.CustomJukeboxPlaylist;
				
					if global.JukeboxShuffle {
						_custArray = global.CustomJukeShuffled;
					}
				
					var _custTrack = audio_create_stream(_custArray[global.CustomJukeChoice]);
				
					set_song_ingame(_custTrack, 0, 60);
				}
			}
		}
	} else {
		if speedAlpha < 1.5 {
			speedAlpha += 0.025;
		} else {
			room_restart();
			instance_destroy();
		}
	}
}