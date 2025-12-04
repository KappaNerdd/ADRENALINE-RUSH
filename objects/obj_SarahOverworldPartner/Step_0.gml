if instance_exists(self) {
	///-----Keys-----///
	if can_Move && gamepad_is_connected(global.Player2Con) {
		getCharacterControlsP2();
	} else {
		left_Key = false;
		left_Key_Once = false;
		
		right_Key = false;
		right_Key_Once = false;
		
		up_Key = false;
		up_Key_Once = false;
		
		down_Key = false;
		down_Key_Once = false;
		
		jump_Key = false;
		jump_Key_Held = false;
		
		action_Key = false;
		action_Key_Held = false;
		
		action1_Key = false;
		action1_Key_Held = false;
		
		action2_Key = false;
		action2_Key_Held = false;
		
		action3_Key = false;
		action3_Key_Held = false;
	}
	
	if room == rm_HeadSpeedBoss {
		if createTimer > 0 {
			createTimer -= 1;
			
			left_Key = true;
		}
	}
	
	
	if !gamepad_is_connected(global.Player2Con) {
		#region //CPU Controls (Sarah)
	
			//Move Left or Right
			if x < obj_Player.x - 30 {
				right_Key = true;
			} else if x > obj_Player.x + 30 {
				left_Key = true;
			}
		
		
			//Jumping & Double Jumping
			if !rampRing && !afterRailJump {
				if y > obj_Player.y + 20 {
					jump_Key = true;
					jump_Key_Held = true;
				} else if y > obj_Player.y + 20 && jumping {
					if yspd > 0 {
						jump_Key = true;
					}
					
					jump_Key_Held = true;
				} else {
					jump_Key = false;
					jump_Key_Held = false;
				}
			}
			
			
			//Sliding
			if vel != 0 {
				if obj_Player.sliding && abs(vel) > 3 {
					down_Key = true;
				}
				
				if !obj_Player.sliding {
					action2_Key = true;
				}
			} else {
				if obj_Player.ducking {
					down_Key = true;
				}
			}
	
		#endregion
	}
	
	
	//Angles
	scr_AngleShitStep();
	

	//Spacebar/RB/R1/R
	if !instance_exists(obj_Spacebar) {
		instance_create_depth(x, y, obj_Player.depth - 100, obj_Spacebar);
	}


	//Ceiling Detection
	if !instance_exists(obj_SarahCeilingDetect) {
		instance_create_depth(x, y, obj_Player.depth + 1, obj_SarahCeilingDetect);
	}


	if instance_exists(obj_SarahCeilingDetect) {
		if global.DEBUG == true {
			obj_SarahCeilingDetect.visible = true;
		} else {
			obj_SarahCeilingDetect.visible = false;
		}
	}


	if can_MoveFULL == true {
	
		///-----Crouch-----///

		//Ducking
		if down_Key && look_up == false && stomping == false && prepare == false && railGrind == false && vel == 0 && ground == true && can_Move == true && sliding = false && stomped == false {
		    ducking = true;
		}
		
		if vel != 0 && ducking == true {
			sliding = true;
			ducking = false;
		}

		if ducking == false && (sprite_index == sprCrouchRight or sprite_index == sprCrouchLeft) {
			ducking = true;
		}

		//Force Crouch
		if instance_exists(obj_SarahCeilingDetect) {
			if obj_SarahCeilingDetect.collide == true && ground == true && sliding == false {
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
			if left_Key && !place_meeting(x + (abs(vel) * -1) -1, y, obj_Solid) && stomping == false && railGrind == false && stomped == false && ducking == false && prepare == false && slow_Down == false && prepare == false && (can_Move == true or sliding == false && vel > 0) {
				
				scr_PlayerMoveLeft();
        
			    if sliding == false {
			        face_Left = true;
				}
			}

			//Right Movement
			if right_Key && !place_meeting(x + abs(vel) + 1, y, obj_Solid) && stomping == false && railGrind == false && ducking == false && stomped == false && prepare == false && slow_Down == false && prepare == false && (can_Move == true or sliding == false && vel < 0) {
			    
				scr_PlayerMoveRight();
        
			    if sliding == false {
			        face_Left = false;
				}
			}
		
		}


		//Deceleration
		scr_Deceleration();
		
		//X Collision
		scr_XCollision();
		
		//Speed Limit
		scr_SpeedLimit();
		
		//Change Draw Angle
		scr_ChangeDrawAngle();
		
		//Fuck with momentum
		scr_SlopeMomentum();


		///-----Sprite & Animation Handler-----///
		
		if !instance_exists(obj_CutsceneParent) {
			//Skid
			if ground == true && skid == true {
				if face_Left == true {
					sprite_index = sprSkidLeft;
					mask_index = idle_Mask;
					image_speed = 1;
				} else {
					sprite_index = sprSkidRight;
					mask_index = idle_Mask;
					image_speed = 1;
				}
			}

			//Ground
			if ground == true && ducking == false && sliding == false && hover == false && stomping == false && stomped == false && jumping == false && dJumping == false && skid == false && prepare == false && specialIdle == false {
				if vel == 0 {
					if face_Left == true {
						sprite_index = sprIdleLeft;
						image_speed = 1;
					} else {
					   sprite_index = sprIdleRight;
					   image_speed = 1;
					}
			   } else if vel > -max_Speed && vel < max_Speed {
					if face_Left == true {
						sprite_index = sprWalkLeft;
					} else {
						sprite_index = sprWalkRight;
					}
					
					image_speed = abs(vel / 4.5);
				} else if vel > -full_Speed && vel < full_Speed {
					if face_Left == true {
						sprite_index = sprRunLeft;
					} else {
						sprite_index = sprRunRight;
					}
				   
					image_speed = abs(vel / 4);
				} else {
					if face_Left == true {
						sprite_index = sprFullSpeedRunLeft;
					} else {
						sprite_index = sprFullSpeedRunRight;
					}
					
					image_speed = 3.5;
				}
			   
			   mask_index = idle_Mask;
			}
			
			
			//Slowskid
			if slowSkid == true {
				if face_Left == true {
					sprite_index = sprSkidLeft;
					image_speed = abs(vel / 4);
				} else {
					sprite_index = sprSkidRight;
					image_speed = abs(vel / 4);
				}
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
			
				if image_index >= 27 {
					image_index = 27;
				}
			}
		
		
			//Special Idle
			if specialIdle == true {
				face_Left = false;
				sprite_index = sprSpecialIdle;
				mask_index = idle_Mask;
				image_speed = 1;
			}


			//Look Up
			if look_up == true {
				if face_Left == true {
					sprite_index = sprLook_upLeft;
					mask_index = idle_Mask;
				} else {
					sprite_index = sprLook_upRight;
					mask_index = idle_Mask;
				}
			}


			//Ducking
			if ducking == true {
				if face_Left == true {
					sprite_index = sprCrouchLeft;
					image_speed = 1;
				} else {
					sprite_index = sprCrouchRight;
					image_speed = 1;
				}
				
				mask_index = crouch_Mask;
			}

			if ducking == true && floor(image_index) < 2 {
				image_index *= 1;
			}

			if ducking == true && floor(image_index) >= 3 {
				image_index = 3;
			}


			//Jumping
			if jumping == true && dJumping = false && rampRing == false && afterRailJump == false && hover == false && trick == false && yspd < 0 {
				if face_Left == true {
					sprite_index = sprJumpLeft;
					image_speed = 1;
				} else {
					sprite_index = sprJumpRight;
					image_speed = 1;
				}
				
				mask_index = idle_Mask;
			}
			
			if jumping == true && dJumping = false && rampRing == false && afterRailJump == false && !hover && trick == false && yspd > 0 && yspd < 3 {
				if face_Left == true {
					sprite_index = sprFallLeft;
					image_speed = 1;
				} else {
					sprite_index = sprFallRight;
					image_speed = 1;
				}
				
				mask_index = idle_Mask;
			}


			//Double Jumping
			if dJumping = true && yspd < 0 && !wallJump && !afterWallJump {
				sprite_index = sprDJump;
				image_speed = 3;
				mask_index = idle_Mask;
			} else if dJumping == true && yspd > 0 && !wallJump && !afterWallJump {
				sprite_index = sprDJump;
				image_speed = 0.5;
				mask_index = idle_Mask;
			}


			//Falling
			if ground == false && dJumping == false && yspd > 3 && hover == false && rampRing == false && afterRailJump == false && trick == false && stomping == false {
				if face_Left == true {	
					sprite_index = sprFallingLeft;
					image_speed = 1;
				} else {
					sprite_index = sprFallingRight;
					image_speed = 1;
				}
				
				mask_index = idle_Mask;
			}


			//Sliding
			if sliding == true {
				if face_Left == true {
					sprite_index = sprSlideLeft;
				} else {
					sprite_index = sprSlideRight
				}
				
				image_speed = 1;
				mask_index = slide_Mask;
			}


			//Stomping
			if stomping && yspd == 0 {
				sprite_index = sprOmegaStomping;
				image_speed = 1;
				mask_index = idle_Mask;
			} else if stomping && yspd > 0 && yspd < 29 {
				sprite_index = sprStomping;
				image_speed = 2;
				mask_index = idle_Mask;
			} else if stomping && yspd > 29 {
				sprite_index = sprOmegaStomping;
				image_speed = 0;
				image_index = 5;
				mask_index = idle_Mask;
			} else if stomped == true {
				sprite_index = sprStomp;
				image_speed = 1;
				mask_index = crouch_Mask;
			}


			//Hover
			if hover == true && stomping == false && !wallJump {
				sprite_index = sprDJump;
				image_speed = 5;
				mask_index = idle_Mask;
			}


			//Wall Jump
			if wallJump == true && stomping == false && rampRing == false {
				image_speed = 1;
				mask_index = idle_Mask;
				
				if face_Left == true {
					sprite_index = sprWallSlideLeft;
					if sprite_index == sprJumpLeft or sprite_index == sprFallLeft or sprite_index == sprFallingLeft {
						sprite_index = sprWallSlideLeft;
					}
				} else {
					sprite_index = sprWallSlideRight;
					if sprite_index == sprJumpRight or sprite_index == sprFallRight or sprite_index == sprFallingRight {
						sprite_index = sprWallSlideRight;
					}
				}
			}

			if afterWallJump == true && stomping == false {
				if face_Left == true {
					sprite_index = sprWallJumpLeft;
					mask_index = idle_Mask;
				} else {
					sprite_index = sprWallJumpRight;
					mask_index = idle_Mask;
				}
			}
			
			if sideWallJump {
				mask_index = idle_Mask;
				image_speed = 1;
				
				if face_Left {
					sprite_index = sprTrickLeft;
				} else {
					sprite_index = sprTrickRight;
				}
			}
		
		
			//Rail-Grind
			if railGrind == true {
				image_speed = 1;
				
				if face_Left == true {
					sprite_index = sprRailGrindLeft;
				} else {
					sprite_index = sprRailGrindRight;
				}
				
				mask_index = idle_Mask;
			}
		
		
			//Tricking
			if (afterRailJump or rampRing) && !rushTrick {
				image_speed = 1;
				sprite_index = sprRailJump;
				mask_index = idle_Mask;
			}
			
			if !rushTrick {
				if upTrick == true {
					image_speed = 1;
					sprite_index = sprTrickUp;
					mask_index = idle_Mask;
				} else if rightTrick == true {
					image_speed = 1;
					sprite_index = sprTrickRight;
					mask_index = idle_Mask;
				} else if leftTrick == true {
					image_speed = 1;
					sprite_index = sprTrickLeft;
					mask_index = idle_Mask;
				}
			}
		}

		///-----Mask Handler-----///

		//General

		//If you're seein' this, do you like Garfield? I like Garfield. I actually really like the 3D show.
		//Kinda grew up with it so I do have a lil' bias, but even now I really like it. Might rewatch it soon.


		///-----Visual Effects-----///
	
		if global.Particles == true {
			
			//Skidding
			if global.Particles == true {
				if slowSkid == true && face_Left {
					instance_create_depth(x - 20, y + 18, depth, obj_SlideDustVFX);
				} else if slowSkid == true && !face_Left {
					instance_create_depth(x + 20, y + 18, depth, obj_SlideDustVFX);
				}
			}
			
			
			//Sliding
			if sliding == true && !face_Left {
				instance_create_depth(x + 20, y + 18, depth, obj_SlideDustVFX);
			} else if sliding == true && face_Left {
				instance_create_depth(x - 30, y + 18, depth, obj_SlideDustVFX);
			}


			//Sliding After Images
			if sliding == true && (vel >= 8 or vel <= -8) && !speedBreak {
				with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
					sprite_index = other.sprite_index;
					image_xscale = other.image_xscale;
					image_blend = #40F5FF;
					image_alpha = 1;
				}
			}
			
			
			//Speed Break
			if global.Particles == true {
				if speedBreak == true && !boost {
					with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
						sprite_index = other.sprite_index;
						image_xscale = other.image_xscale;
						image_blend = #40F5FF;
						image_alpha = 1;
					
						if !instance_exists(obj_SpeedBreakVFX) && !instance_exists(obj_PauseMenuOverworld) && !instance_exists(obj_Boost) {
							with(instance_create_depth(x, y, depth - 1, obj_SpeedBreakVFX)) {						
								depth = other.depth - 1;
								image_blend = #40F5FF;
							}
						}
						
						if instance_exists(obj_SpeedBreakVFX) {
							if other.face_Left == false {
								obj_SpeedBreakVFX.image_angle = 90;
							} else {
								obj_SpeedBreakVFX.image_angle = -90;
							}
							
							if instance_exists(obj_StompingVFX) or (obj_Player.vel < 8 && obj_Player.vel > -8) {
								obj_SpeedBreakVFX.visible = false;
							} else {
								obj_SpeedBreakVFX.visible = true;
							}
						}
					}
				}
				
				if speedBreak == false {
					instance_destroy(obj_SpeedBreakVFX);
				}
			}


			//Stomping
			if !instance_exists(obj_StompingVFX) && stomping == true && !instance_exists(obj_PauseMenuOverworld) {
				with instance_create_depth(x, y, depth - 1, obj_StompingVFX) {
					x = other.x;
					y = other.y + 40;
					depth = other.depth - 1;
					image_blend = #40F5FF;
				}
			}
			
			if stomping == false {
				instance_destroy(obj_StompingVFX);
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
			if stomping == true && !speedBreak && yspd > 0 {
				with(instance_create_depth(x, y, depth + 1, obj_PlayerTrail)) {
					sprite_index = other.sprite_index;
					image_xscale = other.image_xscale;
					image_blend = #40F5FF;
					image_alpha = 1;
				}
			}


			//Stomped
			if stomped == true && !instance_exists(obj_StompVFX) && stompedTimer >= 25 {
				with(instance_create_depth(x, y, depth, obj_StompVFX)) {
					image_blend = #40F5FF;
				}
			}
			
			
			//Hover
			if hover && !instance_exists(obj_SideTrickVFXKappa) {
				with(instance_create_depth(x, y - 2, depth - 1, obj_SideTrickVFXKappa)) {
					x = other.x;
					y = other.y;
					image_blend = #40F5FF;
					image_alpha = 0.5;
					image_speed = 3;
				}
			}
			
			if !hover {
				instance_destroy(obj_SideTrickVFXKappa);
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
			//Wall Jump
			if wallJump == true && stomping == false && place_meeting(x + 1, y, obj_Solid) {
				instance_create_depth(x, y + 18, depth, obj_SlideDustVFX);
			} else if wallJump == true && stomping == false && place_meeting(x - 1, y, obj_Solid) {
				instance_create_depth(x - 18, y + 18, depth, obj_SlideDustVFX);
			}
		}
		
		
		//Skidding
		if global.Particles == true {
			if skid == true && !face_Left {
				instance_create_depth(x - 20, y + 18, depth, obj_SlideDustVFX);
			} else if skid == true && face_Left {
				instance_create_depth(x + 20, y + 18, depth, obj_SlideDustVFX);
			}
		}
		
		
		//Grinding
		if global.Particles == true {
			if (railGrind == true or speedBreak == true) && !boost && ground && !instance_exists(obj_RailGrindVFX) && vel > 0 {
				instance_create_depth(x - 5, y + 30, depth, obj_RailGrindVFX);
			} else if (railGrind == true or speedBreak == true) && !boost && ground && !instance_exists(obj_RailGrindVFX) && vel < 0 {
				instance_create_depth(x + 20, y + 30, depth, obj_RailGrindVFX);
			}
			
			//Before Trick
			if (afterRailJump == true or rampRing == true) && !rushTrickFinish {
				if !instance_exists(obj_BodyGlow) {
					instance_create_depth(x, y, depth + 1, obj_BodyGlow);
				}
				
				with(obj_BodyGlow) {
					image_blend = #40F5FF;
					x = other.x;
					y = other.y;
				}
			}
			
			
			//Side Trick
			if rightTrick == true or leftTrick == true {
				
			}
		}

		///-----Vertical Movement-----///

		scr_YCollision();
		
		
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
	
		///-----Actions-----///

		//Jumping
		if can_Move == true && jump_Key && ground == true && ducking == false && jumping == false && dJumping == false && stomping == false && stomped == false && hover == false && prepare == false && afterRailJump == false && !obj_SarahCeilingDetect.collide {
			
			scr_JumpManipulate();
	
			//Sound Effect
			obj_SFXManager.jumpSound = true;
		}

		//Double Jump
		if can_Move == true && jump_Key && ground == false && wallJump == false && hover == false && jumping == true && dJumping == false && stomping == false && afterRailJump == false && rampRing == false && stomped == false && global.Death == false && yspd > -2 {
			yspd = jspd;
			
			dJumping = true;
			sideWallJump = false;
	
			//Sound Effect
			obj_SFXManager.doubleJumpSound = true;
		}

		//Variable Jumping (Jump height influenced by button press)
		if yspd < 0 && jumping && !jump_Key_Held && !rampRing && !afterRailJump && !stomping && !stomped && !sideWallJump {
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
		if obj_SarahCeilingDetect.collide == true && ground == false && dJumping == true {
			dJumping = true;
		}


		//Fail-Safe if ceiling collides with idle mask while sliding
		if instance_exists(obj_SarahCeilingDetect) {
			obj_SarahCeilingDetect.x = x;
			obj_SarahCeilingDetect.y = y;

			if obj_SarahCeilingDetect.collide == true && ground == true && sliding == true && vel > 0 {
				vel += acc / 2;
			} else if obj_SarahCeilingDetect.collide == true && ground == true && sliding == true && vel < 0 {
				vel -= acc / 2;
			}
		}


		//Sliding
		if (vel > 2 or vel < -2) && ground == true && ducking == false && sliding == false && railGrind == false && down_Key {
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
	
			if face_Left == false {
				vel = vel + 7;
			} else {
				vel = vel - 7;
			}
		}
		
		//Slide-Cancel
		if action2_Key && obj_SarahCeilingDetect.collide == false && sliding == true && vel != 0 {
			sliding = false;
		}


		//Stomping
		if ground == false && stomping == false && (down_Key && action_Key) && can_Move == true {
			stomping = true
			hover = false;
			wallJump = false;
			afterWallJump = false;
			afterRailJump = false;
			rampRing = false;
			sideWallJump = false;
			
			drawAngle = 0;
	
			//Sound Effect
			obj_SFXManager.stompingRev = true;
		}

		if stomping == true {
			var _normalStomp = false;
			var _omegaStomp = false;
			
			if action_Key_Held {
				if stompingTimer > 0 && (!normalStomp or !omegaStomp) {
					stompingTimer -= 1;
					vel = 0;
					yspd = 0;
				}
			}
			
			if stompingTimer == 1 {
				obj_SFXManager.stompingCharged = true;
			}
			
			if !action_Key_Held && stompingTimer > 0 {
				normalStomp = true;
			} else if action_Key_Held && stompingTimer <= 0 {
				omegaStomp = true;
			}
			
			if normalStomp == true {
				yspd = termVel;
				termVel = normalTermVel;
			}
			
			if omegaStomp == true {	
				if omegaStompingTimer > 0 {
					omegaStompingTimer -= 1;
					vel = 0;
					yspd = 0;
				}
					
				if omegaStompingTimer == 1 {
					obj_SFXManager.omegaStomping = true;
				}
				
				if omegaStompingTimer <= 0 {
					termVel = omegaTermVel;
					yspd = omegaTermVel;
				}
			}
		}

		if stomping == false {
			stompingTimer = 30;
			omegaStompingTimer = 0;
		}

		//Stomped
		if stomping == true && ground == true && !place_meeting(x, y + 1, obj_HeadFloorBreakable) {
			stomped = true;
			stomping = false;
			normalStomp = false;
			omegaStomp = false;
			stompedTimer = stompedFrames;
			
			obj_SFXManager.stompSound = true;
		}
		
		if stomped == true { //Slam-Dash
			if action2_Key {
				if right_Key {
					vel = 13;
					stompedTimer = 0;
				
					//Sound Effect
					obj_SFXManager.airDashSound = true;
				} else if left_Key {
					vel = -13;
					stompedTimer = 0;
				
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
		}


		//Hover
		if action2_Key_Held {
			if yspd > 0 && !ground && !rampRing && !afterRailJump && !wallJump && !stomping && !global.Death {
				hover = true;
				sideWallJump = false;
				
				if yspd >= 3 {
					yspd = 3;
				}
			} else {
				hover = false;
			}
		} else {
			hover = false;
		}
		
		if hover == true {
			obj_SFXManager.doubleJumpSoundLoop = true;
			grav = normalGrav / 4;
			
			if right_Key {
				if !speedBreak {
					if vel < max_Speed {
						vel += acc * 3;
					}
				} else {
					if vel < full_Speed {
						vel += acc * 3;
					}
				}
				
			} else if left_Key {
				if !speedBreak {
					if vel > -max_Speed {
						vel -= acc * 3;
					}
				} else {
					if vel > -full_Speed {
						vel -= acc * 3;
					}
				}
			}
			
		} else {
			termVel = normalTermVel;
			grav = normalGrav;
		}

		//Wall Jump
		if !ground && yspd > -3 && !stomping && !instance_exists(obj_GOAL) {
			scr_WallClingStep();
		}
		
		if ground {
			sideWallJump = false;
		}
		
		if sideWallJump {
			if !face_Left {
				drawAngle = point_direction(0, 0, vel, yspd);
			} else {
				drawAngle = point_direction(0, 0, -vel, -yspd);
			}
		}
			
			if wallJump == true {
				drawAngle = 0;
				
				if place_meeting(x + 1, y, obj_Solid) {
					face_Left = false;
					sideWallJump = false;
					
					if action2_Key {
						vel = -10;
						yspd = -5;
						
						face_Left = true;
						
						sideWallJump = true;
						wallJump = false;
						
						obj_SFXManager.airDashSound = true;
					}
				} else if place_meeting(x - 1, y, obj_Solid) {
					face_Left = true;
					sideWallJump = false;
					
					if action2_Key {
						vel = 10;
						yspd = -5;
						
						face_Left = false;
						
						sideWallJump = true;
						wallJump = false;
						
						obj_SFXManager.airDashSound = true;
					}
				}
				
				if jump_Key {
					afterWallJump = true;
					wallJump = false;
					obj_SFXManager.jumpSound = true;
					
					yspd = normalJspd * 1.2;
				}
				
				termVel = 2;
				
				afterRailJump = false;
				rampRing = false;
				trick = false;
				upTrick = false;
				leftTrick = false;
				rightTrick = false;
				hover = false;
			}
			
			if wallJump == false {
				termVel = normalTermVel;
			}
			
			if ground == true or rampRing == true {
				wallJump = false;
				afterWallJump = false;
			}
		
		
		
		//Rail-Grinding
		scr_RailGrindingStep();
		
	}
}

//Speed-Break
scr_SpeedBreakStep();

//Boost
scr_BoostingStep();

//Tricking
scr_AirTricksStep();

//Rush Mode
scr_RushMode();