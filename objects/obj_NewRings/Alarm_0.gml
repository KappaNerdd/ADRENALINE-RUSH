if !global.SimplifyVFX {
	if sprColor == colRed {
		sprColor = colOrange;
	} else if sprColor == colOrange {
		sprColor = colYellow;
	} else if sprColor == colYellow {
		sprColor = colGreen;
	} else if sprColor == colGreen {
		sprColor = colBlue;
	} else if sprColor == colBlue {
		sprColor = colPurple;
	} else if sprColor == colPurple {
		sprColor = colPink;
	} else if sprColor == colPink {
		sprColor = colRed;
	}
}

if colNum < 13 {
	colNum++;
} else {
	colNum = 0;
}