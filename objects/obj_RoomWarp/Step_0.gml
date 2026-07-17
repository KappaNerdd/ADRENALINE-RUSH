var _char = instance_place(x, y, obj_Player);

if !trans {
	if _char {
		scr_SetCamFollow(_char);
		trans = true;
		scr_OverRoomTrans(target_x, target_y, target_rm, target_div, target_xscale, charVel, charYspd, trackChar);
	}
}

visible = global.DEBUG;