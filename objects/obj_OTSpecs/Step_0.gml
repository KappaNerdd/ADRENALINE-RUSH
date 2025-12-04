if kysTimer > 0 {
	kysTimer -= 1;
	
	image_alpha = lerp(image_alpha, 1, 0.025);
} else {
	image_alpha = lerp(image_alpha, 0, 0.1);
}

if image_alpha <= 0 {
	instance_destroy();
}

x += xspd;
y += yspd;