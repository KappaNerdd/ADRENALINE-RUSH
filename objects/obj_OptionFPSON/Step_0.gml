getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	if global.FPSOn {
		global.FPSOn = false;
	} else {
		global.FPSOn = true;
	}
	
	obj_SFXManager.menuTap = true;
}