getCharacterControls();

image_xscale = lerp(image_xscale, 0.5, 0.1);
image_yscale = lerp(image_yscale, 0.5, 0.1);

if jump_Key or pause_Key {
	scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_FileSelectNew);
}