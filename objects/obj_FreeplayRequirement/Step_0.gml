if !alphaDown {
	if image_alpha < 1 {
		image_alpha += 0.05;
	}
	
	if image_alpha >= 1 {
		if alphaDownTimer > 0 {
			alphaDownTimer -= 1;
		}
		
		if alphaDownTimer <= 0 {
			alphaDown = true;
		}
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}