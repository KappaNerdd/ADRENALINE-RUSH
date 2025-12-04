getCharacterControls();

sprite_index = obj_TitleBoxParent.sprite_index;


if place_meeting(x, y, obj_TitleCursor) && global.TitleOpt == "OPTIONS" {
	image_blend = c_blue;
	
	if !hovered {
		obj_SFXManager.homingLockOn = true;
		hovered = true;
	}
	
	if jump_Key && obj_TitleCursor.canMove {
		obj_SFXManager.menuPop = true;
		global.TitleOpt = "MAIN MENU";
		save_options();
		scr_SaveControls();
	}
} else {
	image_blend = c_white;
	hovered = false;
}


if global.TitleOpt != "OPTIONS" {
	if y < mainY + 100 {
		y += 10;
	}
	
	if y >= mainY + 100 {
		y = mainY + 100;
	}
} else {
	if y > mainY {
		y -= 10;
	}
	
	if y <= mainY {
		y = mainY;
	}
}