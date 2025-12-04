function scr_BasicVariablesSpeedCreate() {
	#region //Health Checks
		scr_HealthSystemCreate();
	#endregion
	
	#region //Ground Checks
		global.PlayerID = id;
	
		ground = false;
		stompedCheck = false;
		isSlope = false;
		railGrindCheck = false;
		downSlopeSemiSolid = noone;
		
		myFloorPlat = noone;
		movePlatVel = 0;
		movePlatYspd = 0;
		
		coyoteJumpTimer = 0;
		coyoteJumpFrames = 5;
	#endregion
	
	#region //Movement Checks
		can_Move = true;
		can_MoveFULL = true;
		
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
		action_Key_Released = false;
		
		action1_Key = false;
		action1_Key_Held = false;
		
		action2_Key = false;
		action2_Key_Held = false;
		action2_Key_Released = false;
		
		action3_Key = false;
		action3_Key_Held = false;
	
		action4_Key = false;
		action4_Key_Held = false;
	
		pause_Key = false;
	
		select_Key = false;
		select_Key_Held = false;
	#endregion
	
	#region //Prepares
		prepare = false;
	#endregion

	#region //Special Idles
		specialIdle = false;
		specialIdleTimer = 300;
		specialIdleFrames = 300;
	#endregion

	#region //Jumping Checks
		jumping = false;
		dJumping = false;
		noDJumping = false;
		realJumping = false;
		
		jumpinTimer = 2;
		
		scr_jumpKeyBuffering();
	#endregion

	#region //Look Up/Duckings
		ducking = false;
		look_up = false;
	#endregion

	#region //Extras
		vel = 0;
		yspd = 0;
		drawAngle = 0;
		slowSkid = false;
		slow_Down = false;
		falling = false;
		skid = false;
		sliding = false;
		face_Left = false;
	#endregion
	
	#region //Some Extra Bullshits
		if instance_exists(obj_RoomTransitionBasicStage) {
			x = obj_RoomTransitionBasicStage.target_x;
			y = obj_RoomTransitionBasicStage.target_y;
		} else if instance_exists(obj_RoomTransitionBasicStage) {
			x = obj_RoomTransitionBasic.target_x;
			y = obj_RoomTransitionBasic.target_y;
		}	

		createTimer = 15;
	#endregion

	#region //Starting Frame for Animations
		image_index = 0;
		mask_index = idle_Mask;
	#endregion

	#region //Angles
		scr_AngleShitCreate();
	#endregion

	#region //Jump Key Bufferings
		scr_jumpKeyBuffering();
	#endregion

	#region //Wall-Jumps
		scr_WallClingCreate();
	#endregion

	#region //Rail-Grinds
		scr_RailGrindCreate();
	#endregion

	#region //Speed-Breaks
		scr_SpeedBreakCreate();
	#endregion

	#region //Boosts
		scr_BoostCreate();
	#endregion

	#region //Tricks
		scr_AirTricksCreate();
	#endregion

	#region //Rush Mode Colors
		scr_RushModeColorCreate();
	#endregion
}

function scr_BasicControlsSpeedStep1() {
	#region //General Controls
		if can_Move {
			var _recorder = instance_find(obj_InputRecorder, 0);

			if _recorder != noone && !_recorder.isPlaying {
				getCharacterControls();
			}
		} else {
			if instance_exists(obj_Countdown) or instance_exists(obj_CountdownHead) {
				var _recorder = instance_find(obj_InputRecorder, 0);

				if _recorder != noone && !_recorder.isPlaying {
					jump_Key = keyboard_check_pressed(global.JumpKeySpeed) or gamepad_button_check_pressed(global.Player1Con, global.JumpButtonSpeed);
					jump_Key = clamp(jump_Key, 0, 1);
				}
			}
			
			/*left_Key = false;
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
			action_Key_Released = false;
		
			action1_Key = false;
			action1_Key_Held = false;
		
			action2_Key = false;
			action2_Key_Held = false;
			action2_Key_Released = false;
		
			action3_Key = false;
			action3_Key_Held = false;
	
			action4_Key = false;
			action4_Key_Held = false;
	
			pause_Key = false;
	
			select_Key = false;
			select_Key_Held = false;*/
		}
		
		scr_JumpKeyBufferingStep();
		
		if !ground {
			myFloorPlat = noone;
		}
	#endregion
	
	#region //Extra Bullshit (Again)
		if room == rm_HeadSpeedBoss {
			if createTimer > 0 {
				createTimer -= 1;
			
				left_Key = true;
			}
		}
		
		if !stomped {
			stompedCheck = false;
		}
	#endregion
	
	#region //Angles
		scr_AngleShitBeginStep();
		scr_AngleShitStep();
	#endregion
	
	#region //Spawn Action 3 Key
		if !instance_exists(obj_Spacebar) {
			instance_create_depth(x, y, obj_Player.depth - 100, obj_Spacebar);
		}
	#endregion

	#region //Ceiling Detection
		scr_CeilingDetect();
	#endregion
	
}

function scr_BasicControlsSpeedStep2() {
	#region //Deceleration
		scr_Deceleration();
	#endregion
		
	#region //X Collision
		scr_XCollision();
	#endregion

	#region //Crouching
		if down_Key && ground && !look_up && !stomping && !prepare && !railGrind && abs(vel) == 0 && !sliding && !stomped {
		    if !ducking {
				image_index = 0;
				obj_SFXManager.jab = true;
			}
			
			vel = 0;
			ducking = true;
			mask_index = crouch_Mask;
		} else {
			ducking = false;
		}
	#endregion
	
	#region //Looking up
		if ground && !prepare && !railGrind && abs(vel) <= 0.5 && !stomped && !ducking && up_Key {
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
}

function scr_BasicControlsSpeedStep3() {
	#region //Y Collision
		scr_YCollision();
	#endregion
		
	#region //Special Idle
		if ground && abs(vel) == 0 && !stomped && !look_up && !ducking && !prepare && can_Move && can_MoveFULL {
			if specialIdleTimer > 0 {
				specialIdleTimer -= 1;
			}
			
			if specialIdleTimer <= 0 {
				specialIdleTimer = 0;
				specialIdle = true;
			}
		} else {
			specialIdleTimer = specialIdleFrames;
			specialIdle = false;
		}
		
		if specialIdleTimer <= 0 {
			specialIdle = true;
		}
		
		if specialIdleTimer <= 3 && specialIdleTimer > 0 {
			image_index = 0;
		}
	#endregion
}

function scr_BasicControlsSpeedStep4() {
	#region //Wall-Jump TermVel
		if !wallJump && !onWall {
			termVel = normalTermVel;
		}
	#endregion
	
	#region //Rail-Grinding
		scr_RailGrindingStep();
	#endregion

	#region //Speed-Break
		scr_SpeedBreakStep();
	#endregion

	#region //Boost
		scr_BoostingStep();
	#endregion

	#region //Tricking
		scr_AirTricksStep();
	#endregion

	#region //Rush Mode
		scr_RushMode();
	#endregion
	
	#region //Stomp-Railgrind
		if railGrind {
			stomping = false;
			stomped = false;
		}
	#endregion

	#region //Level Tracker Alpha
		if place_meeting(x, y, obj_LevelDoorHead) && global.Opacity < 1 {
			global.Opacity += 0.05;
		} else if !place_meeting(x, y, obj_LevelDoorHead) && global.Opacity > 0 {
			global.Opacity += -0.05;
		}
	#endregion
}

function scr_BasicControlsSpeedStep5() {
	#region //Slide-Cancel
		if action2_Key && !collide && sliding && vel != 0 {
			sliding = false;
		}
	#endregion
}

function scr_BasicVisualEffectsSpeed1() {
	#region //Skidding & Sliding
		if slowSkid or sliding {
			scr_DustParticles();
		}
	#endregion

	#region //Sliding After Images
		if sliding && abs(vel) >= max_Speed {
			scr_PlayerTrail();
		}
	#endregion	
			
	#region //Speed Break
		if speedBreak && !boost {
			scr_PlayerTrail();
			scr_SpeedBreakVFX();
			scr_RailGrindParticles(x);
		}
	#endregion

	#region //Stomping
		scr_StompVFX();
	#endregion

	#region //Stomping Screen Shake
		if stomping {
			scr_ScreenShake();
			scr_ControllerRumble();
		}
	#endregion

	#region //Stomping After Images
		if stomping && !boost {
			scr_PlayerTrail();
		}
	#endregion

	#region //Stomped
		scr_StompedVFX();
	#endregion

	#region //Stomped Screen Shake
		if stomped {
			scr_ScreenShake(0.75);
			scr_ControllerRumble(0.5)
		}
	#endregion

	#region //Wall-Jump
		if wallJump && place_meeting(x + 1, y, obj_Solid) {
			scr_DustParticles();
		} else if wallJump && place_meeting(x - 1, y, obj_Solid) {
			scr_DustParticles(x - 18);
		}
	#endregion
		
	#region //Skidding
		if skid {
			scr_DustParticles();
		}
	#endregion
				
	#region //Grinding
		if railGrind {
			scr_RailGrindParticles();
		}
	#endregion
			
	#region //Before Trick
		scr_BodyGlowVFX();
	#endregion
}


//---Moves---//

//Sliding
function scr_SlidingSpeed() {
	if abs(vel) > 1 && ground && !ducking && !sliding && !railGrind && !railGrindCrouch && down_Key {
	    sliding = true;
		slowSkid = false;
		mask_index = slide_Mask;
		ducking = false;
	
		//Sound Effect
		if self != obj_RushOverworld {
			obj_SFXManager.slideSound = true;
		} else {
			obj_SFXManager.spindashRev = true;
		}
	}

	if sliding {
		slow_Down = true;
		ducking = false;
	} else {
		slow_Down = false;
	}

	if sliding && (!ground or abs(vel) <= 0.5) {
	    sliding = false;
	}
}

function scr_StartSlideSpeed() {
	//Slide while Ducking
	if jump_Key && ducking && !sliding && abs(vel) < 0.5 {
		sliding = true;
		ducking = false;
		down_Key = false;
		image_index = 0;
		image_speed = 1;
		mask_index = slide_Mask;
	
		//Sound Effect
		obj_SFXManager.slideSound = true;
	
		if !leftFacer {
			vel = (max_Speed / 1.5) * image_xscale;
		} else {
			if face_Left {
				vel = -max_Speed / 1.5;
			} else {
				vel = max_Speed / 1.5;
			}
		}
	}
}
	
	
function scr_Stomped() {
	
}
	
//Animations
function scr_GeneralAnimationsSpeed() {		
	#region //Sliding
		if sliding {
			if !leftFacer {
				sprite_index = sprSlide;
			} else {
				if face_Left {
					sprite_index = sprSlideLeft;
				} else {
					sprite_index = sprSlideRight;
				}
			}
				
			if abs(vel) < max_Speed / 6 {
				image_speed = 1;
			} else if abs(vel) >= max_Speed / 6 && abs(vel) < max_Speed / 3 {
				image_speed = 1.5;
			} else if abs(vel) >= max_Speed / 3 && abs(vel) < max_Speed / 1.5 {
				image_speed = 2;
			} else if abs(vel) >= max_Speed / 1.5 && abs(vel) < max_Speed / 1.3 {
				image_speed = 2.5;
			} else if abs(vel) >= max_Speed / 1.3 && abs(vel) < max_Speed {
				image_speed = 3;
			} else if abs(vel) >= max_Speed {
				image_speed = 4;
			}
							
			mask_index = slide_Mask;
		}
	#endregion
		
	#region //Rail-Grind
		if railGrind {
			if !railGrindCrouch {
				if !leftFacer {
					sprite_index = sprRailGrind;
				} else {
					if face_Left {
						sprite_index = sprRailGrindLeft;
					} else {
						sprite_index = sprRailGrindRight;
					}
				}
					
				image_speed = 1;
				mask_index = idle_Mask;
			} else {
				if !leftFacer {
					sprite_index = sprRailGrindCrouch;
				} else {
					if face_Left {
						sprite_index = sprRailGrindCrouchLeft;
					} else {
						sprite_index = sprRailGrindCrouchRight;
					}
				}
					
				image_speed = 1;
				mask_index = slide_Mask;
			}
		}
	#endregion
		
	#region //Tricking
		if (afterRailJump or rampRing) && !rushTrick && !trick && !altTrick {
			sprite_index = sprRailJump;
					
			if !leftFacer {
				image_speed = 1.5;
			} else {
				if face_Left {
					image_speed = -1.5;
				} else {
					image_speed = 1.5;
				}
			}
					
			mask_index = idle_Mask;
		}
	#endregion
			
	#region //Player Hurt/Death	
		if playerHurt {
			if !global.Death {
				if !leftFacer {
					sprite_index = sprOmegaFall;
				} else {
					if face_Left {
						sprite_index = sprOmegaFallLeft;
					} else {
						sprite_index = sprOmegaFallRight;
					}
				}
					
				image_speed = 1;
				mask_index = idle_Mask;
			} else {
				sprite_index = sprDeath;
				image_speed = 1;
				mask_index = idle_Mask;
			}
		}
	#endregion
	
}
	
function scr_GroundAnimationSpeed() {
	#region //Ground
		if ground && !ducking && !sliding && !airDash && !stomping && !stomped && !jumping && !railGrind && !railGrindCrouch && !dJumping && !skid && !prepare {
			if abs(vel) < 0.5 {
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
}

function scr_OtherAnimationsSpeed() {
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
		if jumping && !dJumping && !playerHurt && !rampRing && !wallJump && !afterRailJump && !railGrind && !trick && yspd < 0 {
			if !leftFacer {
				sprite_index = sprJump;
			} else {
				if face_Left {
					sprite_index = sprJumpLeft;
				} else {
					sprite_index = sprJumpRight;
				}
			}
					
			image_speed = 1;
			mask_index = idle_Mask;
		}
	#endregion
		
}

function scr_WallJumpAnimation() {
	#region //Wall-Jump
		if wallJump && !stomping && !rampRing {
			if !leftFacer {
				sprite_index = sprWallSlide;
			} else {
				if face_Left {
					sprite_index = sprWallSlideLeft;
				} else {
					sprite_index = sprWallSlideRight;
				}
			}
				
			image_speed = 1;
			mask_index = idle_Mask;
		}
	#endregion
}


function scr_HealthSystemCreate() {
	playerHurt = false;
	invincible = false;
	invincibleTimer = 0;
	invincibleFrames = 120;
	invincibleVisibleTimer = 5;
	
	attacking = false;
	megaAttacking = false;
	
	_deathY = -10;
	_deathYspd = 0.3;
	
	collide = false;
	collideTimer = 0;
	collideFrames = 30;
	
	if !instance_exists(obj_PlayerHurtJump) {
		instance_create_depth(x, y, depth, obj_PlayerHurtJump);
	}
}

function scr_HealthSystemStep() {
	if playerHurt {
		can_Move = false;
	}
	
	if ground && playerHurt && yspd > 0 {
		playerHurt = false;
		can_Move = true;
	}
	
	if !invincible {
		invincibleTimer = invincibleFrames;
		invincibleVisibleTimer = 5;
		image_alpha = 1;
		visible = true;
	} else {
		if invincibleTimer > 0 && !playerHurt && !global.Death {
			invincibleTimer -= 1;
		}
		
		if invincibleTimer <= 0 {
			invincible = false;
			invincibleTimer = invincibleFrames;
			image_alpha = 1;
			visible = true;
		}
		
		if invincibleTimer > 1 {
			if !global.SimplifyVFX {
				if invincibleVisibleTimer > 0 && !playerHurt && !global.Death {
					invincibleVisibleTimer -= 1;
				}
				
				if invincibleVisibleTimer <= 0 {
					invincibleVisibleTimer = 5;
					
					if visible {
						visible = false;
					} else {
						visible = true;
					}
				}
			} else {
				image_alpha = 0.5;
			}
		} else {
			image_alpha = 1;
		}
	}
	
	
	//Death
	if global.Health < 0 {
		global.Health = 0;
	}
	
	if global.Health <= 0 {
		global.Death = true;
	}
	
	if global.Death {
		if !leftFacer {
			x += 6 * image_xscale;
		} else {
			if !face_Left {
				x += 6;
			} else {
				x -= 6;
			}
		}
		
		_deathY += _deathYspd;
		y += _deathY;
	} else {
		_deathY = -10;
	}
}

function scr_StopPlayerHurt() {
	obj_Player.playerHurt = false;
	obj_Player.can_Move = true;
}


function scr_Deceleration() {
	if !railGrind && !sliding && !stomped {
		if vel > 0 && !right_Key {
			vel -= acc;
		} else if vel < -2 && right_Key && !skid {
			if ground {
				vel += dcc * 8;
				slowSkid = true;
			} else {
				vel += dcc;
			}
		} else {
			slowSkid = false;
		}
			
		if vel < 0 && !left_Key {
			vel += acc;
		} else if vel > 2 && left_Key && !skid {
			if ground {
				vel -= dcc * 8;
				slowSkid = true;
			} else {
				vel -= dcc;
			}
		} else {
			slowSkid = false;
		}
	}
		
	if !ground or railGrind {
		slowSkid = false;
	}
	
	if !ground && !boost {
		if yspd >= -5 && yspd < 0 && abs(vel) > max_Speed {
			if vel > 0 {
				vel -= dcc;
			} else if vel < 0 {
				vel += dcc;
			}
		}
	}
		
		
	if sliding {
		if vel > 0 {
			vel -= dcc / 4;
		} else if vel < 0 {
			vel += dcc / 4;
		}
	}
	
	//Give you a boost if you press SPACE while slowing down
	if slowSkid {
		if left_Key && action2_Key {
			if !speedBreak {
				vel = -max_Speed;
			} else {
				vel = -full_Speed;
			}
				
			obj_SFXManager.airDashSound = true;
		} else if right_Key && action2_Key {
			if !speedBreak {
				vel = max_Speed;
			} else {
				vel = full_Speed;
			}
			
			obj_SFXManager.airDashSound = true;
		}
	}
}

function scr_SpeedLimit() {
	if vel > -acc && vel < acc {
	    vel = 0;
	}
 
	if vel >= 25 {
		vel = 25;
	} else if vel <= -25 {
		vel = -25;
	}
}



//Angle Shit
function scr_AngleShitCreate() {
	groundAngle = 0;
	angleChecker = 0;
	winningAngle = 0;
	angleChecked = false;
	
	changingAngle = 0;
	increaseAngle = false;
	decreaseAngle = false;
	
	groundSpeed = 0;
	
	slopeFactor = 0.15;
	slopeFactorSlide = 0.3125;
	
	floorMode = true;
	rightWallMode = false;
	ceilingMode = false;
	leftwallMode = false;
}


function scr_AngleShitBeginStep() {
	if !sliding {
		vel -= (slopeFactor + (fric / 2)) * sin(groundAngle);
	} else {
		vel -= (slopeFactorSlide + (fric / 2)) * sin(groundAngle);
	}
}

function scr_AngleShitStep() {
	scr_HealthSystemStep();
	
	if jumping {
		if jumpinTimer > 0 {
			jumpinTimer -= 1;
		}
	} else {
		jumpinTimer = 2;
	}
	
	var _angleChecker = instance_place(x, y + 5, obj_Solid);

	if ground && instance_exists(_angleChecker) && (_angleChecker.sprite_index != spr_SolidGround or _angleChecker.sprite_index != spr_SolidRail) {
		groundAngle = _angleChecker.floorAngle;
		drawAngle = _angleChecker.angleChecking;
	} else {
		groundAngle = 0;
		drawAngle = 0;
	}
	
	
	var _winnerAngle = instance_place(x, y + 20, obj_Solid);
	
	if instance_exists(_winnerAngle) && !ground {
		winningAngle = _winnerAngle.floorAngle;
	} else if !instance_exists(_winnerAngle) {
		winningAngle = 0;
	}
	
	if !ground {
		angleChecked = false;
	}
	
	if ground {
		realJumping = false;
	}
	
	groundSpeed = vel;
	
	if !place_meeting(x + vel, y + 25, obj_Solid) {
		yspd += vel * -sin(groundAngle);
	}
}


//Manipulate jump with slopes
function scr_JumpManipulate() {
	realJumping = true;
	
	if ground {
		if isSlope or railGrindCheck {
			vel -= normalJspd * sin(degtorad(drawAngle));
			//vel += (cos(degtorad(drawAngle)) * vel) + (sin(degtorad(drawAngle)) * -normalJspd);  
			//yspd -= normalJspd * (cos(degtorad(drawAngle)) * vel);
			yspd += -(sin(degtorad(drawAngle)) * vel) + (cos(degtorad(drawAngle)) * -normalJspd);
		} else {
			if instance_exists(myFloorPlat) {
				vel += myFloorPlat.vel;
			
				if myFloorPlat.yspd < 0 {
					yspd = -normalJspd + myFloorPlat.yspd / 1.5;
				} else {
					yspd = -normalJspd;
				}
			}
		}
	} else {
		yspd = -normalJspd;
	}
	
	image_index = 0;
	
	ground = false;
	jumping = true;
}


//Variable Jumping
function scr_VariableJumping() {
	//Variable Jumping (Jump height influenced by button press)
	if yspd < 0 && realJumping && !jump_Key_Held && !afterRailJump && !rampRing && !playerHurt && !global.Death {
		yspd = max(yspd, -jspd / 4);
	}
}


//Player Movement
function scr_PlayerMoveLeft() {
	if !playerHurt {
		if !speedBreak {
			if vel > -max_Speed {
				vel -= acc;
			}
		} else {
			if !boost {
				if vel > -full_Speed {
					vel -= acc;
				}
			} else {
				if vel > -boost_Speed {
					vel -= acc;
				}
			}
		}
	}
}

function scr_PlayerMoveRight() {
	if !playerHurt {
		if !speedBreak {
			if vel < max_Speed {
				vel += acc;
			}
		} else {
			if !boost {
				if vel < full_Speed {
					vel += acc;
				}
			} else {
				if vel < boost_Speed {
					vel += acc;
				}
			}
		}
	}
}