if !global.SimplifyVFX {
	if room == rm_HeadSpeedBossP2 {
		extraY = 20;
	}
		
	changeY -= extraY;
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

blockCol1 = scr_Approach(blockCol1, targetCol1, 3);
blockCol2 = scr_Approach(blockCol2, targetCol2, 3);
blockCol3 = scr_Approach(blockCol3, targetCol3, 3);

mergedCol = make_colour_rgb(blockCol1, blockCol2, blockCol3);