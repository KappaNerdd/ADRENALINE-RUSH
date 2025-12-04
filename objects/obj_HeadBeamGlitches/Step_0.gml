if timer > 0 {
	timer -= 1;
}

if timer <= 0 {
	image_alpha -= 0.05;
}

if image_alpha <= 0 {
	instance_destroy();
}


image_angle += changeAngle;
x += xspd;
y += yspd;
