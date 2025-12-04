getCharacterControls();

if left_Key_Once && noVar {
	noVar = false;
	yesVar = true;
	
	obj_SFXManager.menuTap = true;
} else if right_Key_Once && yesVar {
	noVar = true;
	yesVar = false;
	
	obj_SFXManager.menuTap = true;
}


if jump_Key {
	obj_SFXManager.funkinCheckpoint = true;
	obj_CharSelectWhiteBall.playerConfirmed = true;
	obj_CharSelectWhiteBall.partnerConfirmed = true;
	obj_CharSelectWhiteBall.partner2Confirmed = true;
	set_song_ingame(noone, 120, 0);
	
	if noVar {
		global.Girly = false;
	} else if yesVar {
		global.Girly = true;
	}
	
	confirmed = true;
}

if confirmed {
	if confirmedTimer > 0 {
		confirmedTimer -= 1;
	}
	
	if confirmedTimer <= 0 {
		instance_destroy();
	}
}