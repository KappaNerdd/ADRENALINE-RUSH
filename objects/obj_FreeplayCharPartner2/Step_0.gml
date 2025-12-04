getCharacterControls();

scr_GetCharFreeplayPortLocal();

_charCheck = global.Partner2Char;

sprite_index = _charSprite;

x += ((horiFloatAmplitude) * sin(horiFloatingOffset / 4)) + xspd;
horiFloatingOffset += horiFloatSpeed;

y += (floatAmplitude * sin(floatingOffset)) + yspd;
floatingOffset += floatSpeed;

image_angle += ((rotationSpeed) * sin(rotationOffset / 3));
rotationOffset += rotationSpeed;



if xspd > 0 {
	xspd -= 0.1;
}

if xspd <= 0 {
	xspd = 0;
}


if !global.SimplifyVFX && visible == true {
	if createThingTimer > 0 {
		createThingTimer -= 1;
	}
	
	if createThingTimer <= 0 {
		createThingTimer = createThingFrames;
		instance_create_depth(x, y, depth, obj_FreeplayGlowP3);
	}
}


if place_meeting(x, y, obj_TitleCursor) && jump_Key && visible == true && !obj_FreeplaySpeedStages.speedStageActive && !obj_FreeplayActionStages.actionStageActive {
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

if image_xscale > 0.2 {
	image_xscale -= 0.01;
}

if image_yscale > 0.2 {
	image_yscale -= 0.01;
}