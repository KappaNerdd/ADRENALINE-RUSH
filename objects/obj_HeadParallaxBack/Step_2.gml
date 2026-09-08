var _approach = 3;

if !global.SimplifyVFX {
	changeY -= extraY;
	moveBGX -= extraY / 2;
	moveBGY += extraY / 4;
}

if room == rm_HeadSpeedBoss or room == rm_HeadSpeedBossP2 {
	if !global.SimplifyVFX {
		if changeWhite {
			targetCol1 = 255;
			targetCol2 = 255;
			targetCol3 = 255;
			
			if blockCol2 >= 255 {
				changeWhite = false;
			}
		} else {
			targetCol1 = 255;
			targetCol2 = 0;
			targetCol3 = 0;
			
			if blockCol2 <= 0 {
				changeWhite = true;
			}
		}
	} else {
		targetCol1 = 255;
		targetCol2 = 255;
		targetCol3 = 255;
	}
} else {
	var _char = global.PlayerSelection[global.PlayerChar][5];
	_approach = 1;
	
	if !global.SimplifyVFX {
		if changeWhite {
			targetCol1 = 255;
			targetCol2 = 255;
			targetCol3 = 255;
			
			if mergedCol == c_white {
				changeWhite = false;
			}
		} else {
			targetCol1 = _char[0];
			targetCol2 = _char[1];
			targetCol3 = _char[2];
			
			if mergedCol == make_colour_rgb(_char[0], _char[1], _char[2]) {
				changeWhite = true;
			}
		}
	} else {
		targetCol1 = 255;
		targetCol2 = 255;
		targetCol3 = 255;
	}
}

switch(changedCol) {
	case c_red:
		targetCol1 = 255;
		targetCol2 = 0;
		targetCol3 = 0;
	break
	
	case c_yellow:
		targetCol1 = 255;
		targetCol2 = 255;
		targetCol3 = 0;
	break;
}

blockCol1 = scr_Approach(blockCol1, targetCol1, _approach);
blockCol2 = scr_Approach(blockCol2, targetCol2, _approach);
blockCol3 = scr_Approach(blockCol3, targetCol3, _approach);

mergedCol = make_colour_rgb(blockCol1, blockCol2, blockCol3);

if global.ThunderOpacity > 0 {
	global.ThunderOpacity -= 0.008;
}