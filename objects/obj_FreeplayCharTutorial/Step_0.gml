getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && !obj_FreeplaySpeedStages.speedStageActive && !obj_FreeplayActionStages.actionStageActive {
	
	if y > 390 {
		y -= 4;
	}
	
	if jump_Key && !waiting {
		waiting = true;
		instance_destroy(obj_TitleCursor);
		obj_SFXManager.funkinCheckpoint = true;
		set_song_ingame(noone, 90, 0);
	}
	
	image_blend = global.fullRGB;
} else {
	if y < 400 {
		y += 4;
	}
	
	image_blend = c_white;
}


if waiting {
	if waitTimer > 0 {
		waitTimer -= 1;
	}
	
	if waitTimer <= 0 {
		if !instance_exists(obj_RoomTransitionSEGAMenu) {
			var instantiated = instance_create_depth(0, 0, -99999999, obj_RoomTransitionSEGAMenu);
			instantiated.target_rm = target_rm;
		}
	}
}