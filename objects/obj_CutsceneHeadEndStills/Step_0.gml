sprite_index = sprite;


if waitTimer > 0 {
	waitTimer -= 1;
}


if waitTimer <= 0 && trans == false {
	room_goto(targetRM);
} else if waitTimer <= 0 && trans == true {
	if !instance_exists(obj_RoomTransitionBasic) {
		with(instance_create_depth(x, y, depth, obj_RoomTransitionBasic)) {
			target_rm = other.targetRM;
		}
	}
}

if keyboard_check_pressed(ord("X")) or gamepad_button_check_pressed(0, gp_face2) {
	if !instance_exists(obj_RoomTransitionBasic) {
		with(instance_create_depth(x, y, depth, obj_RoomTransitionBasic)) {
			target_rm = rm_HeadSpeedBoss;
		}
	}
}



if fade == true {
	image_alpha -= fadeAlpha;
}