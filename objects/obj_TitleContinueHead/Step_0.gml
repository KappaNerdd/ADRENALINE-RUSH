getCharacterControls();

var _dir = working_directory + "/saves/" + string(global.saveFile) + "/";

if !file_exists(_dir + string(global.MainDataFile) + string(global.saveFile) + ".sav") {
	image_alpha = 0.5;
} else {
	image_alpha = 1;
}

if continueGame == true {
	obj_TitleCursor.canMove = false;
}


if instance_exists(obj_TitleCursor) {
	if place_meeting(x, y, obj_TitleCursor) {
		if global.Language == 1 {
			sprite_index = spr_ContinueTitleHeadSelect;
		} else if global.Language == 2 {
			sprite_index = spr_ContinueTitleHeadSelectLatam;
		}
	} else {
		if global.Language == 1 {
			sprite_index = spr_ContinueTitleHead;
		} else if global.Language == 2 {
			sprite_index = spr_ContinueTitleHeadLatam;
		}
	}
}


if file_exists(_dir + string(global.MainDataFile) + string(global.saveFile) + ".sav") {
	if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && continueGame == false && !instance_exists(obj_RoomTransParent) {
		continueGame = true;
		obj_SFXManager.menuConfirm = true;
		global.Freeplay = false;
		
		set_song_ingame(noone, 1 * 60, 0);
	}

	if continueGame == true && continueGameTimer > 0 {
		continueGameTimer -= 1;
	}

	if continueGameTimer == 0 {
		if !instance_exists(obj_RoomTransitionBasicLoad) {
			instance_create_depth(0, 0, -999999, obj_RoomTransitionBasicLoad);
		}
		
		continueGame = false;
		continueGameTimer = 60;
		obj_TitleCursor.canMove = true;
	}

} else if !file_exists(_dir + string(global.MainDataFile) + string(global.saveFile) + ".sav") && place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) {
	obj_SFXManager.menuCancel = true;
}