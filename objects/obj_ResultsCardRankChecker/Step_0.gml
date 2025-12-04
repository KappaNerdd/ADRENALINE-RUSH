if !instance_exists(obj_ResultsCard) {
	instance_destroy();
}

sprite_index = rankCheckerGraphic;

x += xspd;

if xspd > 0 {
	xspd -= 0.05;
}