getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (!actionStageActive && !obj_FreeplaySpeedStages.speedStageActive) {
	image_blend = global.fullRGB;
	
	
	if y > 390 {
		y -= 4;
	}
	
	if jump_Key {
		obj_SFXManager.funkinLocked = true;
		image_blend = c_red;
	}
} else {
	if y < 400 {
		y += 4;
	}
	
	image_blend = c_white;
}