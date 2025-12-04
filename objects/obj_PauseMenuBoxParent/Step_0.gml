if !instance_exists(obj_NewPauseMenu) {
	instance_destroy();
}

getCharacterControls();

if action_Key && global.CurOpt == "Main" && obj_PauseMenuResume.x > -250 && obj_NewPauseMenu.active {
	obj_NewPauseMenu.active = false;
	obj_NewPauseMenu.inactive = true;
	obj_SFXManager.menuPop = true;
	save_options();
	
	instance_destroy(obj_BorderH);
	instance_destroy(obj_BorderV);
	instance_destroy(obj_PauseCursor);
}


if select_Key && instance_exists(obj_PauseMenuRestart) {
	obj_SFXManager.menuPop = true;
	
	if !instance_exists(obj_RoomTransParent) {
		with instance_create_depth(-1000000, 0, 0, obj_RoomTransitionSEGARestart) {
			division = 0.5;
		}
	}
	
	save_options();
					
	if !audio_is_paused(obj_NewPauseMenu.pause) {
		audio_stop_sound(obj_NewPauseMenu.pause);
		audio_resume_sound(obj_MusicManager.targetSongAsset);
	}
	
	if !global.Freeplay {
		global.PlayerExtraLives -= 1;
		global.PlayerExtraLives -= global.CollectedLives;
	} else {
		global.Health = global.MaxHealth;
	}
}