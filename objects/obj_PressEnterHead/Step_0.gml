getCharacterControls();

x += xspd;
y += yspd;

if yspd < 0 {
	yspd += dcc;
}

if yspd >= 0 && enterTimer < 89 {
	yspd = 0;
}

if enterTimer == 90 {
	yspd -= 0.25;
}

if gamepad_is_connected(0) && global.ConType == 0 {
	sprite_index = spr_PressStartXboxHead;
} else if gamepad_is_connected(0) && global.ConType == 1 {
	sprite_index = spr_PressStartPS4Head;
} else if gamepad_is_connected(0) && global.ConType == 2 {
	sprite_index = spr_PressStartSwitchHead;
} else {
	sprite_index = spr_PressEnterHead;
}


if (jump_Key or pause_Key) && enterTimer == 0 && enter == false {
	enter = true;
	obj_SFXManager.menuConfirm = true;
}


if !global.SimplifyVFX {
	if enter {
		if invisTimer > 0 {
			invisTimer -= 1;
		}
		
		if invisTimer <= 0 {
			invisTimer = 5;
			
			if visible {
				visible = false;
			} else {
				visible = true;
			}
		}
	}
}


if enter == true && enterTimer < 90 {
	enterTimer += 1;
}