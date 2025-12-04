getCharacterControls();

x += xspd;
y += yspd;

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer == 70 {
		xspd = -9.5;
	}
}

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer > 70 {
		xspd += 0.2;
	}
}

if xspd > 0 {
	xspd = 0;
}

if instance_exists(obj_TitleCursor) {
	if place_meeting(x, y, obj_TitleCursor) {
		if global.Language == 1 {
			sprite_index = spr_StartTitleHeadSelect;
		} else if global.Language == 2 {
			sprite_index = spr_StartTitleHeadSelectLatam;
		}
	} else {
		if global.Language == 1 {
			sprite_index = spr_StartTitleHead;
		} else if global.Language == 2 {
			sprite_index = spr_StartTitleHeadLatam;
		}
	}
	
	
	if place_meeting(x, y, obj_TitleCursor) && !instance_exists(obj_RoomTransitionBasic) && (jump_Key or device_mouse_check_button_pressed(0, mb_left)) && start == false {
		start = true;
		obj_TitleCursor.canMove = false;
		obj_SFXManager.menuConfirm = true;
	}
}

if start == true {
	if startTimer > 0 {
		startTimer -= 1;
	}
	
	if startTimer <= 0 {
		if !instance_exists(obj_RoomTransitionBasic) {
			var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionBasic);
			instantiated.target_rm = target_rm;
		}
		
		start = false;
		startTimer = 60;
		obj_TitleCursor.canMove = true;
	}
}