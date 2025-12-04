getCharacterControls();

backspace_Key = action_Key;

if global.NameConfirm == false {
	if backspace_Key {
		global.PlayerName = string_delete(global.PlayerName, string_length(global.PlayerName), 1);
	}
}

if global.NameConfirm == true {
	y += yspd;
	
	if yspd > 0 {
		yspd -= 0.025;
	}
	
	
	if image_xscale < 2 {
		image_xscale += 0.005;
	}
	
	if image_yscale < 2 {
		image_yscale += 0.005;
	}
} else {
	y += yspd;
	
	if yspd < 0 {
		yspd += 0.025;
	}
	
	
	if image_xscale > 1 {
		image_xscale -= 0.025;
	}
	
	if image_yscale > 1 {
		image_yscale -= 0.025;
	}
}


if y < 40 {
	y = 40;
}