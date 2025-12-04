if !instance_exists(obj_ResultsCardNew) {
	instance_destroy();
}

if opacity > 0 {
	opacity -= 0.075;
}

if opacity <= 0 {
	instance_destroy();
}