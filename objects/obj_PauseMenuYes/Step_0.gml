getCharacterControls();

if global.CurOpt != "Main" && global.CurOpt != "Options" && global.CurOpt != "Audio" && global.CurOpt != "Visual" && global.CurOpt != "Misc" && global.CurOpt != "ControlsSpeed1" && global.CurOpt != "ControlsSpeed2" {
	if instance_exists(obj_NewPauseMenu) {
		if obj_NewPauseMenu.active {
			if place_meeting(x, y, obj_PauseCursor) {
				
				if jump_Key && !audio_is_paused(obj_NewPauseMenu.pause) {
					audio_stop_sound(obj_NewPauseMenu.pause);
					audio_resume_sound(obj_MusicManager.targetSongAsset);
					instance_destroy(obj_PauseCursor);
				}
				
				if global.CurOpt == "Restart" {
					if jump_Key {
						obj_SFXManager.menuPop = true;
						global.Death = false;
						
						if !instance_exists(obj_RoomTransParent) {
							with instance_create_depth(-1000000, 0, 0, obj_RoomTransitionSEGARestart) {
								division = 0.5;
							}
						}
					
						if !global.Freeplay {
							global.PlayerExtraLives -= 1;
							global.PlayerExtraLives -= global.CollectedLives;
						} else {
							global.Health = global.MaxHealth;
						}
					}
				}
				
				if global.CurOpt == "File Select" {
					if jump_Key {
						game_restart();
						obj_SFXManager.menuPop = true;
					}
				}
				
				if global.CurOpt == "Main Menu" {
					if jump_Key && !instance_exists(obj_RoomTransParent) {
						obj_SFXManager.menuPop = true;
						global.Death = false;
						set_song_ingame(noone, 90, 0);
						
						//instance_activate_all();
						//instance_destroy();
						
						if !instance_exists(obj_RoomTransitionBasic) {
							var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
							
							if !file_exists(string(global.NoMindDataFile) + string(global.saveFile) + ".sav") {
								instantiated.target_rm = rm_TitleHead;
							} else {
								instantiated.target_rm = rm_TitleNormal;
							}
						}
					}
				}
				
				if global.CurOpt == "Quit Game" {
					if jump_Key {
						obj_SFXManager.menuPop = true;
						
						game_end();
					}
				}
				
				if global.CurOpt == "HUB" {
					if jump_Key && !instance_exists(obj_RoomTransParent) {
						obj_SFXManager.menuPop = true;
						global.Death = false;
						
						if !instance_exists(obj_RoomTransitionBasicStage) {
							var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasicStage);
							instantiated.target_rm = global.TargetRM;
							instantiated.target_x = global.TargetX;
							instantiated.target_y = global.TargetY;
						}
					}
				}
				
				if global.CurOpt == "Freeplay" {
					if jump_Key && !instance_exists(obj_RoomTransParent) {
						obj_SFXManager.menuPop = true;
						global.Death = false;
						
						set_song_ingame(noone, 90, 0);
						
						if !instance_exists(obj_RoomTransitionSEGAMenu) {
							var instantiated = instance_create_depth(0, 0, -100000000000, obj_RoomTransitionSEGAMenu);
							instantiated.target_rm = rm_Freeplay;
						}
					}
				}
	
				image_blend = global.fullRGB;
		
				if x < camera_get_view_x(view_camera[0]) - 10 {
					x += xspd;
				}
			} else {
				image_blend = c_white;
		
				if x < camera_get_view_x(view_camera[0]) - 40 {
					x += xspd;
				} else if x > camera_get_view_x(view_camera[0]) - 40 {
					x -= xspd;
				}
			}
		} else {
			x -= xspd;
		}
	}
} else {
	if x > camera_get_view_x(view_camera[0]) - 250 {
		x -= xspd;
	}
}


if !instance_exists(obj_PauseMenuBoxParent) {
	instance_destroy();
}

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}