function scr_FreeFallCreate() {
	#region
		can_Move = false;
		can_MoveFULL = true;
		vel = 0;
		yspd = 0;
		
		visXScale = -1;
		leftFacer = false;
		face_Left = true;
		
		moveSpd = 3;
		dashSpd = 6;
		dashDir = 0;
		
		fallDash = false;
		fallDashTimer = 0;
		fallDashFrames = 15;
		
		hurt = false;
		hurtTimer = 0;
		hurtFrames = 180;
		flashTimer = 10;
		
		hitStop = false;
		hitStopTimer = 0;
		
		mask_index = idle_Mask;
	#endregion
}

function scr_FreeFallControl() {
	//Hitstop
	if hitStop {
		if hitStopTimer > 0 {
			can_MoveFULL = false;
			hitStopTimer--;
			image_speed = 0;
		} else {
			hitStop = false;
			can_MoveFULL = true;
		}
	}
	
	if can_MoveFULL {
		//Get Controls
		if can_Move {
			getCharacterControls();
		}
	
		//Movement
		if !fallDash {
			if hurt && hurtTimer > 150 {
				vel = 0;
				yspd = 0;
			} else {
				vel = (right_Key - left_Key) * moveSpd;
				yspd = (down_Key - up_Key) * moveSpd;
			}
		} else {
			var _moveDawgX = 0;
			var _moveDawgY = 0;
		
			if fallDashTimer > 0 {
				fallDashTimer--;
			} else {
				fallDash = false;
			}
		
			switch(dir) {
				case 0:
					_moveDawgX = dashSpd;
				break;
			
				case 1:
					_moveDawgX = dashSpd;
					_moveDawgY = dashSpd;
				break;
			
				case 2:
					_moveDawgY = dashSpd;
				break;
			
				case 3:
					_moveDawgX = -dashSpd;
					_moveDawgY = dashSpd;
				break;
			
				case 4:
					_moveDawgX = -dashSpd;
				break;
			
				case 5:
					_moveDawgX = -dashSpd;
					_moveDawgY = -dashSpd;
				break;
			
				case 6:
					_moveDawgX = -dashSpd;
				break;
			
				case 7:
					_moveDawgX = dashSpd;
					_moveDawgY = -dashSpd;
				break;
			}
		
			vel = _moveDawgX;
			yspd = _moveDawgY;
		}
	
		//Falling Air-Dash
		if (jump_Key or action1_Key) && !fallDash && !hurt {
			fallDash = true;
			fallDashTimer = fallDashFrames;
			obj_SFXManager.jumpDash = true;
			scr_ControllerRumble()
		
			//Get Direction
		
			//Right
			if right_Key && (!up_Key && !down_Key) {
				dir = 0;
			}
		
			//Down-Right
			if right_Key && down_Key {
				dir = 1;
			}
		
			//Down
			if down_Key && (!left_Key && !right_Key) {
				dir = 2;
			}
		
			//Down-Left
			if left_Key && down_Key {
				dir = 3;
			}
		
			//Left
			if left_Key && (!up_Key && !down_Key) {
				dir = 4;
			}
		
			//Up-Left
			if left_Key && up_Key {
				dir = 5;
			}
		
			//Up
			if up_Key && (!left_Key && !right_Key) {
				dir = 6;
			}
		
			//Up-Right
			if right_Key && up_Key {
				dir = 7;
			}
		}
	
		//Collision
		if place_meeting(x + vel, y, obj_Solid) {
			vel = 0;
		}

		if place_meeting(x, y + yspd, obj_Solid) {
			yspd = 0;
		}
	
		//Actually Move
		x += vel;
		y += yspd;
	
		//Getting Hurt
		if hurt {
			if hurtTimer > 0 {
				hurtTimer--;
				
				if global.SimplifyVFX {
					image_alpha = 0.5;
				}
			
				if flashTimer > 0 {
					flashTimer--;
				} else {
					if !global.SimplifyVFX {
						visible = !visible;
					}
					
					flashTimer = 10;
				}
			} else {
				flashTimer = 10;
				hurtTimer = hurtFrames;
				hurt = false;
				visible = true;
				image_alpha = 1;
			}
		} else {
			flashTimer = 10;
			hurtTimer = hurtFrames;
		}
	}
	
	//Take Damage
}
	
function scr_FreeFallAnimation() {
	if !hurt {
		if !leftFacer {
			sprite_index = sprSpiral;
		} else {
			if face_Left {
				sprite_index = sprSpiralLeft;
			} else {
				sprite_index = sprSpiralRight;
			}
		}
	} else {
		if !fallDash {
			
		}
	}
}

function scr_FreeFallDraw() {
	
}

function scr_FreeFallHurt(_damage = 100000, _ringsFly = true) {
	var _ringMult = 1;
	
	hitStopTimer = 10;
	hitStop = true;
	
	if instance_exists(obj_StageTrackerSpeed) {
		if global.Rings > 0 {
			_ringMult = 2;
		}
	}
		
	global.Health -= _damage / _ringMult;
		
	scr_ScreenShake();
	scr_ControllerRumble();
		
	if _ringsFly {
		scr_LoseTrinkets();
	}
		
	scr_BonusPoints(-10000 * (_damage / 100000));
}