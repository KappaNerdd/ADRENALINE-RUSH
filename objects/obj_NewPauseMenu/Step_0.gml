getCharacterControls();


if pause_Key {
	active = false;
	inactive = true;
	
	instance_destroy(obj_BorderH);
	instance_destroy(obj_BorderV);
	instance_destroy(obj_PauseCursor);
	
	save_options();
	scr_SaveControls();
}

if global.PlayerChar != 0 {
	image_blend = global.fullRGB;
}


if active {
	if image_alpha < 1 {
		image_alpha += 0.025;
	}
	
} else if inactive {
	if image_alpha > 0 {
		image_alpha -= 0.025;
	}
}

if inactive && image_alpha <= 0 {
	instance_activate_all();
	instance_destroy(obj_PauseMenuBoxParent);
	instance_destroy();
	
	save_options();
	scr_SaveControls();
	
	audio_stop_sound(pause);
	audio_resume_sound(obj_MusicManager.targetSongAsset);
}



if !global.SimplifyVFX {
	image_speed = 1;
} else {
	image_speed = 0;
}



if global.Particles && active {
	randomize();
	var _rainRandom = round(random(4));

	if _rainRandom == 1 or _rainRandom == 2 or _rainRandom == 3 {
		instance_create_depth(random(camera_get_view_x(view_camera[0]) + 768), camera_get_view_y(view_camera[0]) + 500, depth, obj_PauseParticles);
	}
}

if audio_is_playing(snd_RushRingLoop) {
	audio_stop_sound(snd_RushRingLoop);
}

if audio_is_playing(snd_IvyGunCharge) {
	audio_stop_sound(snd_IvyGunCharge);
}

if !inactive && !instance_exists(obj_RoomTransParent) {
	if global.UniquePauseTheme {
		audio_pause_sound(obj_MusicManager.targetSongAsset);
		
		pause = global.PlayerSelection[global.PlayerChar][21];
		
	
		if !audio_is_playing(pause) {
			audio_play_sound(pause, 4, true);
		}
	
		if audio_is_paused(pause) {
			audio_resume_sound(pause);
		}
		
		audio_sound_gain(pause, global.MUSIC_VOL * global.MASTER_VOL, 1);
	} else {
		if audio_is_paused(obj_MusicManager.targetSongAsset) {
			audio_resume_sound(obj_MusicManager.targetSongAsset);
		}
	
		if !audio_is_paused(pause) {
			audio_pause_sound(pause);
		}
	}
}