getCharacterControls();

confirm_Key = action_Key;


if confirm_Key && waiting == false {
	obj_SFXManager.menuConfirm = true;
	waiting = true;
	instance_destroy(obj_ResultsConfirm);
	
	alarm_set(0, 120);
	set_song_ingame(noone, 60, 0);
	set_ambience_ingame(noone, 60, 0);
	
	if global.Freeplay {
		global.Health = global.MaxHealth;
	}
}

if waiting == true {
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}
}