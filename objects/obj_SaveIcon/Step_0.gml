if !saved {
	if image_alpha < 1 {
		image_alpha += 0.02;
	}
	
	if image_alpha >= 1 {
		if savedTimer > 0 {
			savedTimer -= 1;
		}
		
		if savedTimer <= 0 {
			saved = true;
		}
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.02;
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}


if playAnimationTimer > 0 {
	playAnimationTimer -= 1;
	image_speed = 0;
}

if playAnimationTimer <= 0 {
	image_speed = 1;
}
