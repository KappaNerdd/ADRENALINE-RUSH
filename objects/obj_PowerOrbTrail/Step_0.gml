image_blend = global.fullRGB;

if global.SimplifyVFX {
	sprite_index = spr_PowerOrbSimple;
} else {
	sprite_index = spr_PowerOrb;
}

if image_alpha > 0 {
	image_alpha -= 0.01;
}
	
if image_alpha <= 0 {
	instance_destroy();
}

if image_xscale > 0.05 {
	image_xscale -= 0.005;
}

if image_yscale > 0.05 {
	image_yscale -= 0.005;
}