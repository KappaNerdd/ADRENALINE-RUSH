if image_alpha > 0 {
	image_alpha -= 0.0025;
}

if image_alpha <= 0 {
	if screenshotTimer > 0 {
		screenshotTimer -= 1;
	}
	
	if screenshotTimer <= 0 {
		if screenText > 0 {
			screenText -= 1;
			
			if !instance_exists(obj_Textbox) {
				create_textbox(text_id);
			}
		}
		
		if screenText <= 0 && !instance_exists(obj_Textbox) {
			
			if !instance_exists(obj_RoomTransitionSEGAMenu) {
				with(instance_create_depth(x, y, depth, obj_RoomTransitionSEGAMenu)) {
					target_rm = rm_Demo3;
					division = 4;
				}
			}
			
			instance_destroy();
		}
	}
}