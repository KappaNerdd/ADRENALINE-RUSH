getCharacterControls();

if (jump_Key or pause_Key) && !instance_exists(obj_RoomTransitionSEGAMenu) {
	room_goto(rm_ProtoEnd);
	
	/*if !instance_exists(obj_RoomTransitionSEGAMenu) {
		with(instance_create_depth(x, y, depth, obj_RoomTransitionSEGAMenu)) {
			target_rm = rm_Saiyan;
			division = 2;
		}
	}*/
}