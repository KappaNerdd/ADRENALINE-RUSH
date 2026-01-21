#region //Attacking	
	if (jumping or backTrick or stomping) {
		attacking = true;
	} else {
		attacking = false;
	}
	
	if boost or sliding or hover {
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
		if left_Key && !stomping && !railGrind && !stomped && !ducking && !prepare && !slow_Down && !sliding {
			scr_PlayerMoveLeft();
				
			if !sliding && !wallJump {
				face_Left = true;
			}
		}

		//Right Movement
		if right_Key && !stomping && !railGrind && !ducking && !stomped && !prepare && !slow_Down && !sliding {
			scr_PlayerMoveRight();
			
		    if !sliding && !wallJump {
		        face_Left = false;
			}
		}
	#endregion

	#region //Basic Speed 2
		scr_BasicControlsSpeedStep2();
	#endregion

	#region //Sprite & Animation Handler
		if !instance_exists(obj_CutsceneParent) {
			#region //Ground
				if ground && !ducking && !sliding && !hover && !stomping && !stomped && !railGrind && !railGrindCrouch && !jumping && !dJumping && !skid && !prepare && !specialIdle {
					if abs(vel) == 0 {
						if face_Left {
							sprite_index = sprIdleLeft;
							image_speed = 1;
						} else {
						   sprite_index = sprIdleRight;
						   image_speed = 1;
						}
				   } else if abs(vel) < max_Speed {
						if face_Left {
							sprite_index = sprWalkLeft;
						} else {
							sprite_index = sprWalkRight;
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
							image_speed = 1.5;
						}
					} else if abs(vel) < full_Speed {
						if face_Left {
							sprite_index = sprRunLeft;
						} else {
							sprite_index = sprRunRight;
						}
				   
						if abs(vel) < 2 + max_Speed {
							image_speed = 1.75;
						} else {
							image_speed = 2;
						}
					} else {
						if face_Left {
							sprite_index = sprFullSpeedRunLeft;
						} else {
							sprite_index = sprFullSpeedRunRight;
						}
					
						image_speed = 2.5;
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
			
			#region //Special Idle
				if specialIdle {
					face_Left = false;
					sprite_index = sprSpecialIdle;
					mask_index = idle_Mask;
					image_speed = 1;
					
					if image_index >= 17.8 {
						image_index = 10;
					}
				}
			#endregion

			#region //Double Jumping
				if dJumping && yspd < 0 && !wallJump && !afterWallJump {
					sprite_index = sprDJump;
					image_speed = 3;
					mask_index = idle_Mask;
				} else if dJumping && yspd > 0 && !wallJump && !afterWallJump {
					sprite_index = sprDJump;
					image_speed = 0.5;
					mask_index = idle_Mask;
				}
			#endregion

			#region //Falling
				if (jumping && !dJumping) && !hover && !rampRing && !playerHurt && !wallJump && !afterRailJump && !railGrind && !trick && yspd > 0 && yspd < 3 {
					if !leftFacer {
						sprite_index = sprFall;
					} else {
						if face_Left {
							sprite_index = sprFallLeft;
						} else {
							sprite_index = sprFallRight;
						}
					}
					
					image_speed = 1;
					mask_index = idle_Mask;
				}
			
				if !ground && yspd > 3 && !dJumping && !hover && !playerHurt && !rampRing && !wallJump && !afterRailJump && !trick {
					if !leftFacer {
						sprite_index = sprFalling;
					} else {
						if face_Left {
							sprite_index = sprFallingLeft;
						} else {
							sprite_index = sprFallingRight;
						}
					}
				
					image_speed = 1;
					mask_index = idle_Mask;
				}
			#endregion

			#region //Stomping
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
				} else if stomped {
					sprite_index = sprStomp;
					image_speed = 1;
					mask_index = crouch_Mask;
				}
			#endregion

			#region //Hover
				if hover && !stomping && !wallJump {
					sprite_index = sprDJump;
					mask_index = idle_Mask;
					
					if face_Left {
						image_speed = -5;
					} else {
						image_speed = 5;
					}
				}
			#endregion

			#region //Wall Jump
				scr_WallJumpAnimation();

				if afterWallJump && !stomping {
					if face_Left {
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
			#endregion
		
			#region //Direction-Tricking
				if !rushTrick {
					if upTrick {
						image_speed = 1;
					
						if !face_Left {
							sprite_index = sprTrickUpRight;
						} else {
							sprite_index = sprTrickUpLeft;
						}
						
						mask_index = idle_Mask;
					} else if rightTrick {
						image_speed = 1;
						sprite_index = sprTrickRight;
						mask_index = idle_Mask;
					} else if leftTrick {
						image_speed = 1;
						sprite_index = sprTrickLeft;
						mask_index = idle_Mask;
					} else if backTrick {
						if !face_Left {
							image_speed = 1;
						} else {
							image_speed = -1;
						}
						
						sprite_index = sprRailJump;
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
	
		#region //Hover/Back Trick
			if hover {
				scr_RushAdventureKickParticles(5);
			}
			
			if backTrick {
				scr_RushAdventureKickParticles(0.5);
			}
			
			if !hover && !backTrick {
				instance_destroy(obj_SideTrickVFXKappa);
			}
		#endregion
	#endregion

	#region //Basic Speed 3
		scr_BasicControlsSpeedStep3();
	#endregion

	#region //Jumping
		if can_Move && jump_Key && ground && !ducking && !jumping && !dJumping && !stomping && !hover && !prepare && !afterRailJump && !collide {
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
		if can_Move && jump_Key && jumpinTimer <= 0 && !ground && !wallJump && !hover && jumping && !dJumping && !stomping && !afterRailJump && !rampRing && !stomped && !global.Death && yspd > -3 {
			yspd = -jspd;
			
			realJumping = true;
			dJumping = true;
			sideWallJump = false;
	
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
		if !ground && !stomping && (down_Key && action_Key) {
			stomping = true
			hover = false;
			wallJump = false;
			afterWallJump = false;
			afterRailJump = false;
			sideWallJump = false;
			
			drawAngle = 0;
			
			event_user(1);
			event_user(3);
	
			//Sound Effect
			obj_SFXManager.stompingRev = true;
		}

		if stomping {
			var _normalStomp = false;
			var _omegaStomp = false;
			
			if action_Key_Held {
				if stompingTimer > 0 && (!normalStomp or !omegaStomp) {
					stompingTimer -= 1;
					vel = 0;
					yspd = 0;
				}
			}
			
			if !action_Key_Held && stompingTimer > 0 {
				normalStomp = true;
			} else if action_Key_Held && stompingTimer <= 0 {
				omegaStomp = true;
			}
			
			if normalStomp {
				yspd = termVel;
				termVel = normalTermVel;
			}
			
			if omegaStomp {	
				if omegaStompingTimer > 0 {
					omegaStompingTimer -= 1;
					vel = 0;
					yspd = 0;
				}
				
				if omegaStompingTimer <= 0 {
					termVel = omegaTermVel;
					yspd = omegaTermVel;
					
					if !stompedSound {
						stompedSound = true;
						obj_SFXManager.stompingCharged = true;
						obj_SFXManager.omegaStomping = true;
					}
				}
			}
		}

		if !stomping {
			stompingTimer = 30;
			omegaStompingTimer = 0;
			termVel = normalTermVel;
			stompedSound = false;
		}
	#endregion

	#region //Stomped
		if !place_meeting(x, y + yspd + 1, obj_BreakableFloor) && stomping && ground {
			stomped = true;
			stomping = false;
			normalStomp = false;
			omegaStomp = false;
			stompedTimer = stompedFrames;
			
			obj_SFXManager.stompSound = true;
		}
		
		#region //Slam-Dash
			if stomped {
				vel = 0;
				
				if stompedTimer > 0 {
					stompedTimer--;
				}

				if stompedTimer <= 0 {
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
						stomped = false
				
						//Sound Effect
						obj_SFXManager.airDashSound = true;
					}
				}
			}
		#endregion

	#endregion
	
	#region //Hover
		if action2_Key_Held {
			if yspd > 0 && can_Move && !ground && !rampRing && !afterRailJump && !wallJump && !stomping && !playerHurt && !global.Death {
				hover = true;
				sideWallJump = false;
				
				if yspd >= 5 {
					yspd = 5;
				}
			} else {
				hover = false;
			}
		} else {
			hover = false;
		}
		
		if hover {
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
	#endregion

	#region //Wall Jump
		if !ground && can_Move && yspd > -4 && !stomping && !instance_exists(obj_GOAL) {
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
			
		if wallJump {
			drawAngle = 0;
				
			if place_meeting(x + 1, y, obj_Solid) {
				face_Left = false;
				sideWallJump = false;
					
				if specialKeyBuffered {
					vel = -12;
					yspd = -5;
					
					face_Left = true;
					
					realJumping = false;
					sideWallJump = true;
					wallJump = false;
					
					obj_SFXManager.jumpDash = true;
				}
			} else if place_meeting(x - 1, y, obj_Solid) {
				face_Left = true;
				sideWallJump = false;
					
				if specialKeyBuffered {
					vel = 12;
					yspd = -5;
						
					face_Left = false;
						
					realJumping = false;
					sideWallJump = true;
					wallJump = false;
					
					obj_SFXManager.jumpDash = true;
				}
			}
				
			if jumpKeyBuffered {
				afterWallJump = true;
				wallJump = false;
				realJumping = true;
				obj_SFXManager.jumpSound = true;
					
				yspd = -normalJspd * 1.2;
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
			
		if !wallJump {
			termVel = normalTermVel;
		}
			
		if ground or rampRing {
			wallJump = false;
			afterWallJump = false;
		}
	#endregion
}

scr_BasicControlsSpeedStep4();