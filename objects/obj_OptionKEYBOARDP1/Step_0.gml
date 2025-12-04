getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	if global.KeyboardP1 {
		global.KeyboardP1 = false;
	} else {
		global.KeyboardP1 = true;
	}
	
	obj_SFXManager.menuTap = true;
}