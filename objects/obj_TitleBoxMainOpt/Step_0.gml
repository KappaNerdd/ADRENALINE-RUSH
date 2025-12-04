getCharacterControls();

sprite_index = obj_TitleBoxParent.sprite_index;


if global.TitleOpt != "OPTIONS" {
	if x < mainX + 400 {
		x += 10;
	}
	
	if x >= mainX + 400 {
		x = mainX + 400;
	}
} else {
	if x > mainX {
		x -= 10;
	}
	
	if x <= mainX {
		x = mainX;
	}
}


if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}