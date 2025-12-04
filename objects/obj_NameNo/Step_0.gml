getCharacterControls();

confirm_Key = jump_Key;
cancel_Key = action_Key;


if ((place_meeting(x, y, obj_TitleCursor) && confirm_Key) or (cancel_Key)) && visible == true && global.NameConfirm == true {
	global.NameConfirm = false;
	obj_NamePlayerName.yspd = -2;
}


if global.NameConfirm == true {
	visible = true;
} else if global.NameConfirm == false {
	visible = false;
} else


if instance_exists(obj_NameWhiteTrans) {
	visible = false;
} else {
	visible = true;
}