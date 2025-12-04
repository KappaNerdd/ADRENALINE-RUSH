//Slowly fade in BG Box
if image_alpha < 1 {
	image_alpha += 0.05;
}

//Prevent Player from moving
if instance_exists(obj_Player) {
	obj_Player.can_Move = false;
	obj_Player.prepare = true;
}