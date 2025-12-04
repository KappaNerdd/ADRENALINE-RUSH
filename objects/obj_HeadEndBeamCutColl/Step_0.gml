if global.DEBUG {
	visible = true;
} else {
	visible = false;
}

if place_meeting(x, y, obj_Player) && instance_exists(obj_HeadBeamHead10) {
	obj_Player.vel = 0;
	obj_Player.can_Move = false;
	obj_HeadBeamHead10.stop = true;
	global.SpeedSelected = 2;
	global.LevelForced = true;
	
	if obj_Player.ground {
		instance_create_depth(x, y, depth, obj_CutsceneHeadEnd2);
		
		instance_destroy();
	}
}