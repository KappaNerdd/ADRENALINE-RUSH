getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && global.OptionChoice != 2 && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	global.OptionChoice = 2;
	obj_SFXManager.menuTap = true;
}