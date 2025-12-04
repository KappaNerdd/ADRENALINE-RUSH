confirm_Key = keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1);


if place_meeting(x, y, obj_TitleCursor) && confirm_Key && confirmed == false && global.NameConfirm == false {
	confirmed = true;
	
	if !instance_exists(obj_RoomTransitionBasic) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
		instantiated.target_rm = target_rm;
	}
}

if global.NameConfirm == true {
	visible = false;
} else {
	visible = true;
}
