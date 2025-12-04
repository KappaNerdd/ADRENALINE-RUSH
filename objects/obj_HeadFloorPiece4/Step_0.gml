image_angle += angleSpeed;
image_xscale += scaleSpeed;
image_yscale += scaleSpeed;

x += xspd;
y += yspd;

yspd += 0.3;


if kysTimer > 0 {
	kysTimer -= 1;
}

if kysTimer <= 0 {
	if image_alpha > 0 {
		image_alpha -= 0.01;
	}
}

if image_alpha <= 0 {
	instance_destroy();
}