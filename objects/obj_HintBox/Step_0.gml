getCharacterControls();

var _bruh = 0; //Dawg, it's 5 AM rn and I'm tired as shit. I cannot name a variable properly.

if hintDesc != noone {
	_bruh = 1;
}

if !done {
	changeYScale = lerp(changeYScale, 6, 0.1);
	
	if hintDesc != noone {
		if right_Key or left_Key {
			moveTimer--;
		} else {
			moveTimer = 1;
		}
	
		if moveTimer <= 0 {
			moveTimer = moveFrames;
			obj_SFXManager.menuPop = true;
			
			if right_Key {
				if hintNum < _bruh {
					hintNum++;
				} else {
					hintNum = 0;
				}
			}
		
			if left_Key {
				if hintNum > 0 {
					hintNum--;
				} else {
					hintNum = _bruh;
				}
			}
		}
	}
	
	if jump_Key or action_Key or action1_Key or action2_Key {
		obj_SFXManager.homingLockOn = true;
		done = true;
	}
} else {
	changeYScale = lerp(changeYScale, 0, 0.2);
	
	if changeYScale <= 0.05 {
		obj_Player.can_Move = true;
		obj_Player.can_MoveFULL = true;
		global.DisableHUD = false;
		instance_destroy();
	}
}