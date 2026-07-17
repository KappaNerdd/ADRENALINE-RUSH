if !global.SimplifyVFX {
	if greyTimer > 0 {
		greyTimer -= 1;
	}
	
	if greyTimer <= 0 {
		greyTimer = greyFrames;
		
		if image_alpha == 1 {
			image_alpha = 0.5;
		} else if image_alpha == 0.5 {
			image_alpha = 1;
		}
	}
} else {
	image_alpha = 1;
}


if kysTimer > 0 {
	kysTimer -= 1;
}

if kysTimer <= 0 {
	instance_destroy();
}

visible = !global.DisableHUD;

if instance_exists(obj_RoomTransParent) {
	moveY = lerp(moveY, -200, 0.1);
} else {
	moveY = lerp(moveY, 0, 0.1);
}