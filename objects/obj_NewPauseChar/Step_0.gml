getCharacterControls();

x += ((horiFloatAmplitude) * sin(horiFloatingOffset / 12)) + xspd;
horiFloatingOffset += horiFloatSpeed;

y += (floatAmplitude * sin(floatingOffset / 2)) + yspd;
floatingOffset += floatSpeed;

image_angle += ((rotationSpeed) * sin(rotationOffset / 4));
rotationOffset += rotationSpeed;

if instance_exists(obj_NewPauseMenu) {
	if obj_NewPauseMenu.active {
		if yspd > 0 {
			yspd -= 0.1;
		}
	} else {
		yspd -= 2;
	}
} else {
	instance_destroy();
}

if image_xscale > 0.25 {
	image_xscale -= 0.01;
}

if image_yscale > 0.25 {
	image_yscale -= 0.01;
}


if place_meeting(x, y, obj_PauseCursor) && jump_Key {
	image_xscale += 0.02;
	image_yscale += 0.02;
	
	if global.Particles {
		instance_create_depth(x, y, depth, obj_PauseParticles);
		instance_create_depth(x, y, depth, obj_PauseParticles);
		instance_create_depth(x, y, depth, obj_PauseParticles);
		instance_create_depth(x, y, depth, obj_PauseParticles);
		instance_create_depth(x, y, depth, obj_PauseParticles);
		instance_create_depth(x, y, depth, obj_PauseParticles);
	}
	
	obj_SFXManager.funkinFav = true;
}
