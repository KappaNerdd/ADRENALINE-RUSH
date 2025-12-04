if instance_exists(obj_NewPauseMenu) {
	if obj_NewPauseMenu.active {
		if xspd > 0 {
			xspd -= 1;
		}
	} else {
		xspd -= 2;
	}
} else {
	instance_destroy();
}

x += xspd;

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}