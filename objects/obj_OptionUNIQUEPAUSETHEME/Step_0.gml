getCharacterControls();


if place_meeting(x, y, obj_TitleCursor) && jump_Key {
	if global.UniquePauseTheme {
		global.UniquePauseTheme = false;
	} else {
		global.UniquePauseTheme = true;
	}
	
	obj_SFXManager.menuTap = true;
}