if place_meeting(x, y, obj_TitleCursor) && (keyboard_check_pressed(ord("Z")) or gamepad_button_check_pressed(0, gp_face1)) && !instance_exists(obj_RoomTransitionBasic) {
	if !instance_exists(obj_RoomTransitionBasic) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
		instantiated.target_rm = rm_TitleHead;
	}
}