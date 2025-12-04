if instance_exists(obj_FreeplayBlock) {
	depth = obj_FreeplayBlock.depth - 10;
} else {
	depth = -30;
}

if !global.SimplifyVFX {
	if image_xscale > 0 {
		image_speed = 1;
	} else if image_xscale < 0 {
		image_speed = -1;
	}
} else {
	image_speed = 0;
}

confirmOpacity = 0;