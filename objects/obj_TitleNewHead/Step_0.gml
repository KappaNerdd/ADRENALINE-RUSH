getCharacterControls();

if instance_exists(obj_TitleCursor) {
	if place_meeting(x, y, obj_TitleCursor) {
		if global.Language == 1 {
			sprite_index = spr_NewTitleHeadSelect;
		} else if global.Language == 2 {
			sprite_index = spr_NewTitleHeadSelectLatam;
		}
	} else {
		if global.Language == 1 {
			sprite_index = spr_NewTitleHead;
		} else if global.Language == 2 {
			sprite_index = spr_NewTitleHeadLatam;
		}
	}
}


if file_exists("TBAHSSaveData" + string(global.saveFile) + ".sav") {
	if instance_exists(obj_TitleCursor) {
		if obj_TitleCursor.canMove == true {
			if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && newGame == false && !instance_exists(obj_RoomTransParent) {
				instance_create_depth(x, y, depth, obj_FileBoxChecker);
			
				obj_SFXManager.menuConfirm = true;
			}
		}
	}
	
	if instance_exists(obj_FileBoxChecker) {
		newGame = true;
	} else {
		newGame = false
	}


	if newGame == true {
		if instance_exists(obj_TitleCursor) {
			obj_TitleCursor.canMove = false;
		}
	} else {
		if instance_exists(obj_TitleCursor) {
			obj_TitleCursor.canMove = true;
		}
	}
} else {
	if place_meeting(x, y, obj_TitleCursor) && (jump_Key) && newGame == false && !instance_exists(obj_RoomTransParent) {
		newGame = true;
		obj_SFXManager.menuConfirm = true;
		global.Freeplay = false;
	}
	
	if newGame == true && newGameTimer > 0 && !instance_exists(obj_FileBoxChecker) {
		newGameTimer -= 1;
		obj_TitleCursor.canMove = false;
	}

	if newGameTimer == 0 {
		if !instance_exists(obj_RoomTransitionBasic) {
			var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
			instantiated.target_rm = target_rm;
		}
		
		newGame = false;
		newGameTimer = 60;
		obj_TitleCursor.canMove = true;
	}
}