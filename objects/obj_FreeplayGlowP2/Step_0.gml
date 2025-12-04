if image_alpha > 0 {
	image_alpha -= 0.01;
}

if image_alpha <= 0 {
	instance_destroy();
}

if image_xscale < 1 {
	image_xscale += 0.001;
}

if image_yscale < 1 {
	image_yscale += 0.001;
}