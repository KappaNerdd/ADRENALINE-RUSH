#region //Attack based on moves
	if ((realJumping) or stomping or backTrick or upTrick) && !glide && !afterGlide {
		attacking = true;
	} else {
		attacking = false;
	}
	
	if boost or sliding {
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
		if left_Key && !stomping && !playerHurt && !railGrind && !stomped && !ducking && !prepare && !slow_Down && !sliding {
			scr_PlayerMoveLeft();				
		}

		//Right Movement
		if right_Key && !stomping && !playerHurt && !railGrind && !stomped && !ducking && !prepare && !slow_Down && !sliding {
			scr_PlayerMoveRight();
		}
	#endregion

	#region //Basic Speed 2
		scr_BasicControlsSpeedStep2();
	#endregion

	#region //Sprite & Animation Handler
		if !instance_exists(obj_CutsceneParent) {
			#region //Ground
				if ground && !ducking && !sliding && !glide && !stomping && !stomped && !railGrind && !railGrindCrouch && !jumping && !dJumping && !skid && !prepare && !specialIdle {
					if abs(vel) == 0 {
						if !leftFacer {
							sprite_index = sprIdle;
						} else {
							if face_Left {
								sprite_index = sprIdleLeft;
							} else {
								sprite_index = sprIdleRight;
							}
						}
					
						image_speed = 1;
					} else {
						if abs(vel) < max_Speed {
							if !leftFacer {
								sprite_index = sprWalk;
							} else {
								if face_Left {
									sprite_index = sprWalkLeft;
								} else {
									sprite_index = sprWalkRight;
								}
							}
						
							if abs(vel) < max_Speed / 6 {
								image_speed = 0.25;
							} else if abs(vel) >= max_Speed / 6 && abs(vel) < max_Speed / 3 {
								image_speed = 0.5;
							} else if abs(vel) >= max_Speed / 3 && abs(vel) < max_Speed / 1.5 {
								image_speed = 1;
							} else if abs(vel) >= max_Speed / 1.5 && abs(vel) < max_Speed / 1.3 {
								image_speed = 1.25;
							} else if abs(vel) >= max_Speed / 1.3 && abs(vel) < max_Speed {
								image_speed = 1.75;
							}
						} else if abs(vel) >= max_Speed && abs(vel) < full_Speed {
							if !leftFacer {
								sprite_index = sprRun;
							} else {
								if face_Left {
									sprite_index = sprRunLeft;
								} else {
									sprite_index = sprRunRight;
								}
							}
						
							if abs(vel) < max_Speed * 1.5 {
								image_speed = 2;
							} else {
								image_speed = 2.25;
							}
						} else if abs(vel) >= full_Speed {
							if !leftFacer {
								sprite_index = sprFullSpeedRun;
							} else {
								if face_Left {
									sprite_index = sprFullSpeedRunLeft;
								} else {
									sprite_index = sprFullSpeedRunRight;
								}
							}
						
							image_speed = 2.5;
						}
					}
					
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //General Animations
				scr_GeneralAnimationsSpeed();
			#endregion
			
			#region //Other Animations
				scr_OtherAnimationsSpeed();
			#endregion
			
			#region //Double Jumping
				if dJumping && !glide && !afterGlide {
					sprite_index = sprDJump;
					image_speed = 2;
					mask_index = idle_Mask;
				}
			#endregion 

			#region //Falling
				if !ground && !glide && !afterGlide && jumping && !dJumping && !playerHurt && !rampRing && !wallJump && !afterRailJump && !trick {
					sprite_index = sprJump;
					mask_index = idle_Mask;
					
					if floor(image_index) == image_number - 1 {
						image_index = image_number - 3;
					}
					
					if !realJumping {
						if floor(image_index) < image_number - 3 {
							image_index = image_number - 3;
						}
						
						image_speed = 1;
					} else {
						image_speed = 1.5;
					}
				}
			#endregion

			#region //Special Idle
				if specialIdle {
					sprite_index = sprSpecialIdle;
					image_speed = 0.75;
				
					if floor(image_index) >= image_number - 1 {
						image_index = 6;
					}
				
					mask_index = idle_Mask;
				}
			#endregion

			#region //Stomping
				if stomping {
					sprite_index = sprStomping;
					image_speed = 1;
					mask_index = idle_Mask;
				} else if stomped {
					sprite_index = sprStomp;
					image_speed = 1;
					mask_index = crouch_Mask;
				}
			#endregion

			#region //Glide
				if glide {
					sprite_index = sprGlide;
					image_speed = 1.5;
					mask_index = idle_Mask;
					
					if floor(image_index) >= image_number - 2 {
						image_index = 0;
					}
				} else if afterGlide {
					sprite_index = sprGlide;
					image_speed = 1;
					mask_index = idle_Mask;
					
					if floor(image_index) >= image_number - 1 {
						glide = false;
						afterGlide = false;
						glided = false;
					}
				}
			#endregion

			#region //Wall-Jump
				scr_WallJumpAnimation();
			
				if afterWallJump {
					sprite_index = sprAirDash;
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //Directional-Tricks
				if !rushTrick {
					if upTrick {
						image_speed = 1;
						sprite_index = sprTrickUp;
						mask_index = idle_Mask;
						
						if yspd < 0 {
							if floor(image_index) >= 3 {
								image_index = 1;
							}
						} else {
							if floor(image_index) >= image_number - 1 {
								image_index = image_number - 3;
							}
						}
					} else if rightTrick or leftTrick {
						image_speed = 1;
						sprite_index = sprTrickSide;
						mask_index = idle_Mask;
						
						if floor(image_index) >= image_number - 1 {
							image_index = image_number - 3;
						}
					} else if backTrick {
						image_speed = -1;
						sprite_index = sprDJump;
						mask_index = idle_Mask;
					}
				}
			#endregion
			
			#region //Air-Boost
				/*if airBoost && boost && !ground && !stomping {
					sprite_index = sprSideLaunch;
					image_speed = 1;
					mask_index = idle_Mask;
					
					if floor(image_index) >= image_number - 1 {
						image_index = image_number - 3;
					}
				}*/
			#endregion
		}
	#endregion

	//If you're seein' this, do you like Garfield? I like Garfield. I actually really like the 3D show.
	//Kinda grew up with it so I do have a lil' bias, but even now I really like it. Might rewatch it soon.

	#region //Visual Effects
		#region //Basic Visual Effects
			scr_BasicVisualEffectsSpeed1();
		#endregion
	#endregion
		
	#region //Basic Speed 3
		scr_BasicControlsSpeedStep3();
	#endregion

	#region //Jumping
		if jump_Key && ground && !playerHurt && !ducking && !jumping && !stomping && !glide && !prepare && !afterRailJump && !collide {
			scr_JumpManipulate();
			
			realJumping = true;
			jumping = true;
			ground = false;
			sliding = false;
			ducking = false;
			stomped = false;
			
			//Sound Effect
			obj_SFXManager.jumpSound = true;
		}
	#endregion

	#region //Double Jump
		if jump_Key && !ground && jumpinTimer <= 0 && !wallJump && jumping && !playerHurt && !dJumping && !stomping && !afterRailJump && !rampRing && !stomped && !global.Death && yspd > -4 {
			scr_JumpManipulate();
			
			realJumping = true;
			dJumping = true;
			afterGlide = false;
			glide = false;
	
			//Sound Effect
			obj_SFXManager.doubleJumpSound = true;
		}
	#endregion

	#region //Variable Jumping
		scr_VariableJumping();
	#endregion

	#region //Fail-Safe for infinite double jumping from ceiling
		if collide && !ground && dJumping {
			dJumping = true;
		}
	#endregion

	#region //Sliding
		scr_SlidingSpeed();
		scr_StartSlideSpeed();
		scr_BasicControlsSpeedStep5();
	#endregion

	#region //Stomping
		if !ground && !stomping && !playerHurt && (down_Key && action_Key) {
			vel = 0;
			stomping = true;
			glide = false;
			afterGlide = false;
			wallJump = false;
			afterWallJump = false;
			afterRailJump = false;
			rampRing = false;
			
			angle = 0;
			drawAngle = 0;
			angleHolder = 0;
			winningAngle = 0;
			
			leftTrick = false;
			rightTrick = false;
			upTrick = false;
			backTrick = false;
	
			//Sound Effect
			obj_SFXManager.stompingSound = true;
		}
			
		if stomping {
			yspd = termVel;
			dJumping = false;
		} else {
			if audio_is_playing(snd_Stomping) {
				audio_stop_sound(snd_Stomping)
			}
		}
	#endregion

	#region //Stomped
		if !place_meeting(x, y + yspd, obj_BreakableFloor) && stomping && ground {
			if angleHolder == 0 {
				stomped = true;
				stompedTimer = stompedFrames;
			}
			
			yspd = 0;
			
			stomping = false;
			obj_SFXManager.stompSound = true;
		}
		
		#region //Slam-Dash
			if stomped {
				if stompedTimer > 0 {
					stompedTimer--;
				} else {
					stomped = false;
				}
			
				if action2_Key {
					if right_Key {
						if !speedBreak {
							vel = max_Speed;
						} else {
							vel = full_Speed;
						}
					
						stompedTimer = 0;
						stomped = false;
				
						//Sound Effect
						obj_SFXManager.airDashSound = true;
					} else if left_Key {
						if !speedBreak {
							vel = -max_Speed;
						} else {
							vel = -full_Speed;
						}
						
						stompedTimer = 0;
						stomped = false;
				
						//Sound Effect
						obj_SFXManager.airDashSound = true;
					}
				}
			}
		#endregion
	#endregion

	#region //Gliding
		if !ground && !glide && glideTimer > 0 && !playerHurt && !rampRing && !afterRailJump && !trick && !stomping && !global.Death && action2_Key {
			image_index = 0;
			realJumping = false;
			glide = true;
			glided = true;
			afterGlide = false;
			wallJump = false;
			yspd = grav / 3;
			grav = normalGrav / 3;
			scr_ControllerRumble();
			
			if wallJump {
				wallJump = false;
				afterWallJump = false;
			}
	
			//Sound Effect
			obj_SFXManager.burstGlide = true;
		}
		
		if glide {
			scr_ControllerRumble();
			
			if global.Particles {
				if glideBurstTimer > 0 {
					glideBurstTimer--;
				} else {
					glideBurstTimer = glideBurstFrames;
					scr_LuciBurstGlide(x, y, 0, true, true);
				}
			}
			
			if yspd >= 1 {
				yspd = 1;
			}
			
			if action2_Key_Held {
				if glideTimer > 0 {
					glideTimer--;
				} else {
					image_index = image_number - 2;
					glide = false;
					afterGlide = true;
					grav = normalGrav;
					
					if audio_is_playing(snd_BurstGlide) {
						audio_stop_sound(snd_BurstGlide);
					}
				}
			}
			
			if action2_Key_Released {
				image_index = image_number - 2;
				glide = false;
				afterGlide = true;
				grav = normalGrav;
				
				if audio_is_playing(snd_BurstGlide) {
					audio_stop_sound(snd_BurstGlide);
				}
			}
		} else {
			glideBurstTimer = 1;
			
			if glided {
				image_index = image_number - 2;
				glide = false;
				glided = false;
				afterGlide = true;
				grav = normalGrav;
				
				if audio_is_playing(snd_BurstGlide) {
					audio_stop_sound(snd_BurstGlide);
				}
			}
		}
			
		if (ground or playerHurt or stomping or rampRing or afterRailJump) {
			glide = false;
			afterGlide = false;
			glided = false;
			glideTimer = glideFrames;
			grav = normalGrav;
			
			if audio_is_playing(snd_BurstGlide) {
				audio_stop_sound(snd_BurstGlide);
			}
		}
	#endregion

	#region //Wall-Jump
		if !ground && !rampRing && !playerHurt && yspd > -4 && !stomping && !instance_exists(obj_GOAL) {
			scr_WallClingStep();
		} else {
			wallJump = false;
			wallJumping = false;
		}
			
		if wallJump {
			if jumpKeyBuffered {
				afterWallJump = true;
				wallJump = false;
				realJumping = true;
				obj_SFXManager.jumpSound = true;
					
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
			altFinish = false;
		}
			
		if ground or rampRing or stomping or afterRailJump or glide {
			wallJump = false;
			afterWallJump = false;
			onWall = false;
		}
	#endregion
	
	#region //Extra Trick Shit
		if rightTrick or leftTrick {
			bursting = true;
		}
		
		if bursting {
			if burstTrickTimer > 0 {
				burstTrickTimer--;
				
				invincibleTimer = 2;
				invincible = true;
				
				yspd = grav * 2;
				noMoveTimer = 15;
				
				if rightTrick {
					vel = fullTrickBoost;
				}
				
				if leftTrick {
					vel = -fullTrickBoost;
				}
			} else {
				if !bursted {
					bursted = true;
					vel = 0;
				}
			}
		} else {
			burstTrickTimer = burstTrickFrames;
			bursted = false;
		}
		
		if ground or playerHurt or stomping {
			bursting = false;
		}
	#endregion
}

scr_BasicControlsSpeedStep4();
