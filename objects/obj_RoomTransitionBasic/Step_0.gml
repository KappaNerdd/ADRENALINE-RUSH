if room == target_rm && image_index > 10 {
	if instance_exists(obj_Player) {
		obj_Player.x = target_x;
		obj_Player.y = target_y;
		obj_Player.image_xscale = target_xscale;
	}
}

if room == target_rm && image_index < 1 {
	//Kill Yourself NOW
	instance_destroy();
}
