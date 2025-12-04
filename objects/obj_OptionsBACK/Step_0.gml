getCharacterControls();

//Back from options
if place_meeting(x, y, obj_TitleCursor) && room == rm_OptionsHead && !instance_exists(obj_RoomTransParent) && (jump_Key) {
	obj_SFXManager.menuTap = true;
	save_options();
	scr_SaveControls();
	
	if !instance_exists(obj_RoomTransitionBasic) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
		instantiated.target_rm = target_rm1;
	}
}