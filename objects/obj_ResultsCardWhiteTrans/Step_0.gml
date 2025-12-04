if !instance_exists(obj_ResultsCard) {
	instance_destroy();
}

if global.ResultsTimer == 2 {
	opacity = 1;
}

if opacity > 0 {
	opacity -= 0.05;
}