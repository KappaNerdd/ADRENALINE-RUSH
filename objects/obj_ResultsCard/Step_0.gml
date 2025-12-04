//Slowly fade in BG Box
if image_alpha < 1 {
	image_alpha += 0.05;
}


if global.ResultsTimer > 0 {
	global.ResultsTimer -= 1;
}