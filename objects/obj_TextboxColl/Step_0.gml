if !instance_exists(obj_Player) {
	exit;
}


if instance_exists(obj_Player) && place_meeting(x, y, obj_Player) && (obj_Player.can_MoveFULL) && !instance_exists(obj_Textbox) && (keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0, gp_shoulderr)) && obj_Player.ground == true && obj_Player.vel == 0 && obj_Player.stomped == false && obj_Player.specialIdle == false {
	create_textbox(text_id);
}


if global.DEBUG == true {
	visible = true;
} else {
	visible = false;
}