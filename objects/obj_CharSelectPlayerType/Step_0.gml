if room == rm_CharSelect {
	//Bounce on-beat
	if global.RealBPM <= 0.02 {
		image_xscale = 0.75;
		image_yscale = 0.75;
	
	
		if image_angle == -1 {
			image_angle = 1;
		} else if image_angle == 1 {
			image_angle = -1;
		}
	}


	if image_xscale > 0.5 {
		image_xscale -= 0.025;
	}

	if image_yscale > 0.5 {
		image_yscale -= 0.025;
	}
}


/*if !obj_CharSelectWhiteBall.playerConfirmed {
	image_index = 0;
} else {
	if gamepad_is_connected(global.Player2Con) {
		image_index = 1;
	} else {
		image_index = 2;
	}
}*/

image_blend = global.fullRGB;