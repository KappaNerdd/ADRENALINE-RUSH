image_alpha -= 0.1;

if (image_alpha <= 0) {
	instance_destroy();
}



if lookingTimer > 0 {
	lookingTimer -= 1;
}

if !global.SimplifyVFX {
	if lookingTimer <= 0 {
		if visible {
			visible = false;
		} else {
			visible = true;
		}
	
		lookingTimer = lookingFrames;
	}
}