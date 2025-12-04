image_speed = -1;
room_goto(target_rm);

if instance_exists(obj_Player) {
	obj_Player.can_Move = true;
	
	obj_Player.x = target_x;
	obj_Player.y = target_y;
	
	if !obj_Player.leftFacer {
		obj_Player.image_xscale = target_xscale;
	} else {
		if target_xscale == -1 {
			obj_Player.face_Left = true;
		} else {
			obj_Player.face_Left = false;
		}
	}
}