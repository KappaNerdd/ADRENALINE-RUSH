getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	global.Language += 1;
	
	if global.Language > 2 {
		global.Language = 1;
	}
	
	obj_SFXManager.menuTap = true;
} 