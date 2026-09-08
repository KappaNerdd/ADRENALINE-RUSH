global.ThunderCountdown = random_range(60 * 5, 60 * 20);
global.ThunderOpacity = 0;

changeY = 0;
extraY = 1;

extraCol = #FFFFFF;
mergedCol = make_colour_rgb(255, 255, 255);

blockCol1 = 255;
blockCol2 = 255;
blockCol3 = 255;

targetCol1 = 255;
targetCol2 = 255;
targetCol3 = 255;

changedCol = c_white;

changeWhite = true;

moveBGX = 0;
moveBGY = 0;

if room != rm_HeadSpeedBossP2 && room != rm_NameMakerNew {
	instance_create_depth(x, y, depth, obj_HeadParallaxFront);
	
	for(var i = 0; i < 16; i++) {
		var _random = random_range(0.05, 10);
	
		with(instance_create_depth(x, y, -100, obj_HeadDRFountainFog)) {
			col = c_black;
			randomAngle = _random;
			savedX = 50 * i;
		}
	
		with(instance_create_depth(x, y, -99, obj_HeadDRFountainFog)) {
			col = c_white;
			randomAngle = _random;
			savedX = 50 * i;
			size += 3;
			createPart = false;
		}
	}
}