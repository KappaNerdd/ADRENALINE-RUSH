getCharacterControls();

x += xspd;
y += yspd;

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer == 80 {
		xspd = -9.5;
	}
}

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer > 80 {
		xspd += 0.2;
	}
}

if xspd > 0 {
	xspd = 0;
}

if options == true {
	obj_TitleCursor.canMove = false;
}

if instance_exists(obj_TitleCursor) {
	if place_meeting(x, y, obj_TitleCursor) {
		if global.Language == 1 {
			sprite_index = spr_OptionsTitleHeadSelect;
		} else if global.Language == 2 {
			sprite_index = spr_OptionsTitleHeadSelectLatam;
		}
	} else {
		if global.Language == 1 {
			sprite_index = spr_OptionsTitleHead;
		} else if global.Language == 2 {
			sprite_index = spr_OptionsTitleHeadLatam;
		}
	}
}

if place_meeting(x, y, obj_TitleCursor) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && options == false && !instance_exists(obj_RoomTransParent) {
	options = true;
	obj_SFXManager.menuConfirm = true;
}

if options == true && optionsTimer > 0 {
	optionsTimer -= 1;
}

if optionsTimer == 0 {
	//Go to options
	if !instance_exists(obj_RoomTransitionBasic) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
		instantiated.target_rm = target_rm;
	}
	options = false;
	optionsTimer = 60;
	obj_TitleCursor.canMove = true;
}