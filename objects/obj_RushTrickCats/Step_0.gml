sprite_index = cats[catSpr];

if waitTimer > 0 {
	waitTimer--;
} else {
	if disTimer > 0 {
		disTimer--;
	} else {
		instance_destroy();
	}
	
	if yspd < 0 {
		image_index = 0;
	} else {
		image_index = 1;
	}
	
	yspd += grav;
	newX += xspd;
	newY += yspd
}