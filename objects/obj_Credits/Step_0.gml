getCharacterControls();

var _credArray = array_length(creds) - 1;

if !leave {
	if !extraCheck {
		if right_Key or left_Key {
			moveTimer--;
		} else {
			moveTimer = 1;
		}
		
		if moveTimer <= 0 {
			moveTimer = moveFrames;
			obj_SFXManager.homingLockOn = true;
			
			if right_Key {
				if credCheck < _credArray {
					credCheck++;
				} else {
					credCheck = 0;
				}
			}
			
			if left_Key {
				if credCheck > 0 {
					credCheck--;
				} else {
					credCheck = _credArray;
				}
			}
		}
	} else {
		moveTimer = 1;
	}
	
	if action_Key {
		obj_SFXManager.UNDERTALEBombFly = true;
		
		if !extraCheck {
			leave = true;
			set_song_ingame(noone, 30);
		} else {
			extraCheck = false;
		}
	}
	
	if action1_Key {
		if !extraCheck {
			obj_SFXManager.menuPop = true;
			extraCheck = true;
		} else {
			obj_SFXManager.UNDERTALEBombFly = true;
			extraCheck = false;
		}
	}
} else {
	scr_MainMenuTrans("credits");
}

r = lerp(r, creds[credCheck][5][0], 0.075);
g = lerp(g, creds[credCheck][5][1], 0.075);
b = lerp(b, creds[credCheck][5][2], 0.075);
