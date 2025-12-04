getCharacterControls();


if !global.deleteFile {
	if place_meeting(x, y, obj_TitleCursor) {
		if (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && !global.copyFile {
			obj_SFXManager.menuPop = true;
			global.deleteFile = true;
		}
		
		image_blend = c_white;
	} else {
		image_blend = c_grey;
	}
} else {
	if action_Key {
		if global.deleteFile && !global.deletingFile {
			global.deleteFile = false;
		} else if global.deleteFile && global.deletingFile {
			global.deletingFile = false;
		}
		
		obj_SFXManager.funkinFav = true;
	}
	
	image_blend = make_color_rgb(obj_FileSelectSideBar.localR, obj_FileSelectSideBar.localG, obj_FileSelectSideBar.localB);
}


if global.deleteFile && !global.deletingFile {
	copyText = "CHOOSE FILE TO DELETE";
} else if global.deleteFile && global.deletingFile {
	copyText = "ARE YOU SURE?";
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