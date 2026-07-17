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
			
			obj_Player.x = global.RespawnX;
			obj_Player.y = global.RespawnY;
			obj_Player.playerHurt = false;
			obj_Player.can_Move = true;
			scr_SetCamFollow(global.PlayerID);
			
			audio_stop_sound(snd_DeltaruneFall);
			
			if room == rm_HeadSpeedBoss {
				obj_HeadBeam.x = obj_HeadBeam.savedX;
				obj_HeadBeam.y = obj_HeadBeam.savedY;
			}
		}
	}
} else {
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
		if image_alpha > 0 {
			image_alpha -= 0.20 / division;
		}
	}
	
	if image_alpha <= 0 {		
		instance_destroy();
	}
}