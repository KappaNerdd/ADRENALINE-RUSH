var _playerThing = 0;

if room == rm_CharSelect {
	//Bounce on-beat
	if global.RealBPM <= 0.02 {
		image_xscale = 1.25;
		image_yscale = 1.25;
	
	
		if image_angle == -1 {
			image_angle = 1;
		} else if image_angle == 1 {
			image_angle = -1;
		}
	}


	if image_xscale > 1 {
		image_xscale -= 0.025;
	}

	if image_yscale > 1 {
		image_yscale -= 0.025;
	}
	
	
	if global.PlayerSelection[global.SelectedPlayer][2] {
		visible = false;
	} else {
		visible = true;
	}
}

if room == rm_Freeplay {
	image_angle += ((rotationSpeed) * sin(rotationOffset / 3));
	rotationOffset += rotationSpeed;
}

sprite_index = global.PlayerSelection[global.PlayerChar][12][0];