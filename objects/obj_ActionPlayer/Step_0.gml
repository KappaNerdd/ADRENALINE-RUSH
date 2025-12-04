#region //Inputs
	if player && can_Move {
		scr_ControlsAction();
	}
	
	if !player {
		punchKeyBuffered = true;
	}
	
	if player {
		hitBox = obj_ActionHitbox;
	} else {
		hitBox = obj_EnemyHitbox;
	}
	
	if attacking {
		if state == "freeState" or state == "jumpState" or state == "dJumpState" or state == "hurtState" or state == "bigHurtState" or state == "omegaHurtState" {
			if instance_exists(hitBox) {
				instance_destroy(hitBox);
			}
			
			attacking = false;
		}
	}
	
	if !can_Move {
		attacking = false;
	}
	
	if state == "hurtState" or state == "bigHurtState" or state == "omegaHurtState" {
		if hitStun <= 0 {
			state = "freeState";
		}
	}
	
	if hitLag > 0 {
		hitLag--;
	}
#endregion

#region //Hurt, Big Hurt, & Omega Hurt
	switch(state) {
		case "hurtState":
			if !leftFacer {
				sprite_index = sprHurt;
			}
		break;
			
		case "bigHurtState":
			if !leftFacer {
				sprite_index = sprHurtBig;
			}
		break;
			
		case "omegaHurtState":
			if place_meeting(x + 1, y, obj_Solid) or place_meeting(x - 1, y, obj_Solid) {
				if !leftFacer {
					sprite_index = sprHurtWall;
				}
			} else if place_meeting(x, y + 1, obj_Solid) {
				if !leftFacer {
					sprite_index = sprHurtFloor;
				}
			} else {
				if !leftFacer {
					sprite_index = sprHurtOmega;
				}
			}
		break;
	}
#endregion

if hitLag <= 0 {
	#region //Image Speed
		image_speed = 1;
	#endregion
	
	#region //Invincibility Frames
		if invinceFrames > 0 {
			invinceFrames--;
		}
	#endregion
	
	#region //Movement, Crouch, Look Up, & Jump
		#region //Movement
			if !attacking && imperfectParryTimer <= 0 && state != "lookUpState" && state != "crouchState" && state != "backDashState" && state != "dashState" && state != "chargeState" && state != "hurtState" && state != "bigHurtState" && state != "omegaHurtState" {
				vel = ((right_Key - left_Key) * (moveSpd * moveDir));
			
				if ground {
					if dash_Key_Held {
						moveDir = moveMult;
					} else {
						moveDir = 1;
					}
				}
			} else {
				moveDir = 1;
			}
	
			if ground && !attacking && state != "lookUpState" && state != "crouchState" && state != "parryState" && state != "chargeState" && state != "hurtState" && state != "bigHurtState" && state != "omegaHurtState" {
				if !leftFacer {
					if right_Key {
						image_xscale = 1;
					} else if left_Key {
						image_xscale = -1;
					}
				} else {
					if right_Key {
						face_Left = false;
					} else if left_Key {
						face_Left = true;
					}
				}
			}
		#endregion
	
		#region //Crouch
			if down_Key {
				if ground && vel == 0 && state == "freeState" && !attacking {
					if state != "crouchState" {
						state = "crouchState";
						image_index = 0;
					}
				}
			} else {
				if state == "crouchState" {
					state = "freeState";
					mask_index = idle_Mask;
				}
			}
		#endregion
	
		#region //Look Up
			if up_Key {
				if ground && vel == 0 && state == "freeState" && !attacking {
					if state != "lookUpState" {
						state = "lookUpState";
						image_index = 0;
					}
				}
			} else {
				if state == "lookUpState" {
					state = "freeState";
				}
			}
		#endregion
	
		#region //Jump
			if special_Key && jumpCount > 0 && imperfectParryTimer <= 0 && state != "dashState" && state != "backDashState" && state != "hurtState" && state != "bigHurtState" && state != "omegaHurtState" {
				if state != "crouchState" {
					yspd = -jspd;
				} else {
					yspd = -jspd * 1.25;
				}
		
				attacking = false;
				jumpCount -= 1;
				image_index = 0;
		
				if ground {
					state = "jumpState";
					ground = false;
					obj_SFXManager.jumpSound = true;
				} else {
					state = "dJumpState";
					obj_SFXManager.doubleJumpSound = true;
				}
				
				if instance_exists(hitBox) {
					instance_destroy(hitBox);
				}
			}
		
			if special_Key_Held && (state == "jumpState" or state == "dJumpState") {
				if yspd > ogGrav * 13 && !ground {
					grav = floatGrav;
				}
			} else {
				grav = ogGrav;
			}
		
			if !special_Key_Held && !attacking && (state == "jumpState" or state == "dJumpState") {
				yspd = max(yspd, -jspd / 3);
			}
		#endregion
	#endregion

	#region //Dashing (Dashie lmao)
		#region //Dash & Back-Dash
			if dash_Key && !ground && !attacking && state != "backDashState" && state != "dashState" && dashCount > 0 && state != "hurtState" && state != "bigHurtState" && state != "omegaHurtState" {
				if !leftFacer {
					if image_xscale == 1 {
						if left_Key {
							state = "backDashState";
							yspd = -jspd / 1.5;
						} else if right_Key {
							state = "dashState";
						} else {
							state = "dashState";
						}
					}
				
					if image_xscale == -1 {
						if right_Key {
							state = "backDashState";
							yspd = -jspd / 1.5;
						} else if left_Key {
							state = "dashState";
						} else {
							state = "dashState";
						}
					}
				} else {
					if !face_Left {
						if left_Key {
							state = "backDashState";
							yspd = -jspd / 1.5;
						} else if right_Key {
							state = "dashState";
						} else {
							state = "dashState";
						}
					} else {
						if right_Key {
							state = "backDashState";
							yspd = -jspd / 1.5;
						} else if left_Key {
							state = "dashState";
						} else {
							state = "dashState";
						}
					}
				}
			
				dashCount--;
				obj_SFXManager.airDashSound = true;
			}
		
			if state != "dashState" && state != "backDashState" {
				dashTimer = dashFrames;
			}
		#endregion
		
		#region //Super-Dash
			
		#endregion
	#endregion

	#region //Parrying (Parry this you filthy casual)
		if parry_Key && state == "freeState" && EN >= 30 && imperfectParryTimer <= 0 {
			image_index = 0;
			vel = 0;
			EN -= 30;
			state = "parryState";
			perfectParryTimer = perfectParryFrames;
			imperfectParryTimer = imperfectParryFrames;
			obj_SFXManager.block = true;
		}
	#endregion

	#region //Charging
		if charge_Key && EN < maxEN {
			if state == "freeState" {
				image_index = 0;
				state = "chargeState";
				obj_SFXManager.block = true;
				vel = 0;
			}
		} else {
			if state == "chargeState" {
				image_index = 0;
				state = "freeState";
				createChargeSound = false;
			}
		}
	#endregion

	#region //Action Stage Step 1 & Hit Stun Code
		scr_ActionStageStep1();
		scr_ActionHitStun();
	#endregion

	#region //General Animation Handling
		switch(state) {
			#region //Idle, Crouch, Look Up, & Walk/Run
				case "freeState":
					if ground {
						light2Count = light2Set;
						light5Count = light5Set;
						medium2Count = medium2Set;
						medium5Count = medium5Set
						
						if vel == 0 {
							if specialIdleTimer > 0 {
								if !leftFacer {
									sprite_index = sprIdle;
								}
							} else {
								if !leftFacer {
									sprite_index = sprSpecialIdle;
								}
							}
						} else {
							if abs(vel) == moveSpd {
								if !leftFacer {
									sprite_index = sprWalk;
								}
							} else {
								if !leftFacer {
									sprite_index = sprRun;
								}
							}
						}
					} else {
						state = "jumpState";
					}
				break;
			
				case "crouchState":
					if !leftFacer {
						sprite_index = sprCrouch;
					}
				
					mask_index = crouch_Mask;
				
					if image_index >= image_number - 1 {
						image_index = image_number - 1;
					}
				break;
			
				case "lookUpState":
					if !leftFacer {
						sprite_index = sprLookUp;
					}
				
					if image_index >= image_number - 1 {
						image_index = image_number - 1;
					}
				break;
			#endregion
		
			#region //Jump & Double Jump
				case "jumpState":
					if !ground {
						if yspd < -1 {
							if !leftFacer {
								sprite_index = sprJump;
							}
						} else if yspd >= -1 && yspd < ogGrav * 13 {
							if !leftFacer {
								sprite_index = sprFall;
							}
						} else if yspd >= ogGrav * 13 {
							if !leftFacer {
								sprite_index = sprFalling;
							}
						}
					} else {
						state = "freeState";
					}
				break;
			
				case "dJumpState":
					if !ground {
						if !leftFacer {
							sprite_index = sprDJump;
						}
			
						if image_index >= image_number - 1 {
							image_index = image_number - 3;
						}
					} else {
						state = "freeState"
					}
				break;
			#endregion
		
			#region //Dash & Back-Dash
				case "dashState":
					if !leftFacer {
						sprite_index = sprFDash;
						vel = dashSpd * image_xscale;
						yspd = 0;
					
						dashTimer--;
					
						if dashTimer <= 0 {
							state = "dJumpState";
						}
					}
				break;
			
				case "backDashState":
					if !leftFacer {
						sprite_index = sprBDash;
						vel = -dashSpd * image_xscale;
					}
				
					dashTimer--;
					
					if dashTimer <= 0 {
						state = "dJumpState";
					}
				break;
			#endregion
		
			#region //Parry
				case "parryState":
					if !leftFacer {
						sprite_index = sprParry;
					}
				
					if image_index >= image_number - 1 {
						image_index = image_number - 1;
					}
				
					if perfectParryTimer > 0 {
						perfectParryTimer--;
					}
				
					if imperfectParryTimer > 0 && perfectParryTimer <= 0 {
						imperfectParryTimer--;
					}
				
					if imperfectParryTimer <= 0 {
						state = "freeState";
						image_index = 0;
					}
				break;
			#endregion
		
			#region //Charging
				case "chargeState":
					if !leftFacer {
						sprite_index = sprCharge;
					}
				
					if image_index >= image_number - 1 {
						image_index = image_number - 5;
					}
				
					if image_index >= image_number - 7 {
						if !createChargeSound {
							createChargeSound = true;
							
							if blazeRush {
								obj_SFXManager.blazeRush = true
							} else {
								obj_SFXManager.sonicRush = true;
							}
						}
						
						obj_SFXManager.chargeLoop = true;
						chargeTimer--;
						scr_ControllerRumble(0.25);
						scr_ScreenShake(2);
					
						if chargeTimer <= 0 {
							EN += 5;
							chargeTimer = chargeFrames;
						}
					}
				break;
			#endregion
			
		}
	#endregion
	

	#region	//Attacking
		switch(state) {
			#region //Start Attacks
				case "freeState":
					#region //5L
						if punchKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "5LState";
						}
					#endregion
						
					#region //5M
						if mediumKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "5MState";
						}
					#endregion
					
					#region //5H, 6H
						if heavyKeyBuffered {
							image_index = 0;
							obj_SFXManager.heavyWhoosh = true;
							
							if left_Key or right_Key {
								state = "6HState";
							} else {
								state = "5HState";
							}
						}
					#endregion
				break;
				
				case "crouchState":
					#region //2L
						if punchKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "2LState";
						}
					#endregion
				
					#region //2M
						if mediumKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "2MState";
						}
					#endregion
				
					#region //2H
						if heavyKeyBuffered {
							image_index = 0;
							obj_SFXManager.heavyWhoosh = true;
							state = "2HState";
						}
					#endregion
				break;
				
				case "jumpState":
					#region //J5L
						if punchKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "J5LState";
						}
					#endregion
					
					#region //J5M
						if mediumKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "J5MState";
						}
					#endregion
					
					#region //J2H, J5H
						if heavyKeyBuffered {
							image_index = 0;
							obj_SFXManager.heavyWhoosh = true;
							
							if !down_Key {
								state = "J5HState";
							} else {
								state = "J2HState";
							}
						}
					#endregion
				break;
				
				case "dJumpState":
					#region //J5L
						if punchKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "J5LState";
						}
					#endregion
					
					#region //J5M
						if mediumKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "J5MState";
						}
					#endregion
					
					#region //J2H, J5H
						if heavyKeyBuffered {
							image_index = 0;
							obj_SFXManager.heavyWhoosh = true;
							
							if !down_Key {
								state = "J5HState";
							} else {
								state = "J2HState";
							}
						}
					#endregion
				break;
			#endregion
			
			#region //Lights (Ground)
				#region //2s
					case "2LState":
						sprite_index = sprDLight;
						attacking = true;
						
						if image_index >= 2 && image_index < 4 {
							vel = 0.5 * image_xscale;
							
							scr_ActionPlayerHitbox(hitBox, "hurtState", 4000, 10, 18, 5, false, 0.5 * image_xscale, 0, 1 * image_xscale, -15, 0.4 * image_xscale, 0.2, 0.5, 0.1, "Light");
						} else {
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						}
						
						if image_index >= 4 {
							if punchKeyBuffered {
								if down_Key {
									if light2Count > 0 {
										obj_SFXManager.block = true;
										image_index = 0;
										state = "2LState";
									}
								} else {
									if light5Count > 0 {
										obj_SFXManager.block = true;
										image_index = 0;
										state = "5LState";
									}
								}
							}
							
							if mediumKeyBuffered {
								image_index = 0;
								obj_SFXManager.block = true;
								
								if down_Key {
									if medium2Count > 0 {
										state = "2MState";
									}
								} else {
									if medium5Count > 0 {
										state = "5MState";
									}
								}
							}
						}
					break;
				#endregion
			
				#region //5s
					case "5LState":
						sprite_index = sprLight1;
						attacking = true;
				
						if image_index >= 1 && image_index < 4 {
							vel = 1 * image_xscale;
						
							if image_index >= 2 {
								scr_ActionPlayerHitbox(hitBox, "hurtState", 4000, 10, 18, 5, false, 1 * image_xscale, 0, 1 * image_xscale, -22, 0.4 * image_xscale, 0.2, 0.5, 0.1, "Light");
							}
						}
					
						if image_index >= 4 {
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						
							#region //Start Attacks
								if punchKeyBuffered {
									image_index = 0;
									obj_SFXManager.block = true;
									
									if !down_Key {
										state = "5LLState";
									} else {
										if light2Count > 0 {
											state = "2LState";
										}
									}
								}
								
								if mediumKeyBuffered {
									if down_Key {
										if medium2Count > 0 {
											image_index = 0;
											obj_SFXManager.block = true;
											state = "2MState";
										}
									} else {
										image_index = 0;
										obj_SFXManager.block = true;
										state = "5MState";
									}
								}
								
								if heavyKeyBuffered {
									image_index = 0;
									obj_SFXManager.heavyWhoosh = true;
								
									if left_Key or right_Key {
										state = "6HState";
									} else if down_Key {
										state = "2HState";
									} else {
										state = "5HState";
									}
								}
							#endregion
						}
					break;
				
					case "5LLState":
						sprite_index = sprLight2;
						attacking = true;
						vel = 0;
				
						if image_index >= 2 && image_index < 4 {
							scr_ActionPlayerHitbox(hitBox, "hurtState", 7000, 10, 18, 5, false, 0, 0, 1 * image_xscale, -30, 0.3 * image_xscale, 0.43, 0.5, 0.1, "Light");
						}
					
						if image_index >= 4 {
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						
							#region //Start Attacks
								if punchKeyBuffered {
									image_index = 0;
									obj_SFXManager.block = true;
									state = "5LLLState";
								}
								
								if mediumKeyBuffered {
									if down_Key {
										if medium2Count > 0 {
											image_index = 0;
											obj_SFXManager.block = true;
											state = "2MState";
										}
									} else {
										image_index = 0;
										obj_SFXManager.block = true;
										state = "5MState";
									}
								}
						
								if heavyKeyBuffered {
									image_index = 0;
									obj_SFXManager.heavyWhoosh = true;
								
									if left_Key or right_Key {
										state = "6HState";
									} else if down_Key {
										state = "2HState";
									} else {
										state = "5HState";
									}
								}
							#endregion
						}
					break;
				
					case "5LLLState":
						sprite_index = sprLight3;
						attacking = true;
				
						if image_index >= 1 && image_index < 4 {
							if image_index >= 2 {
								scr_ActionPlayerHitbox(hitBox, "bigHurtState", 8000, 15, 35, 8, false, 0.75 * image_xscale, -4, 1 * image_xscale, -30, 0.3 * image_xscale, 0.5, 1, 0.25, "Medium");
							}
						
							vel = 1 * image_xscale;
							yspd = -1;
						}
					
						if image_index >= 4 {
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						}
					
						if image_index >= 7 {
							if punchKeyBuffered {
								image_index = 0;
								obj_SFXManager.block = true;
								state = "5HState";
							}
							
							if mediumKeyBuffered {
								if down_Key {
									if medium2Count > 0 {
										image_index = 0;
										obj_SFXManager.block = true;
										state = "2MState";
									}
								} else {
									image_index = 0;
									obj_SFXManager.block = true;
									state = "5MState";
								}
							}
						}
					break;
				#endregion
			#endregion
			
			#region //Mediums (Ground)
				#region //2s
					case "2MState":
						sprite_index = sprDMedium;
						attacking = true;
						
						if image_index >= 4 && image_index < 6 {
							vel = 1 * image_xscale;
							
							scr_ActionPlayerHitbox(hitBox, "bigHurtState", 6000, 15, 30, 5, false, 0.5 * image_xscale, -2, 1 * image_xscale, -28, 0.5 * image_xscale, 0.40, 1, 0.25, "Medium");
						} else {
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						}
						
						if image_index >= 6 {
							if mediumKeyBuffered && !down_Key {
								if medium5Count > 0 {
									state = "5MState";
									obj_SFXManager.block = true;
									image_index = 0;
								}
							}
						}
					break;
				#endregion
				
				#region //5s
					case "5MState":
						sprite_index = sprMedium1;
						attacking = true;
						
						if image_index >= 2 && image_index < 4 {
							vel = 0.5 * image_xscale;
							
							scr_ActionPlayerHitbox(hitBox, "bigHurtState", 6000, 15, 30, 5, false, 0, -3, 1 * image_xscale, -30, 0.3 * image_xscale, 0.4, 1, 0.25, "Medium");
						} else {
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						}
						
						if image_index >= 5 {
							if mediumKeyBuffered {
								if down_Key {
									if medium2Count > 0 {
										image_index = 0;
										obj_SFXManager.block = true;
										state = "2MState";
									}
								} else {
									image_index = 0;
									obj_SFXManager.block = true;
									state = "5MMState";
								}
							}
						}
					break;
					
					case "5MMState":
						sprite_index = sprMedium2;
						attacking = true;
						vel = 0;
						
						if image_index >= 1 && image_index < 3 {
							scr_ActionPlayerHitbox(hitBox, "bigHurtState", 6000, 15, 30, 5, false, 0, -3, 1 * image_xscale, -25, 0.3 * image_xscale, 0.35, 1, 0.25, "Medium");
						} else {
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						}
						
						if image_index >= 5 {
							if mediumKeyBuffered {
								if down_Key {
									if medium2Count > 0 {
										image_index = 0;
										obj_SFXManager.block = true;
										state = "2MState";
									}
								} else {
									image_index = 0;
									obj_SFXManager.heavyWhoosh = true;
									state = "5MMMState";
								}
							}
						}
					break;
					
					case "5MMMState":
						sprite_index = sprMedium3;
						attacking = true;
						
						if image_index >= 3 && image_index < 5 {
							scr_ActionPlayerHitbox(hitBox, "hurtState", 2000, 15, 30, 5, false, -0.25 * image_xscale, -3, 1 * image_xscale, -32, 0.5 * image_xscale, 0.35, 1, 0.25, "Light");
						} else if image_index >= 12 && image_index < 14 {
							scr_ActionPlayerHitbox(hitBox, "bigHurtState", 4000, 15, 30, 10, false, 0, -3, 1 * image_xscale, -32, 0.4 * image_xscale, 0.35, 1, 0.25, "Medium");
							vel = -1 * image_xscale;
						} else if image_index >= 16 && image_index < 17 {
							scr_ActionPlayerHitbox(hitBox, "bigHurtState", 6000, 15, 30, 20, false, 0, -4, 1 * image_xscale, -37, 0.35 * image_xscale, 0.5, 1, 0.25, "Medium");
						} else if image_index >= 18 && image_index < 20 {
							scr_ActionPlayerHitbox(hitBox, "omegaHurtState", 8000, 15, 50, 30, false, 3 * image_xscale, 10, 1 * image_xscale, -37, 0.35 * image_xscale, 0.5, 1, 0.25, "Heavy");
						} else {
							vel = 0;
							
							if instance_exists(hitBox) {
								instance_destroy(hitBox);
							}
						}
					break;
				#endregion
			#endregion
			
			#region //Heavys (Ground)
				case "2HState":
					sprite_index = sprDHeavy;
					attacking = true;
					vel = 0;
					
					if image_index >= 2 && image_index < 4 {
						scr_ActionPlayerHitbox(hitBox, "omegaHurtState", 10000, 20, 50, 30, true, 0, -8, -26, -40, 0.85, 0.5, 2, 0.5, "HeavyL");
					} else {
						if instance_exists(hitBox) {
							instance_destroy(hitBox);
						}
					}
				break;
			
				case "5HState":
					sprite_index = sprHeavy;
					attacking = true;
				
					if image_index >= 4 && image_index < 6 {
						scr_ActionPlayerHitbox(hitBox, "bigHurtState", 2000, 20, 20, 10, false, -2 * image_xscale, -2, 0, -30, 0.37 * image_xscale, 0.45, 1, 0.25, "Medium");
					} else if image_index >= 7 && image_index < 10 {
						scr_ActionPlayerHitbox(hitBox, "omegaHurtState", 8000, 20, 50, 30, true, 8 * image_xscale, -8, 0, -30, -0.37 * image_xscale, 0.45, 2, 0.5, "HeavyL");
					} else {
						if instance_exists(hitBox) {
							instance_destroy(hitBox);
						}
					}
					
					if image_index >= 12 && image_index < 15 {
						vel = -2 * image_xscale;
						yspd = -0.5;
					} else {
						vel = 0;
					}
				break;
				
				case "6HState":
					sprite_index = sprFHeavy;
					attacking = true;
					vel = 0;
					
					if image_index >= 3 && image_index < 4 {
						scr_ActionPlayerHitbox(hitBox, "bigHurtState", 2000, 20, 20, 10, false, 0, -2, 0, -38, 0.3 * image_xscale, 0.2, 1, 0.25, "Medium");
					} else if image_index >= 6 && image_index < 7 {
						scr_ActionPlayerHitbox(hitBox, "omegaHurtState", 8000, 20, 50, 30, true, 6 * image_xscale, -8, 0, -40, 0.3 * image_xscale, 0.2, 2, 0.5, "HeavyL");
					} else {
						if instance_exists(hitBox) {
							instance_destroy(hitBox);
						}
					}
				break;
			#endregion
			
			#region //Airs (Air)
				case "J5LState":
					sprite_index = sprJLight1;
					attacking = true;
					
					if image_index >= 1 && image_index < 3 {
						if instance_exists(hitBox) {
							if !hitBox.active {
								vel = 0;
								yspd = -3;
							}
						}
						
						scr_ActionPlayerHitbox(hitBox, "hurtState", 4000, 15, 30, 5, false, 0, -4, 1 * image_xscale, -20, 0.4 * image_xscale, 0.2, 1, 0.25, "Light");
					} else {
						if instance_exists(hitBox) {
							instance_destroy(hitBox);
						}
					}
					
					if image_index >= 4 {
						if punchKeyBuffered or mediumKeyBuffered {
							image_index = 0;
							obj_SFXManager.block = true;
							state = "J5MState";
						}
						
						if heavyKeyBuffered {
							image_index = 0;
							obj_SFXManager.heavyWhoosh = true;
							
							if !down_Key {
								state = "J5HState";
							} else {
								state = "J2State";
							}
						}
					}
				break;
				
				case "J5MState":
					sprite_index = sprJLight2;
					attacking = true;
					
					if image_index >= 1 && image_index < 4 {
						if instance_exists(hitBox) {
							if !hitBox.active {
								vel = 0;
								yspd = -2;
							}
						}
						
						scr_ActionPlayerHitbox(hitBox, "bigHurtState", 6000, 15, 30, 5, false, 0, -4, 1 * image_xscale, -20, 0.4 * image_xscale, 0.2, 1, 0.25, "Light");
					} else {
						if instance_exists(hitBox) {
							instance_destroy(hitBox);
						}
					}
					
					if image_index >= 4 {
						if punchKeyBuffered {
							image_index = 0;
							obj_SFXManager.heavyWhoosh = true;
							state = "J5HState";
						}
						
						if heavyKeyBuffered {
							image_index = 0;
							obj_SFXManager.heavyWhoosh = true;
							
							if !down_Key {
								state = "J5HState";
							} else {
								state = "J2HState";
							}
						}
					}
				break;
				
				case "J2HState":
					sprite_index = sprDJHeavy;
					attacking = true;
					
					if image_index >= 3 && image_index < 5 {
						if instance_exists(hitBox) {
							if !hitBox.active {
								vel = 0;
								yspd = -4;
							} else {
								yspd = -2;
							}
						}
						
						scr_ActionPlayerHitbox(hitBox, "omegaHurtState", 10000, 15, 30, 20, false, 0, -7, -20, -40, 0.6, 0.40, 1, 0.25, "Medium");
					} else {
						if instance_exists(hitBox) {
							instance_destroy(hitBox);
						}
					}
				break;
				
				case "J5HState":
					sprite_index = sprJHeavy;
					attacking = true;
					
					if image_index >= 4 && image_index < 7 {
						scr_ActionPlayerHitbox(hitBox, "omegaHurtState", 10000, 15, 40, 30, true, 0.5 * image_xscale, 10, 0, -45, 0.37 * image_xscale, 0.6, 1, 0.25, "HeavyL");
					} else {
						if instance_exists(hitBox) {
							instance_destroy(hitBox);
						}
					}
				break;
			#endregion
		}
	#endregion
} else {
	image_speed = 0;
}
