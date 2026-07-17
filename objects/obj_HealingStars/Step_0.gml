x += xspd;
y += yspd;
image_angle += angleChange;

if kysTimer > 0 {
	kysTimer--;
	image_alpha += 0.075;
} else {
	image_alpha -= 0.05;
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}

xspd = lerp(xspd, 0, 0.005);
yspd = lerp(yspd, 0, 0.005);
angleChange = lerp(angleChange, 0, 0.005);