getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	if global.FullScreen {
		global.FullScreen = false;
	} else {
		global.FullScreen = true;
	}
	
	obj_SFXManager.menuTap = true;
}