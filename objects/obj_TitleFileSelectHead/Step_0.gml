getCharacterControls();

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer >= 89 {
		if y > mainY - 40 {
			y -= yspd;
		}
		
		if y <= mainY - 40 {
			y = mainY - 40;
		}
	}
}


if place_meeting(x, y, obj_TitleCursor) {
	image_blend = c_white;
	
	if jump_Key {
		obj_SFXManager.menuPop = true;
		game_restart();
	}
} else {
	image_blend = c_grey;
}