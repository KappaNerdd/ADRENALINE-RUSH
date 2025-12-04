if fixCameraTimer > 0 {
	fixCameraTimer -= 1;
	
	with (obj_CameraParent) {
		finalCamX = (obj_Player.x - camera_get_view_width(view_camera[0]) / 2);
		finalCamY = (obj_Player.y - camera_get_view_height(view_camera[0]) / 2);
	}
}

if heySaiyanTimer > 0 && !instance_exists(obj_Textbox) {
	heySaiyanTimer -= 1;
}

if heySaiyanTimer <= 0 {
	if !saiyanMeow {
		saiyanMeow = true;
		obj_SFXManager.catMeow = true;
	}
}


if saiyanMeow {
	if saiyanMeowTimer > 0 {
		saiyanMeowTimer -= 1;
	}
	
	if saiyanMeowTimer <= 0 {
		if instance_exists(obj_SaiyanHeadCut) {
			if obj_SaiyanHeadCut.image_alpha > 0 {
				obj_SaiyanHeadCut.image_alpha -= 0.01;
			}
		
		
			if obj_SaiyanHeadCut.image_alpha <= 0 {
				instance_destroy(obj_SaiyanHeadCut);
			}
		}
	}
}

if !instance_exists(obj_SaiyanHeadCut) {
	byeSaiyan = true;
}

if byeSaiyan {
	if byeSaiyanTimer > 0 {
		byeSaiyanTimer -= 1;
	}
	
	if byeSaiyanTimer <= 0 {
		if !afterByeSaiyan {
			afterByeSaiyan = true;
			create_textbox(text_id2);
		}
	}
}

if afterByeSaiyan {
	if !instance_exists(obj_Textbox) && afterByeSaiyanTimer > 0 {
		afterByeSaiyanTimer -= 1;
	}
	
	if afterByeSaiyanTimer <= 0 {
		set_song_ingame(mus_DISCONNECTED, 0, 180);
	
		obj_Player.can_Move = true;
	
		global.statData[1].head_Overworld7_Check1 = true;
		instance_destroy();
	}
}