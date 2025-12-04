if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}


if global.TitleOpt != "OPTIONS" {
	if x > mainX {
		x -= 10;
	}
	
	if x <= mainX {
		x = mainX;
	}
} else {
	if x < mainX + 400 {
		x += 10;
	}
	
	if x >= mainX + 400 {
		x = mainX + 400;
	}
}