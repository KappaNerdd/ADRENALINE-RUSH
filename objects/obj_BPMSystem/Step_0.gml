/*if global.RealBPM > 0 {
	global.RealBPM -= 1 / 60;
}


if global.RealBPM <= 0 {
	image_index = 0;
	global.RealBPM = global.ConvertedBPM;
}


if image_index >= 12 {
	image_index = 12;
}