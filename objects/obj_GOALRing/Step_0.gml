depth = obj_Player.depth - 10;

if place_meeting(x, y, obj_Player) && goal == false && !global.Death {
	goal = true;
	obj_InputRecorder.isRecording = false;
	
	obj_Player.enemyComboTimer = 1;
	
	obj_Player.speedBreak = false;
	obj_Player.speedBreakTimer = obj_Player.speedBreakFrames;
	
	obj_CameraExtended.following = self;
	
	set_song_ingame(noone, 300, 0);
	
	with(obj_Player) {
		if abs(vel) <= 5 {
			other.image_speed = 0.5;
			other.spinBonus = 1000;
		} else if abs(vel) > 5 && abs(vel) < 10 {
			other.image_speed = 1;
			other.spinBonus = 2500;
		} else if abs(vel) >= 10 && abs(vel) < 15 {
			other.image_speed = 3;
			other.spinBonus = 5000;
		} else if abs(vel) >= 15 && abs(vel) < 20 {
			other.image_speed = 4;
			other.spinBonus = 10000;
		} else if abs(vel) >= 20 {
			other.image_speed = 5;
			other.spinBonus = 20000;
		}
	}
	
	with (instance_create_depth(-100000, 0, 0, obj_MoreBonus)) {
		bonus3 = other.spinBonus;
	}
	
	scr_StopPlayerHurt();
	obj_Player.can_Move = false;
}

if goal {
	global.countUp = false;
	obj_Player.can_Move = false;
	obj_Player.sliding = false;
	obj_Player.rushModeTimer = 0;
	
	//---Character Specific---//
	
	scr_StopCharShit();
	
	with(obj_Player) {
		right_Key = true;
		action1_Key_Held = false;
		left_Key = false;
		jump_Key_Held = false;
	}
} else {
	if createRingTimer > 0 {
		createRingTimer -= 1;
	}
	
	if createRingTimer <= 0 {
		if !global.SimplifyVFX {
			instance_create_depth(x, y, depth, obj_GOALRingSil1);
		}
		
		createRingTimer = createRingFrames;
	}
}

if goal && !resultsCreate {
	if createSoundTimer > 0 {
		createSoundTimer -= 1;
	}
		
	if createSoundTimer <= 0 {
		createSoundTimer = createSoundFrames;
		
		var _randomX = random_range(sprite_width / 2, -sprite_width / 2);
		var _randomY = random_range(sprite_height / 2, -sprite_height / 2);
		
		if global.Particles {
			instance_create_depth(x + _randomX, y + _randomY, depth - 10, obj_GOALRingSparkles);
		}
	}
}

if goal && goalTimer > 0 {
	goalTimer -= 1;
	//obj_SFXManager.rushRingLoop = true;
	
	if !audio_is_playing(snd_RushRingLoop) {
		audio_play_sound(snd_RushRingLoop, 8, true, global.MASTER_VOL * global.SFX_VOL);
	}
}

if goalTimer < 0 {
	goalTimer = 0;
}

if goalTimer <= 0 {
	if image_speed > 0 {
		image_speed -= 0.02;
		iconSprite = global.PlayerSelection[global.PlayerChar][28][2];
	}
	
	if image_speed <= 1.175 {
		if !slowSound {
			slowSound = true;
			obj_SFXManager.rushRingSlow = true;
			
			if audio_is_playing(snd_RushRingLoop) {
				audio_stop_sound(snd_RushRingLoop);
			}
		}
	}
	
	if image_speed <= 0 {
		if instance_exists(obj_GhostRecorder) {
			obj_GhostRecorder.ghostRecord = false;
		}
		
		image_index = 0;
		
		if !resultsCreate {
			resultsCreate = true;
			obj_SFXManager.rushRingFinish = true;
			
			if !global.SimplifyVFX {
				instance_create_depth(x, y, depth, obj_GOALRingSil2);
			}
			
			#region //Particles
				if global.Particles {
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 0;
						addY = -3;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 1.5;
						addY = -1.5;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 3;
						addY = 0;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 1.5;
						addY = 1.5;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = 0;
						addY = 3;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = -1.5;
						addY = 1.5;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = -3;
						addY = 0;
					}
					
					with (instance_create_depth(x, y, depth - 10, obj_GOALRingSparkles)) {
						addX = -1.3;
						addY = -1.3;
					}
				}
			#endregion
		}
		
		if resultsCreate {
			if resultsDoneTimer > 0 {
				resultsDoneTimer -= 1;
			}
			
			if resultsDoneTimer <= 0 && !resultsDone {
				resultsDone = true;
				instance_create_depth(x, y - 1000000, depth, obj_GOAL);
			}
		
			if resultsSparklesTimer > 0 {
				resultsSparklesTimer -= 1;
			}
		
			if resultsSparklesTimer <= 0 {
				resultsSparklesTimer = 5;
		
				var _randomX = random_range(sprite_width / 2, -sprite_width / 2);
				var _randomY = random_range(sprite_height / 2, -sprite_height / 2);
		
				if global.Particles {
					instance_create_depth(x + _randomX, y + _randomY, depth - 10, obj_GOALRingSparkles);
				}
			}
		}
	}
}

if global.MIND or global.PlayerChar == 0 {
	mindFrames += mindAnim;
}

if mindFrames >= 3 {
	mindFrames = 0;
}
