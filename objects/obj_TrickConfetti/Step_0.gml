kysTimer--;

yspd += grav;	
moveY += yspd;

moveX += ((horiFloatAmplitude) * sin(horiFloatingOffset)) + xspd;
horiFloatingOffset += horiFloatSpeed;

if kysTimer <= 0 {
	image_alpha -= 0.05;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}