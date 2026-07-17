getCharacterControls();

if jump_Key or pause_Key {
	if !instance_exists(obj_RoomTransParent) {
		audio_stop_sound(snd_SAGE26Jingle);
	}
	
	scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_MainMenuNew);
}

if leaveTimer > 0 {
	leaveTimer--;
	changeScale = lerp(changeScale, 0.5, 0.075);
	
	if leaveTimer <= 240 {
		changeAlpha = lerp(changeAlpha, 0, 0.015);
		changeSpd = lerp(changeSpd, 0, 0.035);
	}
} else {
	audio_stop_sound(snd_SAGE26Jingle);
	scr_RoomTrans(obj_RoomTransitionSEGAMenu, rm_MainMenuNew);
}

moveX += changeSpd;
moveY -= changeSpd / 3;

if leaveTimer <= 120 {
	shineX += 40;
}