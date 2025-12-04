if place_meeting(x, y, obj_TitleCursor) && (keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1)) {
	global.AMBIENCE_VOL -= 0.1;
	obj_SFXManager.menuTap = true;
	if global.AMBIENCE_VOL < 0 {
		global.AMBIENCE_VOL = 1;
	}
}