if global.DEBUG {
	visible = true;
} else {
	visible = false;
}

if launchConfirmed {
	if launchTimer > 0 {
		launchTimer -= 1;
	} else {
		launchConfirmed = false;
		launchTimer = launchFrames;
	}
}