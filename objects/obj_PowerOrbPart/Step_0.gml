image_blend = global.fullRGB;

with (instance_create_depth(x, y, depth + 10, obj_PowerOrbTrail)) {
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}

x += xspd;
y += yspd;

if global.SimplifyVFX {
	sprite_index = spr_PowerOrbSimple;
} else {
	sprite_index = spr_PowerOrb;
}



if kysTimer > 0 {
	kysTimer -= 1;
}

if kysTimer <= 0 {
	if image_xscale > 0 {
		image_xscale -= 0.01;
	}
	
	if image_yscale > 0 {
		image_yscale -= 0.01;
	}
	
	if image_xscale <= 0 {
		instance_destroy();
	}
}