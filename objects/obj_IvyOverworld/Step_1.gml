#region //Attacking
	if (jumping or sliding or upTrick or backTrick or rightTrick or leftTrick or stomping or stompPow or stomped or hShootWeak) {
		attacking = true;
	} else {
		attacking = false;
	}
	
	if boost or hShoot {
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
		if left_Key && !hShoot && !stomping && !railGrind && !stomped && !ducking && !prepare && !slow_Down && !sliding {
		    scr_PlayerMoveLeft();
			
		    if !sliding && !wallJump {
		        image_xscale = -1;
			}
		}

		//Right Movement
		if right_Key && !hShoot && !stomping && !railGrind && !stomped && !ducking && !prepare && !slow_Down && !sliding {
			scr_PlayerMoveRight();
			
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
			if down_Key && ground && !shootGround && !look_up && !stomping && !prepare && !railGrind && abs(vel) == 0 && !sliding && !stomped {
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
			if ground && !prepare && !shootGround && !railGrind && abs(vel) <= 0.5 && !stomped && !ducking && up_Key {
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
				if ground && !ducking && !shootGround && !sliding && !stomping && !stomped && !railGrind && !railGrindCrouch && !jumping && !skid && !prepare && !specialIdle {
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
				#region //Special Idle
					if specialIdle {
						sprite_index = sprSpecialIdle;
						mask_index = idle_Mask;
						image_speed = 1;
					}
				#endregion
			
				#region //Skid
					if ground && skid && !shootGround {
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
			
						if instance_exists(obj_LevelCard) {
							image_speed = 0;
							image_index = 0;
						} else {
							image_speed = 1;
						}
			
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
					if ducking {
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
					if jumping && !playerHurt && !rampRing && !afterRailJump && !preStomp && !stomping && !trick && !hShoot && !hShootWeak && !shootAir && yspd < 0 {
						sprite_index = sprJump;
						image_speed = 1;
						mask_index = idle_Mask;
					}
			
					//Falling
					if jumping && !playerHurt && !rampRing && !afterRailJump && !preStomp && !stomping && !trick && !hShoot && !hShootWeak && !shootAir && yspd > 0 && yspd < 3 {
						sprite_index = sprFall;
						image_speed = 1;
						mask_index = idle_Mask;
					}

					if !ground && yspd >= 3 && !playerHurt && !rampRing && !afterRailJump && !preStomp && !stomping && !trick && !hShoot && !hShootWeak && !shootAir {
						sprite_index = sprFalling;
						image_speed = 1;
						mask_index = idle_Mask;
					}
				#endregion
			#endregion
			
			#region //Stomping
				if preStomp && !stomping {
					sprite_index = sprPreStomp;
					image_speed = 1;
					mask_index = idle_Mask;
				}
			
				if stomping {
					sprite_index = sprStomping;
					image_speed = 3;
					mask_index = idle_Mask;
				} else if stomped {
					if ground {
						sprite_index = sprStomp;
						image_speed = 1;
						mask_index = crouch_Mask;
					}
				}
			
				if !ground && stompPow {
					sprite_index = sprSlide;
					image_speed = 4;
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //Shooting
				if shootGround {
					image_speed = 2;
					sprite_index = sprShootGround;
					mask_index = idle_Mask;
					
					if image_index == image_number - 1 {
						shootGround = false;
					}
				}

				if shootAir {
					if yspd < 0 {
						sprite_index = sprShootAir;
						image_speed = 1;
					} else {
						sprite_index = sprSlide;
						image_speed = 4;
						
						if yspd > 1 {
							shootAir = false;
						}
					}
					
					mask_index = idle_Mask;
				}
				
				if hShootWeak {					
					if yspd <= 0 {
						sprite_index = sprTrickSide;
						image_speed = 1;
					} else if yspd > 0.5 {
						sprite_index = sprSlide;
						image_speed = 4;
					}
					
					mask_index = idle_Mask;
				}
				
				if hShoot {
					if yspd <= 0 {
						sprite_index = sprHShooting;
						image_speed = 3;
					} else {
						sprite_index = sprSlide;
						image_speed = 4;
					}
					
					mask_index = idle_Mask;
				}
			
				if hShootFinish {
					sprite_index = sprSlide;
					image_speed = 1;
					mask_index = idle_Mask;
				}
			#endregion
			
			#region //Tricks
				if backTrick {
					sprite_index = sprTrickUp;
					image_speed = 1;
					mask_index = idle_Mask;
				}
				
				if rightTrick or leftTrick {
					sprite_index = sprTrickSide;
					image_speed = 1;
					mask_index = idle_Mask;
					
					if floor(image_index) >= image_number - 1 {
						if rightTrick {
							rightTrick = false;
						} else if leftTrick {
							leftTrick = false;
						}
					}
				}
				
				if upTrick {
					sprite_index = sprTrickUp;
					image_speed = 1;
					mask_index = idle_Mask;
				}
			#endregion
		}
	#endregion
		
	#region //Visual Effects
		#region //Basic Visual Effects
			scr_BasicVisualEffectsSpeed1();
		#endregion
	
		#region //Gun Full Charge
		if fullCharge {
			if !global.SimplifyVFX {
				if fullChargeAuraTimer > 0 {
					fullChargeAuraTimer -= 1;
				}
				
				if fullChargeAuraTimer <= 0 {
					instance_create_depth(x, y, depth, obj_IvyFullChargeAura);
					fullChargeAuraTimer = fullChargeAuraFrames;
				}
			}
		} else {
			fullChargeAuraTimer = fullChargeAuraFrames;
		}
	#endregion
		
		#region //HShoot After-Images
			if (shootAir && yspd < 0) or hShootWeak or hShoot {
				scr_PlayerTrail();
			}
		#endregion
		
		#region //HShoot Boost Break
			if !speedBreak {
				scr_SpeedBreakVFX();
			}
		#endregion
		
		#region //Up Trick/Back Trick Thing
			if upTrick or backTrick {
				scr_RushAdventureKickParticles(-0.5);
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
		if can_Move && jump_Key && !playerHurt && ground && !ducking && !jumping && !stomping && !prepare && !afterRailJump && !collide {
			scr_JumpManipulate();
			
			jumping = true;
			realJumping = true;
			ground = false;
			sliding = false;
			ducking = false;
			stomped = false;
	
			//Sound Effect
			obj_SFXManager.jumpSound = true;
		}

		//Variable Jumping (Jump height influenced by button press)
		scr_VariableJumping();
	#endregion

	#region //Sliding
		scr_SlidingSpeed();
		scr_StartSlideSpeed();
	#endregion

	#region //Stomping
		if !ground && jumping && !stomping && !preStomp && !playerHurt && (down_Key && action_Key) {
			preStomp = true;
			shootAir = false;
			hShoot = false;
			hShootWeak = false;
			wallJump = false;
			afterWallJump = false;
			trick = false;
			backTrick = false;
			upTrick = false;
			rightTrick = false;
			leftTrick = false;
			playerHurt = false;
			rampRing = false;
			
			obj_SFXManager.ivyPreStomp = true;
			
			image_index = 0;
		}
		
		if preStomp {
			stomped = false;
			yspd = 0;
			
			if preStompTimer > 0 {
				preStompTimer -= 1;
			}
			
			if preStompTimer <= 0 {
				preStomp = false;
				stomping = true;
				
				//Sound Effect
				obj_SFXManager.stompingSound = true;
			}
		} else {
			preStompTimer = preStompFrames;
		}

		if stomping {
			termVel = normalTermVel * 1.5;
			yspd = termVel;
		}


		//Stomped
		if !place_meeting(x, y + yspd + 1, obj_BreakableFloor) && stomping && ground {
			stomped = true;
			stomping = false;
			
			termVel = normalTermVel;
			
			stompedTimer = stompedFrames;
			
			if audio_is_playing(snd_Stomping) {
				audio_stop_sound(snd_Stomping);
			}
			
			obj_SFXManager.ivyImpact = true;
		}
		
		if stomped && ground {
			if stompedTimer > 0 {
				stompedTimer -= 1;
			}
		} else if !ground && stompPow {
			if yspd > 0 {
				stompPow = false;
				stomped = false;
				stompedTimer = 0;
			}
		}
		
		if stompedTimer <= 0 {
			stomped = false;
		}

		if ground {
			stompTrick = false;
		}
	#endregion

	#region //Shooting
		#region //Charge
			if !instance_exists(obj_CountdownHead) && !instance_exists(obj_Countdown) && revolverAmmo != 0 && !playerHurt && !stompPow && !hShoot && !hShootWeak && !shootAir && !reload && !prepare && !rampRing && !afterRailJump && !trick && !global.Death {
				if action2_Key_Held {
					if chargeTimer > 0 {
						chargeTimer -= 1;
					}
				
					if chargeTimer < chargeFrames - 10 {
						obj_SFXManager.ivyCharge = true;
					}
				} else {
					obj_SFXManager.ivyCharge = false;
				}
			}
		
			if chargeTimer <= 0 {
				fullCharge = true;
				obj_IvyRevolverUI.alphaTimer = obj_IvyRevolverUI.alphaFrames;
			}
		
			if action2_Key_Released && (railGrind or prepare or sliding or rampRing or afterRailJump or trick or hShoot or preStomp or stomping or stomped or global.Death) {
				fullCharge = false;
				chargeTimer = chargeFrames
			}
		#endregion
		
		#region //Actual Shooting
			if !instance_exists(obj_CountdownHead) && !instance_exists(obj_Countdown) && revolverAmmo != 0 && !stompPow && !hShoot && !reload && !preStomp && !railGrind && !prepare && !sliding && !rampRing && !afterRailJump && !trick && !stomping && !stomped && !global.Death {
				if action2_Key_Released {
					obj_IvyRevolverUI.alphaTimer = obj_IvyRevolverUI.alphaFrames;
					
					if !fullCharge {
						#region //Reset Charge Timer
							chargeTimer = chargeFrames;
						#endregion
						
						#region //Normal Shooting
							if ground { //Ground
								shootGround = true;
								image_index = 0;
								revolverAmmo -= 1;
								scr_ControllerRumble();
								
								instance_create_depth(x, y, depth, obj_IvyBullet);
							} else { //Air
								image_index = 0;
								
								if jump_Key_Held or up_Key { //Jump
									shootAir = true;
									hShootWeak = false;
									realJumping = false;
									obj_SFXManager.ivyShoot = true;
									scr_ControllerRumble();
									
									if revolverAmmo == 6 {
										yspd = -normalJspd * 1.1;
									} else if revolverAmmo == 6 {
										yspd = -normalJspd * 1.1;
									} else if revolverAmmo == 5 {
										yspd = -normalJspd * 1.1;
									} else if revolverAmmo == 4 {
										yspd = -normalJspd * 1.2;
									} else if revolverAmmo == 3 {
										yspd = -normalJspd * 1.25;
									} else if revolverAmmo == 2 {
										yspd = -normalJspd * 1.3;
									} else if revolverAmmo == 1 {
										yspd = -normalJspd * 1.4;
									}
									
									revolverAmmo -= 1;
									
									instance_create_depth(x, y, depth, obj_IvyBullet);
								} else { //Horizontal
									hShootWeak = true;
									hShootWeakTimer = hShootWeakFrames;
									shootAir = false;
									obj_SFXManager.ivyShoot = true;
									scr_ControllerRumble();
									
									if left_Key && !right_Key { //Left Movement
										if vel < 0 {
											if !speedBreak {
												vel -= 3;
											} else {
												if vel > -full_Speed {
													vel -= 3;
												}
											}
										} else if vel > 0 {
											vel = -max_Speed
										}
									} else if right_Key && !left_Key { //Right Movement
										if vel > 0 {
											if !speedBreak {
												vel += 3;
											} else {
												if vel < full_Speed {
													vel += 3;
												}
											}
										} else if vel < 0 {
											vel = max_Speed
										}
									} else if left_Key && right_Key { //Boofum
										if !speedBreak {
											vel = 3 * image_xscale;
										} else {
											if abs(vel) < full_Speed {
												vel = 3 * image_xscale;
											}
										}
									} else if !left_Key && !right_Key { //Also Boofum
										if !speedBreak {
											vel = 3 * image_xscale;
										} else {
											if abs(vel) < full_Speed {
												vel = 3 * image_xscale;
											}
										}
									}
									
									revolverAmmo -= 1;
								}
							}
						#endregion
					} else {
						#region //Reset Charge Timer
							chargeTimer = chargeFrames;
						#endregion
						
						#region //Charged Shooting
							if revolverAmmo >= 2 {
								if ground { //Ground
									shootGround = true;
									image_index = 0;
									revolverAmmo -= 2;
									scr_ControllerRumble(0.5, 10);
									
									instance_create_depth(x, y, depth, obj_IvyBigBullet);
								} else {
									if jump_Key_Held or up_Key {
										shootAir = true;
										yspd = -normalJspd * 2;
										revolverAmmo -= 2;
										realJumping = false;
										image_index = 0;
										scr_ControllerRumble(0.5)
										
										scr_StopCamMove();
										
										instance_create_depth(x, y, depth, obj_IvyBigBullet);
									} else {
										hShoot = true;
										image_index = 0;
										obj_SFXManager.ivyPreStomp = true;
										
										scr_StopCamMove();
										
										vel += 3 * image_xscale;
									}
								}
							}
						#endregion
					}
				}
			}
			
			#region //Horizontral Shooting
				if hShootWeak {
					if hShootWeakTimer > 0 {
						yspd = 0;
						hShootWeakTimer -= 1;
						obj_IvyRevolverUI.alphaTimer = obj_IvyRevolverUI.alphaFrames;
					}
				} else {
					hShootWeakTimer = hShootWeakFrames;
				}
			
				if hShoot {
					obj_SFXManager.UndertaleRainbowLoop = true;
					scr_ControllerRumble(0.5);
					scr_ScreenShake(0.75);
					yspd = 0;
			
					if image_xscale == 1 {
						vel += acc * 2;
					} else if image_xscale == -1 {
						vel -= acc * 2;
					}
					
					if action_Key {
						hShoot = false;
						obj_SFXManager.UNDERTALEBombFly = true;
					}
					
					if yspd <= 0 {
						if place_meeting(x + 1, y, obj_Solid) {
							vel = -4;
							yspd = -7;
				
							hShoot = false;
							hShootFinish = true;
				
							obj_SFXManager.stomped = true;
							scr_ControllerRumble(0.5);
							scr_ScreenShake(1);
							
							instance_create_depth(x, y, depth, obj_RushBoostBreak);
						} else if place_meeting(x - 1, y, obj_Solid) {
							vel = 4;
							yspd = -7;
				
							hShootFinish = true;
							hShoot = false;
				
							obj_SFXManager.stomped = true;
							scr_ControllerRumble(0.5);
							scr_ScreenShake(1);
							
							instance_create_depth(x, y, depth, obj_RushBoostBreak);
						}
					}
			
					if hShootTimer > 0 {
						hShootTimer -= 1;
					}
			
					if hShootTimer <= 0 {
						if revolverAmmo > 0 {
							hShootTimer = hShootFrames;
							revolverAmmo -= 1;
						} else {
							hShoot = false;
						}
					}
				}
				
				if hShootFinish && yspd >= 0 {
					hShootFinish = false;
				}
		
				if !hShoot {
					hShootTimer = hShootFrames;
				}
				
				if !action2_Key_Held {
					chargeTimer = chargeFrames;
					fullCharge = false;
				}
			#endregion
			
			#region //Turn off variables
				if ground or afterWallJump or rampRing or railGrind or preStomp or stomping or stomped or playerHurt or global.Death {
					hShoot = false;
					hShootFinish = false;
					hShootWeak = false;
					shootAir = false;
				}
				
				if !ground or sliding or railGrind or playerHurt or preStomp or stomping or stomped or afterWallJump or rampRing or global.Death {
					shootGround = false;
				}
			#endregion
		#endregion
		
		#region //Reload
			if action4_Key && !reload && !hShoot && revolverAmmo < 6 {
				reload = true;
				scr_ControllerRumble();
			
				if !ground {
					if revolverAmmo == 0 {
						reloadTimer = reloadFramesAir;
					} else {
						reloadTimer = reloadFramesAir / revolverAmmo * 1.1;
					}
				} else {
					if revolverAmmo == 0 {
						reloadTimer = reloadFrames;
					} else {
						reloadTimer = reloadFrames / revolverAmmo * 1.5;
					}
				}
			}
		
			if reload {
				obj_IvyRevolverUI.alphaTimer = obj_IvyRevolverUI.alphaFrames;
			
				if reloadTimer > 0 {
					reloadTimer -= 1;
				}
			
				if reloadTimer <= 0 {
					revolverAmmo = 6;
					reload = false;
				}
			} else {
				reloadTimer = reloadFrames;
			}
		#endregion

	#endregion
}
	
scr_BasicControlsSpeedStep4();