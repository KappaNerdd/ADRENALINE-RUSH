depth = -25;
image_speed = 1;

if room == rm_CharSelect {
	image_angle = 1;
} else if room == rm_Freeplay {
	image_angle = 2;
	image_xscale = 0.5;
	image_yscale = 0.5;
}

rotationAmplitude = 0.05;
rotationSpeed = 0.025;
rotationOffset = 0;


var _charCheck = global.PartnerChar;

if _charCheck == 0 {
	sprite_index = spr_CharNameKappaHead;
} else if _charCheck == 2 {
	sprite_index = spr_CharNameSarah;
} else if _charCheck == 10 {
	sprite_index = spr_CharNameRush;
} else if _charCheck == 12 {
	sprite_index = spr_CharNameIvy;
} else {
	visible = false;
}