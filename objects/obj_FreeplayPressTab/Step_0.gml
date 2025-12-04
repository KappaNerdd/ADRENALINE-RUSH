getCharacterControls();

if !obj_FreeplaySpeedStages.speedStageActive && !obj_FreeplayActionStages.actionStageActive {
	if textHigh {
		if textAlpha < 0.75 {
			textAlpha += 0.002;
		}
	
		if textAlpha >= 0.75 {
			textHigh = false;
		}
	} else {
		if textAlpha > 0 {
			textAlpha -= 0.002;
		}
	
		if textAlpha <= 0 {
			textHigh = true;
		}
	}
} else {
	textAlpha = 0;
}


if (select_Key) && !changeChar && !obj_FreeplaySpeedStages.speedStageActive && !obj_FreeplayActionStages.actionStageActive {
	changeChar = true;
	obj_SFXManager.funkinCheckpoint = true;
	obj_FreeplayChar.yspd = -4;
	
	if instance_exists(obj_FreeplayCharPartner) {
		obj_FreeplayCharPartner.yspd = -4;
	}
		
	if instance_exists(obj_FreeplayCharPartner2) {	
		obj_FreeplayCharPartner2.yspd = -4;
	}	
		
	set_song_ingame(noone, 150, 0);
	instance_destroy(obj_TitleCursor);
}

if changeChar {
	obj_FreeplayChar.yspd += 0.2;
	
	if instance_exists(obj_FreeplayCharPartner) {
		obj_FreeplayCharPartner.yspd += 0.2;
	}
		
	if instance_exists(obj_FreeplayCharPartner2) {	
		obj_FreeplayCharPartner2.yspd += 0.2;
	}	
	
	if changeCharTimer > 0 {
		changeCharTimer -= 1;
	}
}

if changeCharTimer <= 0 {
	if !instance_exists(obj_RoomTransitionSEGAMenu) {
		var instantiated = instance_create_depth(0, 0, -99999999, obj_RoomTransitionSEGAMenu);
		instantiated.target_rm = rm_CharSelectNew;
	}
}