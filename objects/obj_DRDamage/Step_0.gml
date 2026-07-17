if createTimer > 0 {
	image_yscale = scr_Approach(image_yscale, 1.5, 0.06);
	moveX += xspd;
	moveY += yspd;
	
	if moveY < baseY {
		yspd += 0.1;
	} else {
		moveY = baseY;
		yspd = 0;
		xspd = 0;
	}
	
	xspd = scr_Approach(xspd, 0, 0.05);
	
	createTimer--;
} else {
	image_alpha -= 0.05;
	image_yscale += 0.2;
	moveY -= 1;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}

if global.MIND or global.PlayerChar == 0 {
	col = c_white;
}