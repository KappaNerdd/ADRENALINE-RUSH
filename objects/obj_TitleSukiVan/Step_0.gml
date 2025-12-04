getCharacterControls();

if carShineTimer > 0 {
	carShineTimer -= 1;
}

if carShineTimer <= 0 {
	carShineTimer = random_range(60, 60 * 4);
	sprite_index = carShine;
	image_index = 0;
}

if waitTimer > 0 {
	waitTimer -= 1;
}

if waitTimer <= 0 {
	if xspd > 0 {
		xspd -= minusXspd;
	}
	
	if xspd <= 0 {
		if !instance_exists(obj_TitleBoxBegin) {
			with (instance_create_depth(700, 288, depth, obj_TitleBoxBegin)) {
				image_xscale = 5;
			}
		}
	}

	x += ((horiFloatAmplitude) * sin(horiFloatingOffset / 12)) + xspd;
	horiFloatingOffset += horiFloatSpeed;
}

if (jump_Key or pause_Key) && !instance_exists(obj_TitleBoxBegin) {
	with (instance_create_depth(700, 288, depth, obj_TitleBoxBegin)) {
		image_xscale = 5;
	}
}