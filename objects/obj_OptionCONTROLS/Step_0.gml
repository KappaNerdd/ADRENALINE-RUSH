getCharacterControls();

if place_meeting(x, y, obj_TitleCursor) && global.OptionChoice != 3 && (jump_Key) {
	global.OptionChoice = 3;
	obj_SFXManager.menuTap = true;
}