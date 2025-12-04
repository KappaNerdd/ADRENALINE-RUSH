getCharacterControls();

sprite_index = obj_TitleBoxParent.sprite_index;


if place_meeting(x, y, obj_TitleCursor) && global.TitleOpt == "OPTIONS" && global.TitleSettings == 2 {
	image_blend = c_blue;
	
	if !hovered {
		obj_SFXManager.homingLockOn = true;
		hovered = true;
	}
	
	if jump_Key && obj_TitleCursor.canMove {
		obj_SFXManager.menuPop = true;
		
		global.FPSOn++;
		
		if global.FPSOn > 1 {
			global.FPSOn = 0;
		}
	}
} else {
	image_blend = c_white;
	hovered = false;
}



if global.TitleOpt == "OPTIONS" && global.TitleSettings == 2 {
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