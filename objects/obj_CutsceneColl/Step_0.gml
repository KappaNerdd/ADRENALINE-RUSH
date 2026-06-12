if place_meeting(x, y, obj_Player) {
	if createdCut != noone {
		instance_create_depth(0, 0, depth, createdCut);
	}
	
	if kys {
		instance_destroy();
	}
}

visible = global.DEBUG;