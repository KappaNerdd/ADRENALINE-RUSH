getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) {
	image_blend = c_blue;
	
	if !hovered {
		obj_SFXManager.homingLockOn = true;
		hovered = true;
	}
	
	if jump_Key && image_speed == 0 && global.TitleOpt == "OPTIONS" {
		obj_SFXManager.funkinFav = true;
		
		image_speed = 3;
		image_index = 0;
		
		global.TitleSettings -= 1;
		
		if global.TitleSettings < 0 {
			global.TitleSettings = 4;
		}
	}
} else {
	image_blend = c_white;
	hovered = false;
}


x = obj_TitleBoxMainOpt.x - 65;
y = obj_TitleBoxMainOpt.y + 16;