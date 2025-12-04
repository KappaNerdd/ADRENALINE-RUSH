getCharacterControls();

confirm_Key = jump_Key;


if ((place_meeting(x, y, obj_TitleCursor) && confirm_Key) or pause_Key) && visible == true && string_length(global.PlayerName) > 0 && global.NameConfirm == false {
	global.NameConfirm = true;
	global.PlayerChar = 0;
	
	obj_NamePlayerName.yspd = 2;
}

if global.NameConfirm == true {
	visible = false;
} else {
	visible = true;
}