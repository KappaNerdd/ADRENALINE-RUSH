getCharacterControls();


if instance_exists(obj_TitleCursor) {
	if global.deletingFile {
		obj_TitleCursor.canMove = false;
	} else {
		obj_TitleCursor.canMove = true;
	}
}


if !global.copyFile {
	if place_meeting(x, y, obj_TitleCursor) {
		if (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && !global.deleteFile {
			obj_SFXManager.menuPop = true;
			global.copyFile = true;
		}
		
		image_blend = c_white;
	} else {
		image_blend = c_grey;
	}
} else {
	if action_Key {
		if global.copyFile && !global.copyingFile {
			global.copyFile = false;
		}
		
		if global.copyFile && global.copyingFile {
			global.copyingFile = false;
		}
		
		
		obj_SFXManager.funkinFav = true;
	}
	
	image_blend = make_color_rgb(obj_FileSelectSideBar.localR, obj_FileSelectSideBar.localG, obj_FileSelectSideBar.localB);
}


if global.copyFile && !global.copyingFile {
	copyText = "CHOOSE FILE TO COPY";
} else if global.copyFile && global.copyingFile {
	copyText = "CHOOSE FILE TO PASTE";
}



if copyTextAlpha > 0 {
	copyTextAlpha -= 0.015;
}

if copyTextAlphaTimer > 0 {
	copyTextAlphaTimer -= 1;
}

if copyTextAlphaTimer <= 0 {
	copyTextAlphaTimer = 60;
	copyTextAlpha = 1;
}