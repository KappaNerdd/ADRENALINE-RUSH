getCharacterControls();

x += xspd;
y += yspd;

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer == 88 {
		xspd = -9.5;
	}
}

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer > 89 {
		xspd += 0.2;
	}
}

if xspd > 0 {
	xspd = 0;
}

if quit == true {
	obj_TitleCursor.canMove = false;
}

if instance_exists(obj_TitleCursor) {
	if place_meeting(x, y, obj_TitleCursor) {
		if global.Language == 1 {
			sprite_index = spr_QuitTitleHeadSelect;
		} else if global.Language == 2 {
			sprite_index = spr_QuitTitleHeadSelectLatam;
		}
	} else {
		if global.Language == 1 {
			sprite_index = spr_QuitTitleHead;
		} else if global.Language == 2 {
			sprite_index = spr_QuitTitleHeadLatam;
		}
	}
}

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && quit == false && !instance_exists(obj_RoomTransParent) {
	quit = true;
	obj_SFXManager.menuConfirm = true;
}

if quit == true && quitTimer > 0 {
		quitTimer -= 1;
	}

	if quitTimer == 20 {
		if !instance_exists(obj_RoomTransitionBasic) {
			instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
		}
	}

if quitTimer == 0 {
	//Close game
	game_end();
}