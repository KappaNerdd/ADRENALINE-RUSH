if waitTimer > 0 {
	waitTimer -= 1;
}

if waitTimer <= 0 {
	if xspd > 0 {
		xspd -= minusXspd;
	}
	
	x += xspd;
	
	y += (floatAmplitude * sin(floatingOffset / 2));
	floatingOffset += floatSpeed;

	image_angle += ((rotationSpeed) * sin(rotationOffset / 6));
	rotationOffset += rotationSpeed;
}