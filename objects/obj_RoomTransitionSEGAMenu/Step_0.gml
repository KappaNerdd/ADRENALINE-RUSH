if !transComplete {
	if colorRed < 255 {
	    colorRed += 20 / division;
	}

	if colorGreen < 255 && colorRed > 255 / 2.5 {
	    colorGreen += 20 / division;
	}

	if colorBlue < 255 && colorGreen > 255 / 2.5 {
		colorBlue += 20 / division;
	}

	//End the transition:
	if colorBlue == 255 {
	    if image_alpha < 1 {
	       image_alpha += 0.20 / division;
	    } else {
		    transComplete = true;
			room_goto(target_rm);
		}
	}
} else {
	if waitType {
		waitType = false;
		
		if room == rm_MainMenuNew {
			if type == "freeplay" {
				with(obj_MainMenu) {
					menuChoice = 1;
					moveGameplay = true;
				}
			}
			
			if type == "bio" {
				with(obj_MainMenu) {
					menuChoice = 3;
					moveExtra = true;
				}
			}
			
			if type == "gallery" {
				with(obj_MainMenu) {
					menuChoice = 2;
					moveExtra = true;
				}
			}
		}
	}
	
	if colorRed > 0 && colorGreen <= 0 {
	    colorRed -= 20 / division;
	}

	if colorGreen > 0 && colorBlue <= 0 {
	    colorGreen -= 20 / division;
	}

	if colorBlue > 0 {
		colorBlue -= 20 / division;
	}
	
	if colorRed == 0 {
		if checkChar {
			if image_alpha >= 0.95 {
				with(obj_Player) {
					x = other.target_x + (100 * other.target_xscale);
					y = other.target_y;
					vel = other.target_vel;
					yspd = other.target_yspd;
					
					if leftFacer {
						if other.target_xscale == 1 {
							face_Left = false;
						} else {
							face_Left = true;
						}
					} else {
						visXScale = other.target_xscale;
					}
				}
			}
		}
		
		if image_alpha > 0 {
			image_alpha -= 0.20 / division;
		}
	}
	
	if image_alpha <= 0 {
		instance_destroy();
	}
}