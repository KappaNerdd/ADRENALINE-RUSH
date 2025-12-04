getCharacterControls();

if creditsOpacity == true {
	if image_alpha < 1 {
		image_alpha += 0.01;
	}
}


if image_alpha >= 1 {
	if moveTimer > 0 {
		moveTimer -= 1;
	}
}


if moveTimer <= 0 {
	if y > -1865 {
		if jump_Key_Held {
			y -= 7;
		} else {
			y -= 0.75;
		}
	}
	
	if y <= -1865 {
		y = -1865;
		
		set_song_ingame(noone, 600, 0);
		
		if resetTimer > 0 {
			resetTimer -= 1;
		}
		
		if resetTimer <= 0 {
			room_goto(rm_Saiyan);
		}
	}
}