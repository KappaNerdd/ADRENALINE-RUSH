if text1Timer > 0 {
	text1Timer -= 1;
}

if text1Timer <= 0 {
	text1Con = true;
}


if text1Con == true {
	if textCreTimer > 0 {
		if !instance_exists(obj_Textbox) {
			create_textbox(text_id1);
		}
		
		textCreTimer -= 1;
	}
	
	if textCreTimer <= 0 && !instance_exists(obj_Textbox) {
		textCreCon = true;
	}
}



if textCreCon == true {
	if text2Timer > 0 {
		text2Timer -= 1;
	}

	if text2Timer <= 0 {
		text2Con = true;
	}


	if text2Con == true {
		if textCreTimer2 > 0 {
			if !instance_exists(obj_Textbox) {
				create_textbox(text_id2);
			}
		
			textCreTimer2 -= 1;
		}
	
		if textCreTimer2 <= 0 && !instance_exists(obj_Textbox) {
			textCreCon2 = true;
		}
	}
}


if textCreCon2 == true {
	if text3Timer > 0 {
		text3Timer -= 1;
	}

	if text3Timer <= 0 {
		text3Con = true;
	}


	if text3Con == true {
		if textCreTimer3 > 0 {
			if !instance_exists(obj_Textbox) {
				create_textbox(text_id3);
			}
		
			textCreTimer3 -= 1;
		}
	
		if textCreTimer3 <= 0 && !instance_exists(obj_Textbox) {
			textCreCon3 = true;
		}
	}
}

if textCreCon3 == true {
	if !instance_exists(obj_RoomTransitionSEGAMenu) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionSEGAMenu);
		instantiated.target_rm = rm_HometownSunriseCut;
		instantiated.division = 5;
	}
}