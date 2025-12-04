if image_index <= 1 && image_speed == -1 {
	//Kill Yourself NOW
	instance_destroy();
	
	if instance_exists(obj_Player) {
		obj_Player.can_MoveFULL = true;
	}
}
