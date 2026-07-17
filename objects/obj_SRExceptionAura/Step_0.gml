if image_xscale < 1 {	
	image_xscale += 0.05;
}

if image_yscale < 1 {
	image_yscale += 0.025;
} else {
	image_alpha -= 0.05;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
	
	if moveX {
		extraX -= 1.5;
	}
	
	if moveY {
		extraY -= 1.5;
	}
}