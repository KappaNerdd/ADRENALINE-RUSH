if image_alpha > 0 {
	image_alpha -= 0.005;
}

if image_yscale > 0.01 {
	image_yscale -= 0.025;
}

if image_alpha <= 0 {
	instance_destroy();
}