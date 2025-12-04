if !bounce && !active {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 2;
}

if instance_exists(obj_Player) {
	depth = obj_Player.depth + 1;
}