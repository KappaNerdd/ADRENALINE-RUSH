function scr_RoomTrans(_obj = obj_RoomTransitionSEGAMenu, _room) {
	if !instance_exists(obj_RoomTransParent) {
		with(instance_create_depth(0, 0, -999999, _obj)) {
			target_rm = _room;
		}
	}
}

function scr_MainMenuTrans(_type) {
	if !instance_exists(obj_RoomTransParent) {
		with(instance_create_depth(0, 0, -999999, obj_RoomTransitionSEGAMenu)) {
			target_rm = rm_MainMenuNew;
			type = _type;
		}
	}
}

function scr_LeaveTrans() {
	if !instance_exists(obj_RoomTransParent) {
		instance_create_depth(0, 0, 0, obj_LeaveGameTransSEGA);
	}
}

function scr_OverRoomTrans(_x = 0, _y = 0, _rm = noone, _xscale = 1, _div = 1, _vel = 0, _yspd = 0, _char = true) {
	if !instance_exists(obj_RoomTransParent) {
		with(instance_create_depth(-100000, 0, -999999, obj_RoomTransitionSEGAMenu)) {
			target_x = _x;
			target_y = _y;
			target_rm = _rm;
			target_xscale = _xscale;
			division = _div;
			target_vel = _vel;
			target_yspd = _yspd;
			checkChar = _char;
		}
	}
}

function scr_ChangePos(_x = 0, _y = 0, _div = 1) {
	if !instance_exists(obj_RoomTransParent) {
		with(instance_create_depth(-100000, 0, -999999, obj_RoomTransitionSEGAChangePos)) {
			target_x = _x;
			target_y = _y;
			division = _div;
		}
	}
}

function scr_WhiteTrans(_rm = noone, _div = 1) {
	if !instance_exists(obj_RoomTransParent) {
		with(instance_create_depth(-100, 0, -10, obj_BaseWhiteTrans)) {
			target_rm = _rm;
			division = _div;
		}
	}
}