if !saved {
	if image_alpha < 1 {
		image_alpha += 0.02;
	} else {
		if savedTimer > 0 {
			savedTimer--;
		} else {
			saved = true;
		}
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.02;
	} else {
		instance_destroy();
	}
}


if playAnimationTimer > 0 {
	playAnimationTimer--;
	image_speed = 0;
} else {
	image_speed = 1;
}
