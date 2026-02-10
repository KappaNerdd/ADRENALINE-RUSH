getCharacterControls();

if kysTimer > 0 {	
	if mainAlpha < 1 {
		mainAlpha += 0.025;
	}
	
	kysTimer--;
	
	if kysTimer < 180 {
		charScale = lerp(charScale, 0.85, 0.025);
		charX = lerp(charX, 0, 0.025);
	}
	
	if global.LevelForced {
		obj_Player.can_Move = false;
	} else {
		if jump_Key && !global.Replay {
			kysTimer = 0;
			mainAlpha = 0;
			otheralpha = 0;
			whiteAlpha = 0;
		}
		
		obj_Player.can_MoveFULL = false;
		
		if obj_Player.leftFacer {
			obj_Player.sprite_index = obj_Player.sprRunRight;
		} else {
			obj_Player.sprite_index = obj_Player.sprRun;
		}
		
		if kysTimer > 120 {
			obj_Player.image_speed = 0.3;
		} else {
			obj_Player.image_speed += 0.0175;
		}
	}
} else {
	if otheralpha > 0 {
		otheralpha -= 0.035;
	}
	
	spikeInX += 0.05;
	spikeX -= spikeInX;
	
	if otheralpha <= 0 {
		if mainAlpha > 0 {
			mainAlpha -= 0.035;
		}
	}
	
	whiteAlpha = mainAlpha;
	
	if otheralpha <= 0 {
		if !global.Jukebox && !finishedCreate {
			scr_MusicTag();
		}
		
		global.countUp = true;
		
		if global.LevelForced {
			obj_Player.can_Move = true;
		} else {
			if !finishedCreate {
				obj_Player.can_MoveFULL = true;
				obj_Player.can_Move = true;
				obj_Player.vel = obj_Player.full_Speed - 1;
				obj_Player.noMoveTimer = 30;
			}
		}
		
		if !finishedCreate {
			if instance_exists(obj_InputRecorder) {
				if global.Replay {
					obj_InputRecorder.isPlaying = true;
				} else {
					obj_InputRecorder.isRecording = true;
				}
			}
		
			if instance_exists(obj_GhostRecorder) {
				if !global.Replay {
					obj_GhostRecorder.ghostRecord = true;
				}
			}
		
			if !instance_exists(obj_ActualGhost) {
				if global.ShowGhost {
					instance_create_depth(x, y, depth, obj_ActualGhost);
				}
			}
			
			finishedCreate = true;
		}
		
		if mainAlpha <= 0 {
			instance_destroy();
		}
	}
}

spikeFrames += spikeAnim;

if spikeFrames >= 20 {
	spikeFrames = 0;
}