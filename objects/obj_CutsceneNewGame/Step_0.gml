getCharacterControls();

confirm_Key = jump_Key;

//Kappa's animations
if confirmedWait > 0 {
	obj_Player.can_Move = false;
	
	with(obj_KappaHeadOverworld) {
		image_speed = 0;
		sprite_index = spr_KappaDamageDownHead;
		mask_index = crouch_Mask;
	}
}

if confirmedWait <= 0 && getupConfirmed == false && lookUp == false {
	with(obj_KappaHeadOverworld) {
		image_speed = 0.05;
		sprite_index = spr_KappaDamageDownHead;
		mask_index = crouch_Mask;
	}
} else if confirmedWait <= 0 && getupConfirmed == true && lookUp == false {
	with(obj_KappaHeadOverworld) {
		image_speed = 1;
		sprite_index = sprIdle;
		mask_index = idle_Mask;
	}
} else if confirmedWait <= 0 && getupConfirmed == true && lookUp == true {
	with(obj_KappaHeadOverworld) {
		image_speed = 1;
		sprite_index = sprLook_up;
		mask_index = idle_Mask;
	}
}




///-----Camera Move Down-----///

if beforeCameraTimer > 0 {
	beforeCameraTimer -= 1;
}

if beforeCameraTimer <= 0 {
	beforeCameraConfirmed = true;
}


if beforeCameraConfirmed == true {
	if cameraTimer > 0 {
		cameraTimer -= 1;
	
		with(obj_CameraParent) {
			finalCamY += 1.8;
		}
		
	}
	
	if cameraTimer <= 0 {
		cameraConfirmed = true;
	}
}


///-----Kappa (Head) Lay-----///

if cameraConfirmed == true {
	
	if confirm_Key && confirmed == false {
		waitTimer = 0;
		confirmed = true;
	}
	
	
	if waitTimer > 0 {
		waitTimer -= 1;
	}

	if waitTimer <= 0 && confirmed == false {
		if image_alpha < 1 {
			image_alpha += 0.01;
		}
	} else if waitTimer <= 0 && confirmed == true {
		if image_alpha > 0 {
			image_alpha -= 0.1;
		}
	}
}


//Get up
if confirmed == true {
	if confirmedWait > 0 {
		confirmedWait -= 1;
	}
	
	if confirmedWait <= 0 {
		if getupTimer > 0 {
			getupTimer -= 1;
		}
	}
	
	if getupTimer <= 0 {
		getupConfirmed = true;
	}
}


//Look Up
if getupConfirmed == true {
	if lookUpTimer > 0 {
		lookUpTimer -= 1;
	}
	
	if lookUpTimer <= 0 && afterLookUptimer > 0 {
		lookUp = true;
	}
}

if lookUp == true {
	if afterLookUptimer > 0 {
		afterLookUptimer -= 1;
	}
}

if afterLookUptimer <= 0 {
	lookUp = false;
	
	if endCutsceneTimer > 0 {
		endCutsceneTimer -= 1;
	}
	
	if endCutsceneTimer <= 0 {
		endCutscene = true;
	}
}


if endCutscene == true && textCutsceneTimer > 0 {
	if !instance_exists(obj_Textbox) {
		create_textbox(text_idText);
	}
	

	textCutsceneTimer -= 1;
}

if textCutsceneTimer <= 0 {
	textCutsceneConfirm = true;
}

if textCutsceneConfirm == true && !instance_exists(obj_Textbox) {
	if textCutsceneAfterTimer > 0 {
		textCutsceneAfterTimer -= 1;
	}
}


//End Cutscene
if textCutsceneAfterTimer <= 0 && !instance_exists(obj_Textbox) {
	if !instance_exists(obj_MusicTag) {
		instance_create_depth(x, y, depth, obj_MusicTag);
		
		scr_CreateChapterName(text_id);
	}
	
	obj_Player.can_Move = true;
	
	set_song_ingame(mus_DISCONNECTED, 0, 60);
	
	instance_destroy();
}