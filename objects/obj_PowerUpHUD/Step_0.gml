if hudTimer > 0 {
	hudTimer -= 1;
}

if !global.SimplifyVFX {
	if hudTimer <= 60 {
		if visibleTimer > 0 {
			visibleTimer -= 1;
		}
	
		if visibleTimer <= 0 {
			if visible {
				visible = false;
			} else {
				visible = true;
			}
		}
	}
}

if hudTimer <= 0 {
	instance_destroy();
}
