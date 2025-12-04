if !instance_exists(obj_RoomTransitionBasic) {
	var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
	instantiated.target_rm = target_rm;
}