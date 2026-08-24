if !global.SimplifyVFX {
	if greyTimer > 0 {
		greyTimer -= 1;
	}
	
	if greyTimer <= 0 {
		greyTimer = greyFrames;
		
		if otherAlpha == 1 {
			otherAlpha = 0.5;
		} else if otherAlpha == 0.5 {
			otherAlpha = 1;
		}
	}
} else {
	otherAlpha = 1;
}


if kysTimer > 0 {
	kysTimer -= 1;
} else {
	instance_destroy();
}

visible = !global.DisableHUD;

if instance_exists(obj_RoomTransParent) {
	moveY = lerp(moveY, -200, 0.1);
} else {
	moveY = lerp(moveY, 0, 0.1);
}