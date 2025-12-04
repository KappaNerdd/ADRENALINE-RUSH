scr_ChangeControlSprites();
getCharacterControls();
scr_SetControl();

sprite_index = obj_TitleBoxParent.sprite_index;

if place_meeting(x, y, obj_TitleCursor) && global.TitleOpt == "OPTIONS" && global.TitleSettings == 4 {
	image_blend = c_blue;
	
	if !hovered {
		obj_SFXManager.homingLockOn = true;
		hovered = true;
	}

	if jump_Key && !changeBind {
		changeBind = true;
		obj_SFXManager.homingLockOn = true;
	}
} else {
	image_blend = c_white;
	hovered = false;
}


if changeBind {
	if !global.SimplifyVFX {
		if flashingTimer > 0 {
			flashingTimer -= 1;
		}
		
		if flashingTimer <= 0 {
			if image_blend == c_blue {
				image_blend = c_white;
			} else {
				image_blend = c_blue;
			}
		}
	}
	
	if waitTimer <= 1 {
		if !gamepad_is_connected(global.Player1Con) {
			global.Action2KeySpeed = remappedBind;
		} else {
			global.Action2ButtonSpeed = remappedBind;
		}
	}
}


if global.TitleOpt == "OPTIONS" && global.TitleSettings == 4 {
	if x > mainX {
		x -= 10;
	}
	
	if x <= mainX {
		x = mainX;
	}
} else {
	if x < mainX + 400 {
		x += 10;
	}
	
	if x >= mainX + 400 {
		x = mainX + 400;
	}
}