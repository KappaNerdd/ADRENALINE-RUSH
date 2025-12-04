image_alpha -= 0.05;

if (image_alpha <= 0) {
	instance_destroy();
}


image_xscale += 0.04;
image_yscale += 0.04;