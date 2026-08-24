if hudTimer > 0 {
	hudTimer -= 1;
} else {
	instance_destroy();
}

if !global.SimplifyVFX {
	if hudTimer <= 60 {
		if visibleTimer > 0 {
			visibleTimer -= 1;
		} else {
			if !global.DisableHUD {
				visible = !visible;
			}
		}
	}
}

