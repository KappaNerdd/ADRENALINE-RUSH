getCharacterControls();

if instance_exists(obj_TitleCursor) {
	if place_meeting(x, y, obj_TitleCursor) {
		if global.Language == 1 {
			sprite_index = spr_FreeplayTitleHeadSelect;
		} else if global.Language == 2 {
			sprite_index = spr_FreeplayTitleHeadSelectLatam;
		}
	} else {
		if global.Language == 1 {
			sprite_index = spr_FreeplayTitleHead;
		} else if global.Language == 2 {
			sprite_index = spr_FreeplayTitleHeadLatam;
		}
	}
}




if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && !instance_exists(obj_RoomTransParent) && !freeplayConfirmed {
	obj_SFXManager.menuConfirm = true;
	freeplayConfirmed = true;
	set_song_ingame(noone, 90, 0);
	global.Freeplay = true;
}

if freeplayConfirmed == true && freeplayTimer > 0 {
	freeplayTimer -= 1;
	obj_TitleCursor.canMove = false;
}

if freeplayTimer == 0 {
	if !instance_exists(obj_RoomTransitionSEGAMenu) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionSEGAMenu);
		instantiated.target_rm = rm_Freeplay;
	}
		
	freeplayConfirmed = false;
	freeplayTimer = 60;
	obj_TitleCursor.canMove = true;
}