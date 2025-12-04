getCharacterControls();

if !obj_FreeplaySpeedStages.speedStageActive && !obj_FreeplayActionStages.actionStageActive {
	if place_meeting(x, y, obj_TitleCursor) {
	
		if y > 409 {
			y -= 4;
		}
	
		if jump_Key {
			if !instance_exists(obj_RoomTransitionSEGAMenu) {
				var instantiated = instance_create_depth(0, 0, -99999999, obj_RoomTransitionSEGAMenu);
				instantiated.target_rm = rm_TitleNormal;
				global.Freeplay = false;
			
				set_song_ingame(noone, 90, 0);
				obj_SFXManager.menuPop = true;
			}
		}
		
		image_blend = global.fullRGB;
	} else {
		if y < 429 {
			y += 4;
		}
		
		image_blend = c_white;
	}


	if action_Key && !instance_exists(obj_RoomTransitionSEGAMenu) {
		var instantiated = instance_create_depth(0, 0, -99999999, obj_RoomTransitionSEGAMenu);
		instantiated.target_rm = rm_TitleNormal;
		global.Freeplay = false;
			
		set_song_ingame(noone, 90, 0);
		obj_SFXManager.menuPop = true;
	}
}