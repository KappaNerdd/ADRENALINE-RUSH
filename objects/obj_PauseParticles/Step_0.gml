x += ((horiFloatAmplitude) * sin(horiFloatingOffset / 12)) + xspd;
horiFloatingOffset += horiFloatSpeed;

y += (floatAmplitude * sin(floatingOffset / 2)) + yspd;
floatingOffset += floatSpeed;

image_angle += ((rotationSpeed) * sin(rotationOffset / 4));
rotationOffset += rotationSpeed;


image_xscale = changeScale;
image_yscale = changeScale;



if yspd > -3 {
	yspd -= 0.025;
}


if timer > 0 {
	timer -= 1;
}

if instance_exists(obj_NewPauseMenu) {
	if obj_NewPauseMenu.active {
		if timer <= 0 {
			if image_alpha > 0 {
				image_alpha -= 0.01;
			}
		}
	} else {
		image_alpha -= 0.05;
	}
}

if image_alpha <= 0 {
	instance_destroy();
}

if room != rm_Freeplay {
	if !instance_exists(obj_NewPauseChar) {
		instance_destroy();
	}
} else {
	if timer <= 0 {
		if image_alpha > 0 {
			image_alpha -= 0.01;
		}
	}
}

if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}