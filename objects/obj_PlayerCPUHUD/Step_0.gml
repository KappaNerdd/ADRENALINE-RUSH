if timer > 0 {
	timer -= 1;
}

if timer <= 0 {
	if image_alpha > 0 {
		image_alpha -= alphaOpacityChange;
	}
}

if image_alpha <= 0 {
	instance_destroy();
}