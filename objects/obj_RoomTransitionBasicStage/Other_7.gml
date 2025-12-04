image_speed = -1;
room_goto(target_rm);

if instance_exists(obj_Player) {
	obj_Player.can_Move = true;
}