getCharacterControls();

sprite_index = obj_TitleBoxParent.sprite_index;


if place_meeting(x, y, obj_TitleCursor) && global.TitleOpt == "MAIN MENU" && !obj_SAGE2025Chars.characters {
	image_blend = c_blue;
	
	if !hovered {
		obj_SFXManager.homingLockOn = true;
		hovered = true;
	}
	
	if jump_Key && obj_TitleCursor.canMove {
		obj_SFXManager.menuPop = true;
		obj_TitleCursor.canMove = false;
		newGame = true;
		instance_create_depth(-400, 132, depth, obj_TitleNewGame);
	}
} else {
	image_blend = c_white;
	hovered = false;
}

if newGame {
	if !global.SimplifyVFX {
		if flashingTimer > 0 {
			flashingTimer -= 1;
		}
		
		if flashingTimer <= 0 {
			flashingTimer = 10;
			
			if image_blend == c_white {
				image_blend = c_blue;
			} else {
				image_blend = c_white;
			}
		}
	} else {
		image_blend = c_blue;
	}
}


if global.TitleOpt != "MAIN MENU" {
	if x < mainX + 200 {
		x += 10;
	}
	
	if x >= mainX + 200 {
		x = mainX + 200;
	}
} else {
	if x > mainX {
		x -= 10;
	}
	
	if x <= mainX {
		x = mainX;
	}
}