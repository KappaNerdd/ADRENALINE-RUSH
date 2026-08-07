getCharacterControls();

if can_MoveFULL {
	if can_Move {
		vel = (right_Key - left_Key) * (moveSpd + (1 * action_Key_Held));
	
		if right_Key {
			if !leftFacer {
				visXScale = 1;
			} else {
				face_Left = false;
			}
		} 
		
		if left_Key {
			if !leftFacer {
				visXScale = -1;
			} else {
				face_Left = true;
			}
		}
	
		if action_Key_Held {
			animSpeed = 2;
		} else {
			animSpeed = 1;
		}
	}
	
	if vel != 0 {
		if !moving {
			moving = true;
			image_index = 0;
		}
		
		image_speed = 0;
		
		if !leftFacer {
			sprite_index = sprWalk;
		} else {
			if face_Left {
				sprite_index = sprWalkLeft;
			} else {
				sprite_index = sprWalkRight;
			}
		}
		
		if animTimer > 0 {
			animTimer -= animSpeed;
		} else {
			animTimer = animFrames;
			
			if image_index == 0 {
				image_index = 2;
			} else if image_index == 2 {
				image_index = 4;
			} else if image_index == 4 {
				image_index = 6;
			} else if image_index == 6 {
				image_index = 0;
			}
		}
	} else {
		image_speed = 1;
		moving = false;
		
		if !leftFacer {
			sprite_index = sprIdle;
		} else {
			if face_Left {
				sprite_index = sprIdleLeft;
			} else {
				sprite_index = sprIdleRight;
			}
		}
	}
	
	var _subPixel = 0.5;
		
	if place_meeting(x + vel, y, obj_Solid) {
		var _pixelCheck = _subPixel * sign(vel);
	
		while !place_meeting(x + _pixelCheck, y, obj_Solid) {
			x += _pixelCheck;
		}
	
		vel = 0;
	}

	x += vel;
}

if vel != 0 {
	if floor(image_index) == 2 {
		if !footStep1 {
			footStep1 = true;
			footStep2 = false;
			
			if x < 750 {
				obj_SFXManager.footStepHard = true;
			} else {
				obj_SFXManager.footStepGrass = true;
			}
		}
	} else if floor(image_index) == 6 {
		if !footStep2 {
			footStep2 = true;
			footStep1 = false;
			
			if x < 750 {
				obj_SFXManager.footStepHard = true;
			} else {
				obj_SFXManager.footStepGrass = true;
			}
		}
	}
} else {
	footStep1 = false;
	footStep2 = false;
}