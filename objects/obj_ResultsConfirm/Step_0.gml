getCharacterControls();

confirm_Key = (jump_Key);

if confirm_Key && waiting == false {
	obj_SFXManager.menuConfirm = true;
	waiting = true;
	instance_destroy(obj_ResultsTryAgain);
	
	set_song_ingame(noone, 120, 0);
	set_ambience_ingame(noone, 120, 120);
	alarm_set(0, 120);
}

if waiting == true {
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}
}