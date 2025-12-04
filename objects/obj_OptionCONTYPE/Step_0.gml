getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	global.ConType += 1;
	
	if global.ConType > 2 {
		global.ConType = 0;
	}
	
	obj_SFXManager.menuTap = true;
}