getCharacterControls();

confirm_Key = jump_Key;


if place_meeting(x, y, obj_TitleCursor) && (confirm_Key or device_mouse_check_button_pressed(0, mb_left)) && global.NameConfirm == false && string_length(global.PlayerName) < 15 {
	global.PlayerName = global.PlayerName + char;
	obj_SFXManager.menuPop = true;
	
	image_blend = c_yellow;
	
	image_xscale = 0.9;
	image_yscale = 0.9;
}

if place_meeting(x, y, obj_TitleCursor) && (!confirm_Key or !device_mouse_check_button_pressed(0, mb_left)) && !global.NameConfirm && string_length(global.PlayerName) < 15 {
	image_blend = c_white;
	
	if image_xscale < 1.3 {
		image_xscale += 0.05;
	}
	
	if image_yscale < 1.3 {
		image_yscale += 0.05;
	}
} else {
	image_blend = c_grey;
	
	if image_xscale > 1.25 {
		image_xscale -= 0.05;
	}
	
	if image_yscale > 1.25 {
		image_yscale -= 0.05;
	}
}

if !place_meeting(x, y, obj_TitleCursor) {
	if image_xscale < 1.25 {
		image_xscale += 0.05;
	}
	
	if image_yscale < 1.25 {
		image_yscale += 0.05;
	}
}

if string_length(global.PlayerName) >= 15 {
	image_xscale = 1.25;
	image_yscale = 1.25;
}

if global.NameConfirm == true {
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}
} else {
	if image_alpha < 1 {
		image_alpha += 0.05;
	}
}