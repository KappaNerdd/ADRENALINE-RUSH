if image_alpha > 0 {
	image_alpha -= 0.01;
}

if image_alpha <= 0 {
	instance_destroy();
}

image_xscale = scaleChanger * obj_Player.image_xscale;
image_yscale = scaleChanger;

scaleChanger += 0.01;

if !obj_Player.fullCharge {
	instance_destroy();
}