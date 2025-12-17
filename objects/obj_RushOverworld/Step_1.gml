#region //Attacking
	if (jumping or preStomp or sliding or stomping or dropdash or dropdashing or spindash or leftTrick or rightTrick or backTrick or upTrick or homing_Active) && (!homingAttacked) {
		attacking = true;
	} else {
		attacking = false;
	}
	
	if boost {
		megaAttacking = true;
	} else {
		megaAttacking = false;
	}
#endregion
	
#region //Basic Speed 1	
	scr_BasicControlsSpeedStep1();
#endregion
	
if can_MoveFULL {
	#region //Movement
		//Left Movement
		if left_Key && !spindash && !stomping && !railGrind && !stomped && !ducking && !prepare && !slow_Down && !prepare && !sliding {
			if !superPeelout && !afterWallJump {
				scr_PlayerMoveLeft();
			}
			
		    if !sliding && !wallJump {
		        image_xscale = -1;
			}
		}

		//Right Movement
		if right_Key && !spindash && !stomping && !railGrind && !stomped && !ducking && !prepare && !slow_Down && !prepare && !sliding {
		    if !superPeelout && !afterWallJump {
				scr_PlayerMoveRight();
			}
				
		    if !sliding && !wallJump {
		        image_xscale = 1;
			}
		}
	#endregion

	#region //Basic Speed 2
		#region //Deceleration
			scr_Deceleration();
		#endregion
		
		#region //X Collision
			scr_XCollision();
		#endregion

		#region //Crouching
			if down_Key && ground && !spindash && !spindashRev && !superPeelout && !look_up && !stomping && !prepare && !railGrind && abs(vel) == 0 && !sliding && !stomped {
			    if !ducking {
					image_index = 0;
					obj_SFXManager.block = true;
				}
			
				vel = 0;
				ducking = true;
				mask_index = crouch_Mask;
			} else {
				ducking = false;
			}
		#endregion
	
		#region //Looking up
			if ground && !spindash && !spindashRev && !superPeelout && !prepare && !railGrind && abs(vel) <= 0.5 && !stomped && !ducking && up_Key {
				look_up = true;
				vel = 0;
			} else {
				look_up = false;
			}
		#endregion
	
		#region //Speed limit
			scr_SpeedLimit();
		#endregion
		
		#region //Change Draw Angle
			scr_ChangeDrawAngle();
		#endregion
		
		#region //Fuck with momentum
			scr_SlopeMomentum();
		#endregion
	#endregion

	#region //Sprite & Animation Handler
		if !instance_exists(obj_CutsceneParent) {
			#region //Ground
				if ground && !specialIdle && !ducking && !sliding && !airDash && !stomping && !stomped && !jumping && !dJumping && !skid && !prepare {
					if abs(vel) == 0 {
						sprite_index = sprIdle;
						image_speed = 1;
					} else {
						if abs(vel) < max_Speed {
							sprite_index = sprWalk;
						
							if abs(vel) <= max_Speed / 6 {
								image_speed = 0.25;
							} else if abs(vel) >= max_Speed / 6 && abs(vel) < max_Speed / 3 {
								image_speed = 0.5;
							} else if abs(vel) >= max_Speed / 3 && abs(vel) < max_Speed / 1.5 {
								image_speed = 1;
							} else if abs(vel) >= max_Speed / 1.5 && abs(vel) < max_Speed / 1.3 {
								image_speed = 1.25;
							} else if abs(vel) >= max_Speed / 1.3 && abs(vel) < max_Speed {
								image_speed = 1.5;
							}
						} else if abs(vel) >= max_Speed && abs(vel) < full_Speed {
							sprite_index = sprRun;
						
							if abs(vel) < 2 + max_Speed {
								image_speed = 1.75;
							} else {
								image_speed = 2.25;
							}
						} else if abs(vel) >= full_Speed && abs(vel) < full_Speed * 1.1 {
							sprite_index = sprFullSpeedRun;
							image_speed = 2.5;
						} else {
							sprite_index = sprPeelout;
							image_speed = 3;
						}
					}
				
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //Special Idle
				if specialIdle {
					sprite_index = sprSpecialIdle;
					image_speed = 1;
				
					if image_index >= 65 {
						image_index = 65;
					
						if global.Particles {
							if sleepTimer > 0 {
								sleepTimer -= 1;
							}
						
							if sleepTimer <= 0 {
								if instance_number(obj_SleepingZs) < 5 {
									instance_create_depth(x, y, depth, obj_SleepingZs);
								}
							
								sleepTimer = sleepFrames;
							}
						}
					}
				} else {
					sleepTimer = sleepFrames;
				}
			#endregion
			
			#region //General Animations
				scr_GeneralAnimationsSpeed();
			#endregion
			
			#region //Other Animations
				#region //Skid
					if ground && skid {
						if !leftFacer {
							sprite_index = sprSkid;
						} else {
							if face_Left {
								sprite_index = sprSkidLeft;
							} else {
								sprite_index = sprSkidRight;
							}
						}
				
						mask_index = idle_Mask;
						image_speed = 1;
					}
				#endregion
			
				#region //Slowskid
					if slowSkid {
						if !leftFacer {
							sprite_index = sprSkid;
						} else {
							if face_Left {
								sprite_index = sprSkidLeft;
							} else {
								sprite_index = sprSkidRight;
							}
						}
				
						image_speed = 2;
					}
				#endregion
		
				#region //Prepare
					if prepare {
						sprite_index = sprPrepare;
						mask_index = idle_Mask;
			
						if floor(image_index) >= image_number - 1 {
							image_index = image_number - 1;
						}
					}
				#endregion
		
				#region //Look Up
					if look_up {
						if !leftFacer {
							sprite_index = sprLook_up;
						} else {
							if face_Left {
								sprite_index = sprLook_upLeft;
							} else {
								sprite_index = sprLook_upRight;
							}
						}
					
						mask_index = idle_Mask;
					}
				#endregion

				#region //Ducking
					if ducking && !spindash && !superPeelout && !spindashRev {
						if !leftFacer {
							sprite_index = sprCrouch;
						} else {
							if face_Left {
								sprite_index = sprCrouchLeft;
							} else {
								sprite_index = sprCrouchRight;
							}
						}
					
						if floor(image_index) >= image_number - 1 {
							image_index = image_number - 1;
						}
					
						image_speed = 2;
						mask_index = crouch_Mask;
					}
				#endregion
			
				#region //Jumping
					if jumping && !wallJump && !afterWallJump && !superPeelout && !homingAttacked && !spindash && !dropdash && !playerHurt && !rampRing && !afterRailJump && !preStomp && !stomping && !trick && yspd < 0 {
						sprite_index = sprJump;
						image_speed = 1;
						mask_index = idle_Mask;
					}
			
					//Falling
					if jumping && !wallJump && !afterWallJump && !superPeelout && !homingAttacked && !spindash && !dropdash && !playerHurt && !rampRing && !afterRailJump && !preStomp && !stomping && !trick && yspd > 0 && yspd < 3 {
						sprite_index = sprFall;
						image_speed = 1;
						mask_index = idle_Mask;
					}

					if !ground && yspd >= 3 && !wallJump && !afterWallJump && !superPeelout && !homingAttacked && !spindash && !dropdash && !playerHurt && !rampRing && !afterRailJump && !preStomp && !stomping && !trick {
						sprite_index = sprFalling;
						image_speed = 1;
						mask_index = idle_Mask;
					}
				#endregion
			#endregion
		
			#region //Stomping
				if preStomp && preStompTimer > 0 {
					sprite_index = sprPreStomp;
					image_speed = 1;
					mask_index = idle_Mask;
				}
			
				if stomping {
					sprite_index = sprStomping;
					image_speed = 1;
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //Spindash
				if spindash && !spindashRev {
					sprite_index = sprSpindash;
					image_speed = 1;
					mask_index = crouch_Mask;
				}
			
				if spindashRev {
					sprite_index = sprSpindashRev;
					image_speed = 1;
					mask_index = crouch_Mask;
					
					
				}
			
				//Dropdash
				if dropdash {
					sprite_index = sprDropdash;
					image_speed = 1;
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //Homing-Attack
				if homing_Active {
					sprite_index = sprSlide;
					image_speed = 3;
					mask_index = idle_Mask;
				}
			
				if homingAttacked {
					sprite_index = sprTrick1;
					image_speed = 1;
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //Super Peelout
				if superPeelout {
					mask_index = idle_Mask;
				
					if superPeeloutTimer > 0 && superPeeloutTimer < 100 {
						sprite_index = sprRun;
					} else if superPeeloutTimer >= 100 && superPeeloutTimer < 200 {
						sprite_index = sprFullSpeedRun;
					} else if superPeeloutTimer >= 200 && superPeeloutTimer <= 300 {
						sprite_index = sprPeeloutRev;
					}
				
					image_speed = superPeeloutTimer / 80;
				}
			#endregion

			#region //Wall Jump
				scr_WallJumpAnimation();

				if afterWallJump && !stomping {
					sprite_index = sprWallJump;
					mask_index = idle_Mask;
				}
			#endregion 
		
			#region //Tricking
				if (afterRailJump or rampRing) && !rushTrick {
					image_speed = 1;
					sprite_index = sprRailJump;
					mask_index = idle_Mask;
				}
		
				if !rushTrick {
					if upTrick {
						image_speed = 1;
						mask_index = idle_Mask;
					
						if yspd < -1 {
							sprite_index = sprTrickUp;
						} else if yspd >= -1 {
							sprite_index = sprFalling;
						}
					} else if rightTrick or leftTrick or backTrick {
						image_speed = 1;
						sprite_index = sprTrickSide;
						mask_index = idle_Mask;
					}
				}
			#endregion
		}
	#endregion

	#region //Visual Effects
		#region //Basic Visual Effects
			scr_BasicVisualEffectsSpeed1();
		#endregion
		
		#region //Homing-Attacking Visuals
			if homing_Active {
				scr_PlayerTrail();
				scr_SpeedBreakVFX();
			}
			
			if !homing_Active && !speedBreak {
				if instance_exists(obj_SpeedBreakVFX) {
					instance_destroy(obj_SpeedBreakVFX);
				}
			}
		#endregion
		
		#region //Side-Tricks
			if backTrick or leftTrick or rightTrick {
				scr_RushAdventureKickParticles(-2);
			} else {
				if instance_exists(obj_SideTrickVFXKappa) {
					instance_destroy(obj_SideTrickVFXKappa);
				}
			}
		#endregion
		
		
	#endregion
	
	#region //Basic Speed 3
		scr_BasicControlsSpeedStep3();
	#endregion
	
	#region //Jumping
		if jump_Key && ground && !look_up && !spindash && !superPeelout && !ducking && !jumping && !dJumping && !stomping && !stomped && !airDash && !prepare && !afterRailJump && !rampRing && !collide {
			scr_JumpManipulate();
			
			jumping = true;
			ground = false;
			sliding = false;
			ducking = false;
	
			//Sound Effect
			obj_SFXManager.sonicJump = true;
		}
	#endregion
		
	#region //Double Jump
		if jump_Key && !preStomp && jumpinTimer <= 0 && !homing_Active && !superPeelout && !spindash && !ground && !dropdash && !wallJump && jumping && !dJumping && !preStomp && !stomping && !afterRailJump && !rampRing && !stomped && !global.Death && yspd > -3 {
			yspd = -jspd;
			realJumping = true;
			image_index = 0;
			
			dJumping = true;
	
			//Sound Effect
			obj_SFXManager.sonicJump = true;
		}

		scr_VariableJumping();
	#endregion

	#region //Fail-Safe for infinite double jumping from ceiling
		if collide && ground == false && dJumping == true {
			dJumping = true;
		}
	#endregion
	
	#region //Sliding
		if abs(vel) > 1 && ground && !ducking && !sliding && !railGrind && down_Key {
		    sliding = true;
			mask_index = slide_Mask;
			ducking = false;
	
			//Sound Effect
			obj_SFXManager.spindashRev = true;
		}

		if abs(vel) < 0.5 {
			sliding = false;
		}

		if sliding {
			slow_Down = true;
			ducking = false;
		} else {
			slow_Down = false;
		}

		if sliding && (!ground or abs(vel) == 0) {
		    sliding = false;
		}
	#endregion
	
	#region //Spindash
		if ground && !railGrind && !railGrindCrouch && !prepare && !superPeelout && !spindash && vel == 0 && down_Key && (jump_Key or action_Key) {
			spindashTimer = spindashMax / 2;
			ducking = false;
			scr_ControllerRumble();
			
			if global.Particles && !instance_exists(obj_SpindashDust) {
				instance_create_depth(x, y, depth, obj_SpindashDust);
			}
			
			spindash = true;
			
			obj_SFXManager.spindashRev = true;
		}
		
		if spindash {
			ducking = false;
			
			if jump_Key or action_Key {
				scr_ControllerRumble();
				
				if spindashTimer < spindashMax {
					spindashTimer += 25;
				}
				
				obj_SFXManager.spindashRev = true;
				spindashRev = true;
				image_index = 0;
			}
			
			if spindashTimer > 50 {
				spindashTimer -= 1;
			}
			
			if spindashTimer > spindashMax {
				spindashTimer = spindashMax;
			}
		}

		if spindash && !down_Key {
			ducking = false;
		    sliding = true;
		    vel = image_xscale * spindashTimer / 9;
			yspd = 0;
		    spindash = false;
			spindashRev = false;
		    spindashTimer = 0;
			
			scr_StopCamMove();
			
			obj_SFXManager.stompingCharged = true;
		}
	#endregion
		
	#region //Super Peelout
		if ground && vel == 0 && !railGrind && !railGrindCrouch && !prepare && !spindash && !superPeelout && (up_Key && (jump_Key or action_Key)) {
			superPeeloutTimer = superPeeloutMax / 4;
			look_up = false;
			scr_ControllerRumble();
			
			if global.Particles && !instance_exists(obj_SpindashDust) {
				instance_create_depth(x, y, depth, obj_SpindashDust);
			}
			
			superPeelout = true;
			
			obj_SFXManager.spindashRev = true;
		}
		
		if superPeelout {
			look_up = false;
			
			if jump_Key or action_Key {
				scr_ControllerRumble();
				
				if superPeeloutTimer < superPeeloutMax {
					superPeeloutTimer += 40;
					obj_SFXManager.spindashRev = true;
				}
			}
			
			if superPeeloutTimer > 50 {
				superPeeloutTimer -= 5;
			}
			
			if superPeeloutTimer > superPeeloutMax {
				superPeeloutTimer = superPeeloutMax;
			}
		}
		
		if superPeelout && !up_Key {
		    vel = image_xscale * superPeeloutTimer / 11.5;
			yspd = 0;
			look_up = false;
		    superPeelout = false;
		    superPeeloutTimer = 0;
			
			scr_StopCamMove();
			
			if superPeeloutTimer > 250 {
				speedBreak = true;
			}
			
			obj_SFXManager.stompingCharged = true;
		}
	#endregion

	#region //Stomping
		if !ground && !preStomp && !alreadyStomped && !homing_Active && !dropdash && (down_Key && action_Key) {
			preStomp = true;
			alreadyStomped = true;
			wallJump = false;
			afterWallJump = false;
			rampRing = false;
			
			trick = false;
			upTrick = false;
			rightTrick = false;
			leftTrick = false;
			backTrick = false;
			
			rushTrick = false;
			rushTrickFinish = false;
			image_index = 0;
			
			obj_SFXManager.block = true;
		}
		
		if ground or afterRailJump or rampRing or airBoost  {
			alreadyStomped = false;
		}

		if preStomp {
			if preStompTimer > 0 {
				preStompTimer -= 1;
				yspd = 0;
			}
			
			if preStompTimer <= 0 {
				if !stomping {
					//Sound Effect
					obj_SFXManager.stompingSound = true;
					stomping = true;
				}
			}
		} else {
			preStompTimer = preStompFrames;
		}
		
		if stomping {
			yspd = termVel;
		}


		//Stomped
		if !place_meeting(x, y + yspd + 1, obj_BreakableFloor) && stomping && ground {
			stomping = false;
			preStomp = false;
			stomped = true;
			obj_SFXManager.stompSound = true;
			
			if vel != 0 {
				sliding = true;
				obj_SFXManager.spindashRev = true;
			}
			
			if audio_is_playing(snd_Stomping) {
				audio_stop_sound(snd_Stomping);
			}
		}
		
		if stomped {
			stomped = false;
		}
	#endregion
		
	#region //Dropdash
		if jumping && !ground && !rampRing && !afterRailJump && !dropdash && !homing_Active && !spindash && !superPeelout && !preStomp && !stomping && !wallJump && action_Key && !down_Key {
			dropdash = true;
			image_index = 0;
		}
		
		if dropdash && action_Key_Held {
			if dropdashTimer > 0 {
				dropdashTimer -= 1;
			}
			
			if dropdashTimer <= 0 {
				if !dropdashing {
					dropdashing = true;
					obj_SFXManager.spindashRev = true;
					scr_ControllerRumble();
				}
			}
		}
		
		if dropdashing {
			if ground {
				sliding = true;
				dropdash = false;
				dropdashing = false;
				scr_ControllerRumble();
				
				if image_xscale == 1 {
					if vel >= 0 {
						if vel < full_Speed {
							vel += max_Speed / 1.5;
						}
					} else {
						vel = max_Speed;
					}
				} else if image_xscale == -1 {
					if vel <= 0 {
						if vel > -full_Speed {
							vel -= max_Speed / 1.5;
						}
					} else {
						vel = -max_Speed;
					}
				}
				
				if global.Particles {
					with (instance_create_depth(x, y, depth, obj_SpindashDust)) {
						sprite_index = spr_SpindashDustGone;
					}
				}
				
				scr_StopCamMove();
				
				obj_SFXManager.spindashRev = true;
			}
		}
		
		if dropdash && !action_Key_Held {
			dropdash = false;
			dropdashing = false;
		}
		
		if ground && !dropdashing {
			dropdash = false;
		}
		
		if !dropdash {
			dropdashTimer = dropdashFrames;
		}
	#endregion

	#region //Wall-Jump
		if !ground && can_Move && yspd > -4 && !stomping && !preStomp && !dropdash && !spindash && !superPeelout && !instance_exists(obj_GOAL) {
			scr_WallClingStep();
		}
			
		if wallJump {
			if jumpKeyBuffered {
				afterWallJump = true;
				wallJump = false;
				realJumping = true;
				obj_SFXManager.sonicJump = true;
					
				yspd = -jspd;
				vel = onWall * -7;
			}
				
			termVel = 4;
				
			afterRailJump = false;
			rampRing = false;
			trick = false;
			upTrick = false;
			leftTrick = false;
			rightTrick = false;
			backTrick = false;
			afterWallJump = false;
		}
			
		if !wallJump {
			termVel = normalTermVel;
		}
			
		if ground or rampRing or homing_Active or playerHurt {
			wallJump = false;
			afterWallJump = false;
		}
			
		if afterWallJump {
			if yspd < 0 {
				var _yspd = yspd;
	
				if image_xscale == 1 {
					_yspd = yspd;
				} else {
					_yspd = -yspd;
				}
	
				var _angle = point_direction(0, 0, abs(vel), _yspd);
	
				drawAngle = _angle;
			} else {
				drawAngle = 0;
			}
		}
	#endregion
}

//Homing Attack
scr_HomingAttackStep();

scr_BasicControlsSpeedStep4();
