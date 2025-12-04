getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && !speedStageActive && !obj_FreeplayActionStages.actionStageActive {
	
	if y > 390 {
		y -= 4;
	}
	
	if jump_Key {
		obj_SFXManager.menuPop = true;
		speedStageActive = true;
	}
	
	image_blend = global.fullRGB;
} else {
	if y < 400 {
		y += 4;
	}
	
	image_blend = c_white;
}