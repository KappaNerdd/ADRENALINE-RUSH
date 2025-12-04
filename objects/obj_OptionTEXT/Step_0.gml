getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	global.TEXT_VOL -= 0.1;
	obj_SFXManager.menuTap = true;
	
	if global.TEXT_VOL < 0 {
		global.TEXT_VOL = 1;
	}
}