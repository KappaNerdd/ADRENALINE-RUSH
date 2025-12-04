getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (obj_FreeplaySpeedStages.speedStageActive or obj_FreeplayActionStages.actionStageActive) {
	image_blend = global.fullRGB;
	
	if jump_Key_Held {
		obj_FreeplayMenuParent.y -= 5;
		image_index = 1;
	} else {
		image_index = 0;
	}
} else {
	image_blend = c_white;
	
	image_index = 0;
}


x = obj_FreeplayMenuParent.x + 620;