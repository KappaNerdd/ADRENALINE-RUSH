
image_xscale += scaleSpeed;
image_yscale += scaleSpeed;
image_angle += angleSpeed;

y += yspd;


if image_alpha > 0 {
	image_alpha -= 0.01;
}

if image_alpha <= 0 {
	instance_destroy();
}