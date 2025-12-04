if !global.Freeplay {
	if global.MIND {
		global.MIND = false;
	}
	
	if !instance_exists(obj_RoomTransParent) {
		var instantiated = instance_create_depth(0, 0, -100000000000, obj_RoomTransitionBasicStage);
		instantiated.target_x = global.TargetX;
		instantiated.target_y = global.TargetY;
		instantiated.target_rm = global.TargetRM;
	}
} else {
	if !instance_exists(obj_RoomTransParent) {
		var instantiated = instance_create_depth(0, 0, -100000000000, obj_RoomTransitionSEGAMenu);
		instantiated.target_rm = rm_Freeplay;
	}
}