if dim {
	if image_alpha > 0.25 {
		image_alpha -= 0.01;
	}
	
	if image_alpha <= 0.25 {
		dim = false;
	}
} else {
	if image_alpha < 0.75 {
		image_alpha += 0.01;
	}
	
	if image_alpha >= 0.75 {
		dim = true;
	}
}


if global.Particles {
	if partTimer > 0 {
		partTimer -= 1;
	}
	
	if partTimer <= 0 {
		instance_create_depth(x + 5 + random_range(0, sprite_width - 5), y + 16, depth, obj_RailTrickPart);
		partTimer = partFrames;
	}
}