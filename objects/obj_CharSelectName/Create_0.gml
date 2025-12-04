depth = -25;
image_speed = 1;

if room == rm_CharSelect {
	image_angle = 1;
} else if room == rm_Freeplay {
	image_angle = -2;
	image_xscale = 0.75;
	image_yscale = 0.75;
}

rotationAmplitude = 0.05;
rotationSpeed = 0.025;
rotationOffset = 0;

sprite_index = global.PlayerSelection[global.PlayerChar][12][0];