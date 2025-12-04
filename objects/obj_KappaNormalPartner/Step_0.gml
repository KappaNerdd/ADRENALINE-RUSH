if instance_exists(self) {
	///-----Keys-----///
	getCharacterControls();

	//Spacebar/RB

	if !instance_exists(obj_Spacebar) {
		instance_create_depth(x, y, obj_Player.depth - 100, obj_Spacebar);
	}


	//Ceiling Detection
	if !instance_exists(obj_PlayerHurtJump) {
		instance_create_depth(x, y, obj_Player.depth + 1, obj_PlayerHurtJump);
	}


	if instance_exists(obj_PlayerHurtJump) {
		if global.DEBUG == true {
			obj_PlayerHurtJump.visible = true;
		} else {
			obj_PlayerHurtJump.visible = false;
		}
	}


	if can_MoveFULL == true {
	
	
		///-----Controller Rumble-----///

		if global.ConRumble == true {
			if global.Death == false {
				if stomping == true { //Stomping
					gamepad_set_vibration(0, 0.25, 0.25);
				} else if stomped == true { //Stomped
					gamepad_set_vibration(0, 0.5, 0.5);
				} else { // If neither
					gamepad_set_vibration(0, 0, 0);
				}
			}
		}


		///-----Crouch-----///

		//Ducking
		if down_Key && look_up == false && stomping == false && prepare == false && railGrind == false && vel == 0 && ground == true && can_Move == true && sliding = false && stomped == false {
		    ducking = true;
		}

		if ducking == false && sprite_index == sprCrouch {
			ducking = true;
		}

		//Force Crouch
		if instance_exists(obj_PlayerHurtJump) {
			if obj_PlayerHurtJump.collide == true && ground == true && sliding == false {
				ducking = true;
			}
		}


		if ducking == true {
			mask_index = crouch_Mask;
		}

		if ducking == true && !down_Key {
	
			//Check if I CAN uncrouch
			mask_index = idle_Mask;
			
			if !place_meeting(x, y, obj_Solid) {
				ducking = false;
			} else {
				mask_index = crouch_Mask;
			}
		}


		///-----Horizontal Movement-----///

		if !instance_exists(obj_CutsceneParent) {
		
			//Left Movement
			if left_Key && !place_meeting(x + (abs(vel) * -1) -1, y, obj_Solid) && stomping == false && railGrind == false && stomped == false && ducking == false && prepare == false && slow_Down == false && (can_Move == true or sliding == false && vel > 0) {
			    vel -= acc * (1 + ground);
	
			    if vel > 0 && ground == false {
			        vel -= acc;
				}
        
			    if sliding == false {
			        image_xscale = -1;
				}
			}

			//Right Movement
			if right_Key && !place_meeting(x + abs(vel) + 1, y, obj_Solid) && stomping == false && railGrind == false && ducking == false && stomped == false && prepare == false && slow_Down == false && (can_Move == true or sliding == false && vel < 0) {
			    vel += acc * (1 + ground);
	
			    if vel < 0 && ground == false {
			        vel += acc;
				}
        
			    if sliding == false {
			        image_xscale = 1;
				}
			}
		
		}

		//Deacceleration
		if ground == true && railGrind == false {
		    if vel > 0 {
		        vel -= acc / (sliding + 1);
			} else if vel < 0 {
		        vel += acc / (sliding + 1);
			}
		}


		/*Stop Horizontal Movement
		if can_Move == false {
			vel = 0;
		}*/

	
		//X Collision
		var _subPixel = 0.5;
		
		if place_meeting(x + vel, y, obj_Solid) {
			//First check if there is a slope to go up
			if !place_meeting(x + vel, y - abs(vel) - 20, obj_Solid) {
				while(place_meeting(x + vel, y, obj_Solid)) {
					y -= _subPixel;
				}
			} else { //If no slope, regular collision
	
			//Scoot up to wall precisely
			var _pixelCheck = _subPixel * sign(vel);
			
			while !place_meeting(x + _pixelCheck, y, obj_Solid) {
				x += _pixelCheck;
			}
	
			//Set velocity to zero to "collide"
			vel = 0;
			}
		}

		//Slope collision
		if yspd >= 0 && !place_meeting(x + vel, y + 1, obj_Solid) && place_meeting(x + vel, y + abs(vel) + 25, obj_Solid) {
			while(!place_meeting(x + vel, y + _subPixel, obj_Solid)) {
				y += _subPixel;
			}
		}
		
		//Move Player if on certain slopes
		if place_meeting(x, y + 1, obj_SlopeStairs) {
			vel = (vel - 0.075);
		} else if place_meeting(x, y + 1, obj_SlopeStairsR) {
			vel = (vel + 0.075);
		} else if place_meeting(x, y + 1, obj_RailCollSlope) {
			vel = (vel - 0.075);
		} else if place_meeting(x, y + 1, obj_RailCollSlopeR) {
			vel = (vel + 0.075);
		}
		
		if place_meeting(x, y + 1, obj_SlopeStairsSteep) {
			vel = (vel - 0.15);
		} else if place_meeting(x, y + 1, obj_SlopeStairsSteepR) {
			vel = (vel + 0.15);
		} else if place_meeting(x, y + 1, obj_RailCollSlopeSteep) {
			vel = (vel - 0.15);
		} else if place_meeting(x, y + 1, obj_RailCollSlopeSteepR) {
			vel = (vel + 0.15);
		}
		

		//Speed limit
		if vel > max_Speed {
		    vel = max_Speed;
		} else if vel < -max_Speed {
		     vel = -max_Speed;
		}
     
		if vel > -acc && vel < acc {
		    vel = 0;
		}
 
		//X position influenced by vel variable
		x += vel;


		///-----Sprite & Animation Handler-----///
		
		if !instance_exists(obj_CutsceneParent) {
			//Skid
			if ground == true && skid == true {
				sprite_index = sprSkid;
				mask_index = idle_Mask;
				image_speed = 1;
			}

			//Ground
			if ground == true && ducking == false && sliding == false && airDash == false && stomping == false && stomped == false && jumping == false && dJumping == false && skid == false && prepare == false {
			   if vel == 0 {
			       sprite_index = sprIdle;
				   image_speed = 1;
			   } else if vel > -10 && vel < 10 {
			       sprite_index = sprWalk;
				   image_speed = abs(vel / 4.5);
			   } else {
			       sprite_index = sprRun;
				   image_speed = abs(vel / 4);
			   }
			   
			   mask_index = idle_Mask;
			}
		
		
			//Prepare
			if prepare == true {
				sprite_index = sprPrepare;
				mask_index = idle_Mask;
			
				if instance_exists(obj_LevelCard) {
					image_speed = 0;
					image_index = 0;
				} else {
					image_speed = 1;
				}
			
				if image_index >= 39 {
					image_index = 39;
				}
			}
		
		
			//Special Idle
			if specialIdle == true {
				sprite_index = sprSpecialIdle;
				if image_index > 8 {
					image_index = 8;
					mask_index = crouch_Mask;
				}
			}


			//Look Up
			if look_up == true {
				sprite_index = sprLook_up;
				mask_index = idle_Mask;
			}


			//Ducking
			if ducking == true {
				sprite_index = sprCrouch;
				image_speed = 1;
				mask_index = crouch_Mask;
			}

			if ducking == true && floor(image_index) < 2 {
				image_index *= 1;
			}

			if ducking == true && floor(image_index) >= 2 {
				image_index = 2;
			}


			//Jumping
			if jumping == true && dJumping = false && yspd < 0 {
				sprite_index = sprJump;
				image_speed = 1;
				mask_index = idle_Mask;
			}


			//Double Jumping
			if dJumping = true && yspd < 0 {
				sprite_index = sprDJump;
				image_speed = 1.2;
				image_index *= 0 + 1;
				mask_index = idle_Mask;
			}

			//Go to falling animation after double jump
			if sprite_index == sprDJump && floor(image_index) >= 9 {
				sprite_index = sprFall;
			}


			//Falling
			if ground == false && yspd > 0 && sprite_index != sprDJump {
				sprite_index = sprFall;
				image_speed = 1;
				image_index *= 1;
				mask_index = idle_Mask;
			}

			//Loop Falling Animation
			if ground == false && sprite_index == sprFall && floor(image_index) = 5 {
				image_index = 3;
				mask_index = idle_Mask;
			}

			if ground == false && sprite_index == sprFall && floor(image_index) < 5 {
				image_index *= 1;
				mask_index = idle_Mask;
			}


			//Sliding
			if sliding == true {
				sprite_index = sprSlide;
				image_speed = 1;
				mask_index = slide_Mask;
			}


			//Stomping
			if stomping == true {
				sprite_index = sprStomping;
				image_speed = 1;
				mask_index = idle_Mask;
			} else if stomped == true {
				sprite_index = sprStomp;
				image_speed = 1;
				mask_index = crouch_Mask;
			}


			//Air Dash
			if airDash == true && stomping == false && dJumping == false {
				sprite_index = sprAirDash;
				image_speed = 1;
				mask_index = idle_Mask;
			}

			if dJumping == true && airDash == true {
				sprite_index = sprDJump;
				image_speed = 1;
			}


			//Wall Jump
			if wallJump == true && stomping == false && right_Key {
				image_xscale = -1;
				image_speed = 1;
				sprite_index = sprWallSlide;
				mask_index = idle_Mask;
			
				if sprite_index == sprJump or sprite_index == sprFall or sprite_index == sprFalling {
					sprite_index = sprWallSlide
				}
			} else if wallJump == true && stomping == false && left_Key {
				image_xscale = 1;
				image_speed = 1;
				sprite_index = sprWallSlide;
				mask_index = idle_Mask;
			
				if sprite_index == sprJump or sprite_index == sprFall or sprite_index == sprFalling {
					sprite_index = sprWallSlide
				}
			}

			if afterWallJump == true && stomping == false {
				sprite_index = sprAirDash;
				mask_index = idle_Mask;
			}
		
		
			//Rail-Grind
			if railGrind == true {
				image_speed = 1;
				sprite_index = sprRailGrind;
				mask_index = idle_Mask;
			}
		
		
			//Tricking
			if afterRailJump == true {
				image_speed = 1;
				sprite_index = sprRailJump;
				mask_index = idle_Mask;
			}
		
			if upTrick == true {
				image_speed = 1;
				sprite_index = sprTrickUp;
				mask_index = idle_Mask;
			} else if rightTrick == true {
				image_speed = 1;
				sprite_index = sprTrickSide;
				mask_index = idle_Mask;
			} else if leftTrick == true {
				image_speed = 1;
				sprite_index = sprTrickSide;
				mask_index = idle_Mask;
			}
		}
		

		///-----Angles-----///

		//Slopes
		if sliding == false && stomped == false && ground == true {
			if place_meeting(x, y + 1, obj_SlopeStairsSteep) or place_meeting(x, y + 1, obj_RailCollSlopeSteep) {
				drawAngle = 67.5;
			} else if place_meeting(x, y + 1, obj_SlopeStairsSteepR) or place_meeting(x, y + 1, obj_RailCollSlopeSteepR) {
				drawAngle = -67.5;
			} else if place_meeting(x, y + 1, obj_SlopeStairs) or place_meeting(x, y + 1, obj_RailCollSlope) {
				drawAngle = 45;
			} else if place_meeting(x, y + 1, obj_SlopeStairsR) or place_meeting(x, y + 1, obj_RailCollSlopeR) {
				drawAngle = -45;
			} else if place_meeting(x, y + 1, obj_SlopeStairsWide) or place_meeting(x, y + 1, obj_RailCollSlopeWide) {
				drawAngle = 22.5;
			} else if place_meeting(x, y + 1, obj_SlopeStairsWideR) or place_meeting(x, y + 1, obj_RailCollSlopeWideR) {
				drawAngle = -22.5;
			} else {
				drawAngle = 0;
			}
		}

		if sliding == true or stomped == true or ground == false {
			drawAngle = 0;
		}


		///-----Mask Handler-----///

		//General

		//If you're seein' this, do you like Garfield? I like Garfield. I actually really like the 3D show.
		//Kinda grew up with it so I do have a lil' bias, but even now I really like it. Might rewatch it soon.


		///-----Visual Effects-----///
	
		if global.Particles == true {
			//Sliding
			if sliding == true && image_xscale == 1 {
				instance_create_depth(x + 20, y + 18, depth, obj_SlideDustVFX);
			} else if sliding == true && image_xscale == -1 {
				instance_create_depth(x - 30, y + 18, depth, obj_SlideDustVFX);
			}


			//Sliding After Images
			if sliding == true && (vel >= 10 or vel <= -10) {
				with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
					sprite_index = other.sprite_index;
					image_xscale = other.image_xscale;
					image_index = other.image_index;
					image_blend = c_white;
					image_alpha = 1;
				}
			}


			//Stomping
			if !instance_exists(obj_StompingVFX) && stomping == true && !instance_exists(obj_PauseMenuOverworld) {
				instance_create_depth(x, y, depth - 1, obj_StompingVFX)
			}
			
			if stomping == false {
				instance_destroy(obj_StompingVFX);
			}
	
			if instance_exists(obj_StompingVFX) {
				if stomping == true {
					obj_StompingVFX.x = x;
					obj_StompingVFX.y = y + 40;
					obj_StompingVFX.visible = true;
					obj_StompingVFX.depth = depth - 1;
				} else if ground == true {
					obj_StompingVFX.x = 0;
					obj_StompingVFX.y = 0;
					obj_StompingVFX.visible = false;
				}
			}
		}

		if instance_exists(obj_CameraParent) {
			if global.ScreenShake == true {
				//Stomping Screen Shake
				if stomping == true {
					obj_CameraParent.shakeValue = 0.5;
				}
			}
		}


		if global.Particles == true {
			//Stomping After Images
			if stomping == true {
				with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
					sprite_index = other.sprite_index;
					image_xscale = other.image_xscale;
					image_index = other.image_index;
					image_blend = c_white;
					image_alpha = 1;
				}
			}


			//Stomped
			if stomped == true && !instance_exists(obj_StompVFX) && stompedTimer >= 25 {
				instance_create_depth(x, y, depth, obj_StompVFX);
			}
		}

		if instance_exists(obj_CameraParent) {
			if global.ScreenShake == true {
				//Stomped Screen Shake
				if stomped == true {
					obj_CameraParent.shakeValue = 0.75;
				}
			}
		}


		if global.Particles == true {
			//Air Dash After Images
			if airDash == true && stomping == false && wallJump == false {
				with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
					sprite_index = other.sprite_index;
					image_xscale = other.image_xscale;
					image_index = other.image_index;
					image_blend = c_white;
					image_alpha = 1;
				}
			}


			//Wall Jump
			if wallJump == true && stomping == false && place_meeting(x + 1, y, obj_Solid) && right_Key {
				instance_create_depth(x, y + 18, depth, obj_SlideDustVFX);
			} else if wallJump == true && stomping == false && place_meeting(x - 1, y, obj_Solid) && left_Key {
				instance_create_depth(x - 18, y + 18, depth, obj_SlideDustVFX);
			}
		}
		
		
		//Skidding
		if global.Particles == true {
			if skid == true && image_xscale == 1 {
				instance_create_depth(x - 20, y + 18, depth, obj_SlideDustVFX);
			} else if skid == true && image_xscale == -1 {
				instance_create_depth(x + 20, y + 18, depth, obj_SlideDustVFX);
			}
		}
		
		
		//Grinding
		if global.Particles == true {
			if railGrind == true && !instance_exists(obj_RailGrindVFX) && vel > 0 {
				instance_create_depth(x - 5, y + 30, depth, obj_RailGrindVFX);
			} else if railGrind == true && !instance_exists(obj_RailGrindVFX) && vel < 0 {
				instance_create_depth(x + 20, y + 30, depth, obj_RailGrindVFX);
			}
			
			//Before Trick
			if (afterRailJump == true or rampRing == true) && trick == false {
				if !instance_exists(obj_BodyGlow) {
					instance_create_depth(x, y, depth + 1, obj_BodyGlow);
				}
				
				with(obj_BodyGlow) {
					sprite_index = other.sprite_index;
					image_index = other.image_index;
					image_blend = c_white;
					image_xscale = other.image_xscale;
					x = other.x;
					y = other.y;
				}
			}
			
			
			//Side Trick
			if rightTrick == true or leftTrick == true {
				if !instance_exists(obj_SideTrickVFXKappa) && !instance_exists(obj_PauseMenuOverworld) {
					instance_create_depth(x, y, depth, obj_SideTrickVFXKappa);
				}
				
				with(obj_SideTrickVFXKappa) {
					image_xscale = other.image_xscale;
					
					if image_xscale == 1 {
						x = other.x - 10;
						y = other.y - 5;
					} else if image_xscale == -1 {
						x = other.x + 10;
						y = other.y - 5;
					}
				}
			}
			
			if rightTrick == false && leftTrick == false {
				if instance_exists(obj_SideTrickVFXKappa) {
					instance_destroy(obj_SideTrickVFXKappa);
				}
			}
			
		}

		///-----Vertical Movement-----///

		//Y Collision
		var _subPixel = 0.5;
		
		if place_meeting(x, y + yspd, obj_Solid) && yspd > 0 {
			//Scoot up to wall precisely
			var _pixelCheck = _subPixel * sign(yspd);
			
			while !place_meeting(x, y + _pixelCheck, obj_Solid) {
				y += _pixelCheck
			}
	
			//Bonk
			if yspd == 0 {
				yspd = 0;
			}
			
			if dJumping == true && ground == false {
				dJumping = true;
			}
	
			//Set gravity to collide
			yspd = 0;
			ground = true;
			jumping = false;
			dJumping = false;
			rampRing = false;
			
		} else if place_meeting(x, y + yspd, obj_Solid) && ground == false {
			//Scoot up to wall precisely
			var _pixelCheck = _subPixel * sign(yspd);
			
			while !place_meeting(x, y + _pixelCheck, obj_Solid) {
				y += _pixelCheck
			}
	
			//Bonk
			if yspd == 0 {
				yspd = 0;
			}
			
			yspd = 0;
		}

		//Check if touching a ground
		if !place_meeting(x, y + 1, obj_Solid) {
			ground = false;
		}

		//If no ground, turn state to jumping without jumping
		if ground == false {
			jumping = true;
		}
		
		//Y position influenced by yspd variable
		y += yspd;
	
		//Gravity
		yspd += grav;
		

		//Terminal Velocity
		if (yspd > termVel) { 
			yspd = termVel;
		}
		
		
		///-----Special Idle-----///
		if ground == true && vel == 0 && stomped == false && look_up == false && ducking == false && prepare == false && can_Move == true && can_MoveFULL == true {
			if specialIdleTimer > 0 {
				specialIdleTimer -= 1;
			}
			
			if specialIdleTimer <= 0 {
				specialIdleTimer = 0;
			}
		} else {
			specialIdleTimer = specialIdleFrames;
			specialIdle = false;
		}
		
		if specialIdleTimer == 0 {
			specialIdle = true;
		}
		
		if specialIdleTimer <= 3 && specialIdleTimer > 0 {
			image_index = 0;
		}


		///-----Look Up-----///

		//Looking up
		if ground == true && can_Move == true && prepare == false && railGrind == false && vel == 0 && stomped == false && ducking == false && up_Key {
			look_up = true;
		} else {
			look_up = false;
		}
		
		
		//---Manipulate jump speed on slopes---//
		
		if place_meeting(x, y + 1, obj_SlopeStairs) or place_meeting(x, y + 1, obj_SlopeStairsSteep) or place_meeting(x, y + 1, obj_RailCollSlope) or place_meeting(x, y + 1, obj_RailCollSlopeSteep) {
			if vel > 6 {
				var _speedCheck = (vel / max_Speed) / 15;
				jspd = jspd * (1 + _speedCheck);
			} else if vel < 6 {
				var _speedCheck = (vel / max_Speed) / 22;
				jspd = jspd * (1 - _speedCheck);
				
				if jump_Key {
					vel = vel + jspd / 2;
				}
			}
		} if place_meeting(x, y + 1, obj_SlopeStairsR) or place_meeting(x, y + 1, obj_SlopeStairsSteepR) or place_meeting(x, y + 1, obj_RailCollSlopeR) or place_meeting(x, y + 1, obj_RailCollSlopeSteepR) {
			if vel < -6 {
				var _speedCheck = ((vel / max_Speed) * -1) / 15;
				jspd = jspd * (1 + _speedCheck);
			} else if vel > -6 {
				var _speedCheck = ((vel / max_Speed) * -1) / 22;
				jspd = jspd * (1 - _speedCheck);
				
				if jump_Key {
					vel = vel + (jspd / 2) * -1;
				}
			}
		} else {
			jspd = kappa_Jspd;
		}


		///-----Actions-----///

		//Jumping
		if can_Move == true && jump_Key && ground == true && ducking == false && jumping == false && dJumping == false && stomping == false && stomped == false && airDash == false && prepare == false && afterRailJump == false && obj_PlayerHurtJump.collide == false {
			yspd = jspd;
			ground = false;
			jumping = true;
	
			//Sound Effect
			obj_SFXManager.jumpSound = true;
		}

		//Double Jump
		if can_Move == true && jump_Key && ground == false && wallJump == false && jumping == true && dJumping == false && stomping == false && afterRailJump == false && rampRing == false && stomped == false && global.Death == false && yspd > -2 {
			yspd = jspd;
			dJumping = true;
	
			//Sound Effect
			obj_SFXManager.doubleJumpSound = true;
		}

		//Variable Jumping (Jump height influenced by button press)
		if yspd < 0 && !jump_Key_Held {
			yspd = max(yspd, jspd / 4);
		}


		if ground == true {
			noDJumping = false;
		}	


		//Fail-Safe to not have 2 jumps when falling and not jumping
		if ground == false {
			jumping = true;
		}


		//Fail-Safe for infinite double jumping from ceiling
		if obj_PlayerHurtJump.collide == true && ground == false && dJumping == true {
			dJumping = true;
		}


		//Fail-Safe if ceiling collides with idle mask
		if instance_exists(obj_PlayerHurtJump) {
			obj_PlayerHurtJump.x = x;
			obj_PlayerHurtJump.y = y;

			if obj_PlayerHurtJump.collide == true && ground == true && sliding == true && vel > 0 {
				vel += 0.025;
			} else if obj_PlayerHurtJump.collide == true && ground == true && sliding == true && vel < 0 {
				vel -= 0.025;
			}
		}


		//Sliding
		if (vel > 3 or vel < -3) && ground == true && ducking == false && sliding == false && railGrind == false && down_Key {
		    sliding = true;
	
			//Sound Effect
			obj_SFXManager.slideSound = true;
		}

		if vel == 0 {
			sliding = false;
		}


		if sliding == true {
			slow_Down = true;
			ducking = false;
			mask_index = slide_Mask;
		} else {
			slow_Down = false;
		}


		if ducking == true && (!down_Key or ground == false) {
		    ducking = false;
		    can_Move = true;
		}


		if sliding == true && (ground == false or vel == 0)
		{
		    sliding = false;
		    can_Move = true;
		}

		//Slide while Ducking
		if jump_Key && ducking == true && sliding == false && vel == 0 {
			sliding = true;
			ducking = false;
			down_Key = false;
			image_speed = 1;
	
			//Sound Effect
			obj_SFXManager.slideSound = true;
	
			if image_xscale = 1 {
				vel = vel + 3;
			} else if image_xscale = -1 {
				vel = vel - 3;
			}
		}
		
		//Slide-Cancel
		if action2_Key && obj_PlayerHurtJump.collide == false && sliding == true && vel != 0 {
			sliding = false;
		}


		//Stomping
		if ground == false && stomping == false && (down_Key && action_Key) && can_Move == true {
			stomping = true
			airDash = false;
			wallJump = false;
			afterWallJump = false;
			rampRing = false;
	
			//Sound Effect
			obj_SFXManager.stompingSound = true;
		}

		if stomping == true {
			can_Move = false
			yspd = termVel;
			vel = 0;
			jumping = false;
			dJumping = false;
		}


		//Stomped
		if stomping == true && ground == true {
			stomped = true;
			stomping = false;
			stompedTimer = stompedFrames;
			obj_SFXManager.stompSound = true;
		}
		
		if stomped == true && action2_Key {
			stompedTimer = 0;
			
			if right_Key {
				vel = 10;
				
				//Sound Effect
				obj_SFXManager.airDashSound = true;
			} else if left_Key {
				vel = -10;
				
				//Sound Effect
				obj_SFXManager.airDashSound = true;
			}
			
		}

		if stompedTimer > 0 {
			stompedTimer--;
		}

		if stompedTimer <= 0 {
			stomped = false;
			can_Move = true;
		}


		//Air Dash
		if can_Move == true {
			if ground == false && airDash == false && rampRing == false && afterRailJump == false && trick == false && stomping == false && global.Death == false && action2_Key {
				airDash = true;
	
				if image_xscale == 1 {
					vel = vel + 4;
				} else if image_xscale == -1 {
					vel = vel - 4;
				}
	
				//Sound Effect
				obj_SFXManager.airDashSound = true;
			}

			if airDash == true && airDashTimer > 0 {
				jumping = true;
				yspd = 0;
				airDashTimer--;
			}
			
			if airDash == false {
				airDashTimer = airDashFrames;
			}

			if ground == true {
				airDash = false;
			}
		}


		//Wall Jump
		if global.Death == false {
			var _slopes = !place_meeting(x + 1, y, obj_SlopeStairs) or !place_meeting(x + 1, y, obj_SlopeStairsSteep) or !place_meeting(x + 1, y, obj_SlopeStairsWide);
			var _slopesR = !place_meeting(x + 1, y, obj_SlopeStairsR) or !place_meeting(x - 1, y, obj_SlopeStairsSteepR) or !place_meeting(x - 1, y, obj_SlopeStairsWideR);
			
			
			if ground == false && stomping == false && stomped == false && place_meeting(x + 1, y, obj_Solid) && _slopes && yspd > -2 && right_Key {
				wallJump = true;
				afterWallJump = false;
				
				obj_SFXManager.slideSound = true;
			} else if ground == false && stomping == false && stomped == false && place_meeting(x - 1, y, obj_Solid) && _slopesR && yspd > -2 && left_Key {
				wallJump = true;
				afterWallJump = false;
				
				obj_SFXManager.slideSound = true;
			} else if !right_Key or !left_Key {
				wallJump = false;
			}

			if wallJump == true && obj_SFXManager.slideSound == true {
				obj_SFXManager.slideSound = false;
			}

			if wallJump == true {
				grav = 0.1;
				termVel = 4;
				airDash = false;
				afterRailJump = false;
				trick = false;
				beforeTrick = false;
				rampRing = false;
				
			}

			if wallJump == true && place_meeting(x + 1, y, obj_Solid) && jump_Key && stomping == false {
				vel = vel - 5;
				yspd = -6;
				afterWallJump = true;
				obj_SFXManager.jumpSound = true;
			} else if wallJump == true && place_meeting(x - 1, y, obj_Solid) && jump_Key && stomping == false {
				vel = vel + 5;
				yspd = -6;
				afterWallJump = true;
				obj_SFXManager.jumpSound = true;
			}

			if ground == true {
				wallJump = false;
				afterWallJump = false;
			}

			if wallJump == false or stomping == true {
				grav = kappa_Grav;
				termVel = kappa_TermVel;
			}
		}
		
		
		//Rail-Grinding
		if instance_exists(obj_RailParent) {
			if place_meeting(x, y + 1, obj_RailParent) && yspd > 0 && stomping == false {
				railGrind = true;
				
				if railGrind == false {
					obj_SFXManager.railGrindOn = true;
				}
				
				if image_xscale == 1 && vel == 0 {
					vel = 2;
				} else if image_xscale == -1 && vel == 0 {
					vel = -2;
				}
			} else {
				railGrind = false;
			}
		}
		
		if railGrind == true {
			obj_SFXManager.railGrinding = true;
			
			ground = true;
			jumping = false;
			dJumping = false;
			sliding = false;
			stomped = false;
			afterRailJump = false;
			
			
			if vel > 0 && right_Key {
				vel += acc;
			} else if vel < 0 && left_Key {
				vel -= acc;
			}
			
			if vel > 0 {
				image_xscale = 1;
			} else if vel < 0 {
				image_xscale = -1;
			}
			
		} else {
			obj_SFXManager.railGrinding = false;
		}
		
		
		if place_meeting(x, y, obj_RailTrickColl) && action2_Key && railGrind == true && afterRailJump == false {
			afterRailJump = true;
			railGrind = false;
			ground = false;
			
			obj_SFXManager.airDashSound = true;
		}
		
		if afterRailJump == true && afterRailJumpTimer > 0 {
			afterRailJumpTimer -= 1;
			yspd = jspd;
		}
		
		if afterRailJump == false {
			afterRailJumpTimer = afterRailJumpFrames;
		}
		
		//I'm gettin' sick of the tricks happening the same frame you get a rail boost, so I'm doin' this as a compromise
		if afterRailJumpTimer < 15 {
			beforeTrick = true;
		}
		
		
		//Shit for ramps and rings
		if rampRing == true {
			beforeTrick = true;
			afterRailJump = false;
		}
		
		
		//Up Trick
		if (afterRailJump == true or rampRing == true) && beforeTrick == true && trick == false && railGrind == false && ground == false && up_Key && action2_Key {
			trick = true;
			upTrick = true;
			
			afterRailJumpTimer = 0;
			
			obj_SFXManager.airDashSound = true;
		} 
		
		//Left Trick
		if (afterRailJump == true or rampRing == true) && beforeTrick == true && trick == false && railGrind == false && ground == false && left_Key && !up_Key && action2_Key {
			trick = true;
			leftTrick = true;
			vel = vel - 8;
			
			afterRailJumpTimer = 0;

			
			obj_SFXManager.airDashSound = true;
			
		} 
		
		//Right Trick
		if (afterRailJump == true or rampRing == true) && beforeTrick == true && trick == false && railGrind == false && ground == false && right_Key && !up_Key && action2_Key {
			trick = true;
			rightTrick = true;
			vel = vel + 8;
			
			afterRailJumpTimer = 0;
			
			obj_SFXManager.airDashSound = true;
			
		}
		
		if leftTrick == true or rightTrick == true {
			if sideTrickTimer > 0 {
				yspd = 0;
			}
			
			if sideTrickTimer > 0 {
				sideTrickTimer -= 1;
			}
		}
		
		if upTrick == true && upTrickTimer > 0 {
			upTrickTimer -= 1;
			yspd = jspd;
		}
		
		if upTrick == false {
			upTrickTimer = upTrickFrames;
		}

		if ground == true or stomping == true or wallJump == true {
			afterRailJump = false;
			trick = false;
			upTrick = false;
			rightTrick = false;
			leftTrick = false;
			beforeTrick = false;
			
			sideTrickTimer = sideTrickFrames;
		}
	}
}


//Level Tracker Alpha
if place_meeting(x, y, obj_LevelDoorHead) && global.Opacity < 1 {
	global.Opacity += 0.05;
} else if !place_meeting(x, y, obj_LevelDoorHead) && global.Opacity > 0 {
	global.Opacity += -0.05;
}


//Make it so you can't move when a cutscene is playing
if instance_exists(obj_CutsceneParent) {
	can_Move = false;
} else {
	can_Move = true;
}