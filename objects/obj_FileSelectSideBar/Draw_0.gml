var _r = 0;
var _g = 0;
var _b = 0;

if changeTimer > 0 {
	changeTimer -= 1;
}

if changeTimer <= 0 {
	if kappaChar {
		kappaChar = false;
		luciferChar = true;
	} else if luciferChar {
		luciferChar = false;
		kappaChar = true;
	}
	
	changeTimer = changeFrames;
}

if kappaChar {
	_r = 10;
	_g = 36;
	_b = 203;
	
} else if luciferChar {
	_r = 207;
	_g = 41;
	_b = 229;
}

if localR < _r {
	localR += 2;
} else if localR > _r {
	localR -= 2;
}

if localG < _g {
	localG += 2;
} else if localG > _g {
	localG -= 2;
}

if localB < _b {
	localB += 2;
} else if localB > _b {
	localB -= 2;
}

var _fullCol = make_color_rgb(localR, localG, localB);

if !file_exists(string(global.PastMindDataFile) + ".sav") {
	_fullCol = c_white;
	
	sprite_index = spr_SideBarHead;
} else {
	_fullCol = make_color_rgb(localR, localG, localB);
}


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, _fullCol, image_alpha);
