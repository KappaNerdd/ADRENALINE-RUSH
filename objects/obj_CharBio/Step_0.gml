getCharacterControls();

var _checkArray = array_length(chars) - 1;

if !leave {
	if (left_Key or right_Key) && !moveRight && !moveLeft {
		moveTimer--;
	} else {
		moveTimer = 1;
	}
	
	if moveTimer <= 0 {
		moveTimer = moveFrames;
		obj_SFXManager.homingLockOn = true;
		
		if right_Key {
			if charCheck < _checkArray {
				charCheck++;
			} else {
				charCheck = 0;
			}
			
			moveRight = true;
		}
		
		if left_Key {
			if charCheck > 0 {
				charCheck--;
			} else {
				charCheck = _checkArray;
			}
			
			moveLeft = true;
		}
	}
	
	if action_Key {
		obj_SFXManager.UNDERTALEBombFly = true;
		
		if !checkBio {
			leave = true;
			set_song_ingame(noone, 30, 30);
		} else {
			checkBio = false;
		}
	}
	
	if action1_Key {
		if !checkBio {
			obj_SFXManager.funkinFav = true;
			checkBio = true;
		}
	}
} else {
	scr_MainMenuTrans("bio");
}

if moveRight {
	charX += 0.5;
	
	if charAlpha > 0 {
		charAlpha -= 0.05;
	} else {
		charX = -20;
		moveRight = false;
		shownChar = charCheck;
	}
} else if moveLeft {
	charX -= 0.5;
	
	if charAlpha > 0 {
		charAlpha -= 0.05;
	} else {
		charX = 20;
		moveLeft = false;
		shownChar = charCheck;
	}
} else {
	charX = lerp(charX, 0, 0.075);
	
	if charAlpha < 1 {
		charAlpha += 0.05;
	}
}

if checkBio {
	if bioBoxScale < 8 {
		bioBoxScale += 0.5;
	} else {
		if bioAlpha < 1 {
			bioAlpha += 0.05;
		}
	}
} else {
	if bioAlpha > 0 {
		bioAlpha -= 0.05;
	} else {
		if bioBoxScale > 0 {
			bioBoxScale -= 0.5;
		}
	}
}

r = lerp(r, global.PlayerSelection[charCheck + 1][5][0], 0.05);
g = lerp(g, global.PlayerSelection[charCheck + 1][5][1], 0.05);
b = lerp(b, global.PlayerSelection[charCheck + 1][5][2], 0.05);

if !global.SimplifyVFX {
	srSpikesIndex++;
	
	if srSpikesIndex >= 20 {
		srSpikesIndex = 0;
	}
}