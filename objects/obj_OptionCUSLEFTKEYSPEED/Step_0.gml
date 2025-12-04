scr_ChangeControlSprites();
getCharacterControls();
scr_SetControl();

if place_meeting(x, y, obj_TitleCursor) && jump_Key && !changeBind {
	changeBind = true;
	obj_SFXManager.homingLockOn = true;
}


if changeBind {
	if !gamepad_is_connected(global.Player1Con) {
		global.LeftKeySpeed = remappedBind;
	} else {
		global.LeftPadSpeed = remappedBind;
	}
}