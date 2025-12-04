image_angle += rotateSpeed;
kysTimer2 -= 1;
x += xspd;
y += yspd;

if kysTimer <= 120 or kysTimer2 <= 120 {
	vanish -= 1;
	
	if vanish <= 0 {
		vanish = 1;
		
		if visible {
			visible = false;
		} else {
			visible = true;
		}
	}
}

if kysTimer <= 0 or kysTimer2 <= 0 {
	instance_destroy();
}