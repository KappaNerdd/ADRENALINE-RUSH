getCharacterControls();

confirm_Key = jump_Key;
otherConfirm_Key = pause_Key;


if ((place_meeting(x, y, obj_TitleCursor) && confirm_Key) or pause_Key) && visible == true && global.NameAllowed == true && global.NameDone == false {
	global.NameDone = true;
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


if global.NameAllowed == false {
	image_alpha = 0.5;
} else {
	image_alpha = 1;
}


if global.NameDone == true && room == rm_NameMaker {
	if !instance_exists(obj_NameWhiteTrans) {
		instance_create_depth(x, y, depth, obj_NameWhiteTrans);
	}
}