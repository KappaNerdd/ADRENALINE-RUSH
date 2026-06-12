getCharacterControls();

if jump_Key or pause_Key {
	scr_RoomTrans(obj_RoomTransitionSEGAMenu, target_rm);
}

if image_index == 12 or image_index == 18 or image_index == 24 or image_index == 30 or image_index == 36 or image_index == 42 or image_index == 48 or image_index == 54 or image_index == 60 or image_index == 66 {
	obj_SFXManager.funkinFav = true;
}