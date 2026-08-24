function scr_DRCharCreate() {
	#region	//Depth, Main Player
		depth = -bbox_bottom;
	#endregion

	#region //Movement
		vel = 0;
		yspd = 0
		moveSpd = 1;
		runSpd = 2;
		can_Move = true;
		can_MoveFULL = true;
		charDir = DIR.DOWN;
	#endregion
	
	#region //Running
		runTimer = 150;
		runFrames = 150;
	#endregion
}

function scr_DRCharStep() {
	#region //Depth
		depth = -bbox_bottom;
	#endregion

	#region //Movement, Interaction, & Menu
		if mainPlayer {
			if can_Move {
				getCharacterControls();
			}
		} else {
			//Following
			x = global.DRPlayerID.pos_x[record];
			y = global.DRPlayerID.pos_y[record];
			
			charDir = global.DRPlayerID.toRecordSprite[record];

			if global.DRPlayerID.vel == 0 && global.DRPlayerID.yspd == 0 {
				image_speed = 0;
				image_index = 0;
			} else {
				image_speed = global.DRPlayerID.image_speed;
			}
		}

		if mainPlayer {			
			//Running
			if action_Key_Held && (vel != 0 or yspd != 0) {
				if runTimer > 0 {
					runTimer--;
				
					if runTimer > 90 {
						runSpd = 1.5;
					} else {
						runSpd = 2;
					}
				} else {
					runSpd = 2.5;
				}
			} else {
				runSpd = 1;
				
				if runTimer < runFrames {
					runTimer = runFrames;
					charFace = walkSpr[charDir];
					sprite_index = walkSpr[charDir];
				}
			}

			if vel == 0 && yspd == 0 {
				image_speed = 0;
				image_index = 0;
			} else {
				if action_Key_Held {
					if runTimer < runFrames - 2 {
						image_speed = 2;
					} else {
						image_speed = 1;
					}
				} else {
					image_speed = 1;
				}
			}
		
			vel = (right_Key - left_Key) * moveSpd * (runSpd);
				
			if down_Key {
				yspd = moveSpd * runSpd;
			}
				
			if up_Key {
				if !place_meeting(x, y - (moveSpd * runSpd), obj_Solid) {
					yspd = -(moveSpd * runSpd);
				} else {
					charFace = baseSpr[DIR.UP];
					runTimer = runFrames;
				}
			}
				
			if !up_Key && !down_Key {
				yspd = 0;
			}
			
			if can_Move {
				if jump_Key {
					var _intSpr = spr_DRInteractH;
					var _xScale = 1;
					var _yScale = 1;
					
					if charDir == DIR.LEFT {
						_xScale = -1;
					} else if charDir == DIR.UP {
						_intSpr = spr_DRInteractV;
					} else if charDir == DIR.DOWN {
						_intSpr = spr_DRInteractV;
						_yScale = -1;
					}
					
					with(instance_create_depth(x, y, depth, obj_DRInteract)) {
						sprite_index = _intSpr;
						image_xscale = _xScale;
						image_yscale = _yScale;
						followChar = other.id;
					}
				}
			}
		}
	#endregion

	#region //Animation Handling
		if mainPlayer {
			if runSpd >= 2 {
				baseSpr[DIR.UP] = runSpr[DIR.UP];
				baseSpr[DIR.DOWN] = runSpr[DIR.DOWN];
				baseSpr[DIR.LEFT] = runSpr[DIR.LEFT];
				baseSpr[DIR.RIGHT] = runSpr[DIR.RIGHT];
			} else {
				baseSpr[DIR.UP] = walkSpr[DIR.UP];
				baseSpr[DIR.DOWN] = walkSpr[DIR.DOWN];
				baseSpr[DIR.LEFT] = walkSpr[DIR.LEFT];
				baseSpr[DIR.RIGHT] = walkSpr[DIR.RIGHT];
			}
			
			if vel != 0 && yspd != 0 {
				if charDir == DIR.RIGHT && vel > 0 {
					charFace = baseSpr[DIR.RIGHT];
					charDir = DIR.RIGHT;
				} else if charDir == DIR.LEFT && vel < 0 {
					charFace = baseSpr[DIR.LEFT];
					charDir = DIR.LEFT;
				} else if charDir == DIR.DOWN && yspd > 0 {
					charFace = baseSpr[DIR.DOWN];
					charDir = DIR.DOWN;
				} else if charDir == DIR.UP && yspd < 0 {
					charFace = baseSpr[DIR.UP];
					charDir = DIR.UP;
				} else {
					if vel != 0 {
						charDir = vel > 0 ? DIR.RIGHT : DIR.LEFT;
						charFace = baseSpr[charDir];
					} else {
						charDir = yspd > 0 ? DIR.DOWN : DIR.UP;
						charFace = baseSpr[charDir];
					}
				}
			} else if vel != 0 {
				charDir = vel > 0 ? DIR.RIGHT : DIR.LEFT;
				charFace = baseSpr[charDir];
			} else if yspd != 0 {
				charDir = yspd > 0 ? DIR.DOWN : DIR.UP;
				charFace = baseSpr[charDir];
			}
		
			if !can_Move {
				if yspd <= 0 && charFace == baseSpr[DIR.DOWN] {
					charFace = baseSpr[DIR.DOWN];
					charDir = DIR.DOWN;
				} else if yspd > 0 {
					charFace = baseSpr[DIR.DOWN];
					charDir = DIR.DOWN;
				}
	
				if yspd >= 0 && charFace == baseSpr[DIR.UP] {
					charFace = baseSpr[DIR.UP];
					charDir = DIR.UP;
				} else if yspd < 0 {
					charFace = baseSpr[DIR.UP];
					charDir = DIR.UP;
				}
	
				if vel <= 0 && charFace == baseSpr[DIR.RIGHT] {
					charFace = baseSpr[DIR.RIGHT];
					charDir = DIR.RIGHT;
				} else if vel > 0 {
					charFace = baseSpr[DIR.RIGHT];
					charDir = DIR.RIGHT;
				}
	
				if vel >= 0 && charFace == baseSpr[DIR.LEFT] {
					charFace = baseSpr[DIR.LEFT];
					charDir = DIR.LEFT;
				} else if vel < 0 {
					charFace = baseSpr[DIR.LEFT];
					charDir = DIR.LEFT;
				}
			}
	
			sprite_index = charFace;
		} else {
			if global.DRPlayerID != noone {
				if global.DRPlayerID.runSpd >= 2 {
					baseSpr[DIR.UP] = runSpr[DIR.UP];
					baseSpr[DIR.DOWN] = runSpr[DIR.DOWN];
					baseSpr[DIR.LEFT] = runSpr[DIR.LEFT];
					baseSpr[DIR.RIGHT] = runSpr[DIR.RIGHT];
				} else {
					baseSpr[DIR.UP] = walkSpr[DIR.UP];
					baseSpr[DIR.DOWN] = walkSpr[DIR.DOWN];
					baseSpr[DIR.LEFT] = walkSpr[DIR.LEFT];
					baseSpr[DIR.RIGHT] = walkSpr[DIR.RIGHT];
				}
				
				charFace = baseSpr[charDir];
				sprite_index = charFace;
			}
		}
	#endregion

	#region //Collision and X & Y Manipulation
		if mainPlayer {
			if place_meeting(x + vel, y, obj_Solid) {
				vel = 0;
				runTimer = runFrames;
			}
	
			if place_meeting(x, y + yspd, obj_Solid) {
				yspd = 0;
				runTimer = runFrames;
			}

			x += vel;
			y += yspd;
	
			if !can_MoveFULL {
				vel = 0;
				yspd = 0;
			}
	
			if yspd == 0 && charFace == baseSpr[DIR.UP] {
				charFace = baseSpr[DIR.UP];
				charDir = DIR.UP;
			} else if yspd == 0 && charFace == baseSpr[DIR.DOWN] {
				charFace = baseSpr[DIR.DOWN];
				charDir = DIR.DOWN;
			}

			if vel == 0 && charFace == baseSpr[DIR.LEFT] {
				charFace = baseSpr[DIR.LEFT];
				charDir = DIR.LEFT;
			} else if vel == 0 && charFace == baseSpr[DIR.RIGHT] {
				charFace = baseSpr[DIR.RIGHT];
				charDir = DIR.RIGHT;
			}
		}
	#endregion
	
	#region //Update Path Recording
		if global.DRPlayerID == id {
			if x != xprevious or y != yprevious {
				for(var i = followSize - 1; i > 0; i--) {
					pos_x[i] = pos_x[i - 1];
					pos_y[i] = pos_y[i - 1];
					toRecordSprite[i] = toRecordSprite[i - 1];
				}
	
				pos_x[0] = x;
				pos_y[0] = y;
				toRecordSprite[0] = charDir;
			}
		}
	#endregion
}

function scr_DRCharDraw() {
	draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}