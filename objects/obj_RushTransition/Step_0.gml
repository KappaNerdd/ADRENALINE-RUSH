if !transd {
	rushX = lerp(rushX, -35, 0.15);
	
	if rushX <= -34.5 {
		transd = true;
		
		if !speedStage && !restart {
			room_goto(target_rm);
		}
	}
} else {
	if !restart {
		if !speedStage {
			rushX = lerp(rushX, -750, 0.15);
		
			if rushX <= -749.5 {
				instance_destroy();
			}
		} else {
			if speedAlpha < 1.5 {
				speedAlpha += 0.025;
			} else {
				room_goto(target_rm);
				instance_destroy();
				
				if global.Jukebox == 2 {				
					set_song_ingame(global.CustTrack, 0, 0);
				}
			}
		}
	} else {
		if speedAlpha < 1.5 {
			speedAlpha += 0.025;
		} else {
			global.DisableHUD = false;
			global.FreeFall = false;
			
			if room == global.speedStageData[global.SpeedSelected].stage_RM {
				room_restart();
			} else {
				room_goto(global.speedStageData[global.SpeedSelected].stage_RM);
			}
			
			instance_destroy();
		}
	}
}