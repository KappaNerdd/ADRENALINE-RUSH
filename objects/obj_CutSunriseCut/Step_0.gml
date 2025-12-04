if afterSarahProtoTimer > 0 {
	afterSarahProtoTimer -= 1;
}

if afterSarahProtoTimer <= 0 {
	if afterSarahProtoText > 0 {
		afterSarahProtoText -= 1;
		
		if !instance_exists(obj_Textbox) {
			create_textbox(text_id1);
			set_song_ingame(mus_WakeyWakey, 60, 60);
			instance_create_depth(x, y, depth, obj_MusicTag);
		}
	}
}

if afterSarahProtoText <= 0 {
	if !instance_exists(obj_Textbox) {
		if preSukiJumpTimer > 0 {
			preSukiJumpTimer -= 1;
		}
		
		if preSukiJumpTimer < 5 && preSukiJumpTimer > 0 && !instance_exists(obj_CutSunriseKappa) {
			instance_create_layer(obj_CutSunriseSukiVan.x - 10, obj_CutSunriseSukiVan.y + 20, "Objects", obj_CutSunriseKappa);
			instance_create_layer(obj_CutSunriseSukiVan.x - 10, obj_CutSunriseSukiVan.y + 20, "Objects", obj_CutSunriseSarah);
			instance_create_layer(obj_CutSunriseSukiVan.x - 10, obj_CutSunriseSukiVan.y + 20, "Objects", obj_CutSunriseLone);
		}
	}
}


if preSukiJumpTimer <= 0 {
	if afterSukiJumpTimer > 0 {
		afterSukiJumpTimer -= 1;
	}
}

if afterSukiJumpTimer <= 0 {
	if sukiJumpText > 0 {
		sukiJumpText -= 1;
		
		if !instance_exists(obj_Textbox) {
			create_textbox(text_id2);
		}
	}
}


if sukiJumpText <= 0 && !instance_exists(obj_Textbox) {
	if afterSukiCut2Timer > 0 {
		afterSukiCut2Timer -= 1;
		
		if afterSukiCut2Timer < 120 {
			if !instance_exists(obj_CutSunriseSophi) {
				instance_create_layer(obj_CutSunriseSukiVan.x + 30, obj_CutSunriseSukiVan.y + 20, "Objects", obj_CutSunriseSophi);
			}
		}
	}
	
	if afterSukiCut2Timer <= 0 {
		afterSukiCut2 = true;
	}
}

if afterSukiCut2 {
	if afterSophiTimer > 0 {
		afterSophiTimer -= 1;
		
		if !instance_exists(obj_Textbox) {
			create_textbox(text_id3);
		}
	}
	
	if afterSophiTimer <= 0 && !instance_exists(obj_Textbox) {
		if !instance_exists(obj_CutSunriseFlash) {
			instance_create_depth(x, y, depth, obj_CutSunriseFlash);
		}
	}
}
