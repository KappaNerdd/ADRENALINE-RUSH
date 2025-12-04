getCharacterControls();


if !alphaConfirm {
	if image_alpha < 1 {
		image_alpha += 0.005;
	}
	
	if image_alpha >= 1 {
		if textAlpha1 < 1 {
			textAlpha1 += 0.005;
		}
	}
	
	if textAlpha1 >= 1 {
		if textAlpha2 < 1 {
			textAlpha2 += 0.005;
		}
	}
	
	if textAlpha2 >= 1 {
		if jump_Key or pause_Key {
			alphaConfirm = true;
		}
	}
} else {
	image_alpha -= 0.0025;
	textAlpha1 -= 0.0025;
	textAlpha2 -= 0.0025;
	
	if image_alpha <= 0 {
		if !file_exists(string(global.NoMindDataFile) + string(global.saveFile) + ".sav") {
			room_goto(rm_NewChar)
		} else {
			game_restart();
		}
	}
}
