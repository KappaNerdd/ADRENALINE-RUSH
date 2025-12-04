if gamepad_is_connected(global.Player1Con) {
	instance_activate_all();
	instance_destroy();
	
	if audio_is_paused(obj_MusicManager.targetSongAsset) {
		audio_resume_sound(obj_MusicManager.targetSongAsset);
	}
}


if global.PlayerChar == 0 {
	sprite_index = spr_SonicRushBGHead;
} else {
	sprite_index = spr_SonicRushBG;
}

if global.SimplifyVFX {
	image_speed = 0;
} else {
	image_speed = 1;
}


if keyboard_check_pressed(vk_anykey) {
	instance_activate_all();
	instance_destroy();
	global.ControllerOnly = false;
	
	if audio_is_paused(obj_MusicManager.targetSongAsset) {
		audio_resume_sound(obj_MusicManager.targetSongAsset);
	}
	
	save_options();
}