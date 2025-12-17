function scr_SemiSolidCheck(_x, _y) {
	var _rtrn = noone;
	
	if yspd >= 0 && place_meeting(_x, _y, obj_SemiSolid) {
		var _list = ds_list_create();
		var _listSize = instance_place_list(_x, _y, obj_SemiSolid, _list, false);
		
		for(var i = 0; i < _listSize; i++) {
			var _listInst = _list[| i];
			
			if floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd) {
				_rtrn = _listInst;
				
				i = _listSize;
			}
		}
		
		ds_list_destroy(_list);
	}
	
	return _rtrn;
}

function scr_XCollision() {
	if !global.Death {
		//X Collision
	    var _subPixel = 0.5;

	    if place_meeting(x + vel, y, obj_Solid) {
			//First check if there is a slope to go up
			var _blockCheck = collision_rectangle(vel + bbox_left, y - 50, vel + bbox_right, y - 40, obj_Solid, true, true);
			
			if !_blockCheck {
				if (isSlope or railGrindCheck) {
					while(place_meeting(x + vel, y, obj_Solid)) {
						y -= _subPixel;
					}
				}
			} else { //If no slope, regular collision
				//Scoot up to wall precisely
				if !place_meeting(x + vel, y, obj_RailParent) {
					var _pixelCheck = _subPixel * sign(vel);
				
					while !place_meeting(x + _pixelCheck, y, obj_Solid) {
					   x += _pixelCheck;
					}
					
					vel = 0;
					groundSpeed = 0;
				}
			}   
		}
		
		//Slope collision
		downSlopeSemiSolid = noone;
		
		var _lineCheck = collision_rectangle(vel + bbox_left, y, vel + bbox_right, y + 85, obj_Solid, false, true);
		
		if yspd >= 0 && (isSlope or railGrindCheck) && ground && (!place_meeting(x + vel, y + 1, obj_Solid) && _lineCheck) {
			while(!place_meeting(x + vel, y + _subPixel, obj_Solid)) {
				y += _subPixel;
			}
		}
		
		x += vel;
	}
}

function scr_YCollision() {
	if !global.Death {
		#region //Other Special BS
			#region //Breakable Floor (Head)
				var _floor = instance_place(x, y + yspd + 5, obj_HeadFloorBreakable);

				if _floor {
					if stomping {
						obj_SFXManager.breakableGround = true;
						scr_ScreenShake();
						scr_ControllerRumble();
		
						scr_GivePoints(500);
		
						if global.Particles {
							instance_create_depth(_floor.x + 144, _floor.y + 80, depth, obj_HeadFloorPiece1);
							instance_create_depth(_floor.x + 149, _floor.y + 9, depth, obj_HeadFloorPiece2);
							instance_create_depth(_floor.x + 112, _floor.y + 14, depth, obj_HeadFloorPiece3);
							instance_create_depth(_floor.x + 44, _floor.y + 63, depth, obj_HeadFloorPiece4);
							instance_create_depth(_floor.x + 107, _floor.y + 23, depth, obj_HeadFloorPiece5);
							instance_create_depth(_floor.x + 116, _floor.y + 66, depth, obj_HeadFloorPiece6);
							instance_create_depth(_floor.x + 129, _floor.y + 54, depth, obj_HeadFloorPiece7);
							instance_create_depth(_floor.x + 80, _floor.y + 42, depth, obj_HeadFloorPiece8);
							instance_create_depth(_floor.x + 22, _floor.y + 22, depth, obj_HeadFloorPiece9);
							instance_create_depth(_floor.x + 5, _floor.y + 36, depth, obj_HeadFloorPiece10);
						}
		
						instance_destroy(_floor);
					}
				}
			#endregion
			
			#region //Breakable Wall (Head)
				var _floor1 = instance_place(x + vel, y, obj_HeadWallBreakable);

				if _floor1 {
					if abs(vel) >= max_Speed or boost {
						obj_SFXManager.breakableGround = true;
						scr_ScreenShake();
						scr_ControllerRumble();
		
						scr_GivePoints(500);
		
						if global.Particles {
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece1)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece2)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece3)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece4)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece5)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece6)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece7)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece8)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece9)) {
								xspd = other.vel;
							}
			
							with (instance_create_depth(_floor1.x, _floor1.y, depth, obj_HeadFloorPiece10)) {
								xspd = other.vel;
							}
						}
		
						instance_destroy(_floor1);
					}
				}
			#endregion
			
			#region //Breakable Floor (Hometown)
				var _floor2 = instance_place(x, y + yspd + 5, obj_HometownBreakable);

				if _floor2 {
					if stomping {
						obj_SFXManager.breakableGround = true;
						scr_ScreenShake();
						scr_ControllerRumble();
		
						scr_GivePoints(500);
		
						if global.Particles {
							instance_create_depth(_floor2.x, _floor2.y, depth, obj_HometownBreak1);
							instance_create_depth(_floor2.x + 10, _floor2.y + 4, depth, obj_HometownBreak2);
							instance_create_depth(_floor2.x + 38, _floor2.y, depth, obj_HometownBreak3);
							instance_create_depth(_floor2.x + 39, _floor2.y + 11, depth, obj_HometownBreak4);
						}
		
						instance_destroy(_floor2);
					}
				}
			#endregion
		#endregion
		
		//Floor Y Collision
		var _subPixel = 0.5;
		var _clampYspd = max(0, yspd);
		var _list = ds_list_create();
		var _array = array_create(0);
		
		array_push(_array, obj_Solid, obj_SemiSolid, obj_RailParent);
		
		var _listSize = instance_place_list(x, y + 5 + _clampYspd + termVel, _array, _list, false);
		
		for(var i = 0; i < _listSize; i++) {
			var _listInst = _list[| i];
			
			if _listInst != forgetSemiSolid && (_listInst.yspd <= yspd or instance_exists(myFloorPlat)) && (_listInst.yspd > 0 or place_meeting(x, y + 5 + _clampYspd, _listInst)) {
				if (_listInst.object_index == obj_Solid or object_is_ancestor(_listInst.object_index, obj_Solid)) or floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd) {
					if !instance_exists(myFloorPlat) or _listInst.bbox_top + _listInst.yspd <= myFloorPlat.bbox_top + myFloorPlat.yspd or _listInst.bbox_top + _listInst.yspd <= bbox_bottom {
						myFloorPlat = _listInst;
					}
				}
			}
		}
		
		ds_list_destroy(_list);
		
		if instance_exists(myFloorPlat) && !place_meeting(x, y + termVel, myFloorPlat) && !place_meeting(x, y + termVel / 2, myFloorPlat) && !place_meeting(x, y + termVel / 2.5, myFloorPlat) {
			myFloorPlat = noone;
			isSlope = false;
			railGrindCheck = false;
		}
		
		if instance_exists(myFloorPlat) {
			while !place_meeting(x, y + _subPixel, myFloorPlat) && !place_meeting(x, y, obj_Solid) {
				y += _subPixel;
			}
			
			if ((myFloorPlat.object_index == obj_SemiSolid or object_is_ancestor(myFloorPlat.object_index, obj_SemiSolid)) or (myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent)) && railGrindCheckingTimer <= 0) {
				if railGrind {
					if railGrindCheckingTimer <= 0 {
						while place_meeting(x, y, myFloorPlat) {
							y -= _subPixel;
						}
						
						if !angleChecked {
							if global.Squash {
								extraXscale = 1.25;
							}
							
							if winningAngle != 0 {
								vel += yspd * 0.5 * -sign(sin(winningAngle));
							}
							
							scr_Landing(footStep);
							
							angleChecked = true;
						}
						
						yspd = 0;
						wallJumpVel = 0;
						ground = true;
						jumping = false;
						dJumping = false;
						rampRing = false;
						afterRailJump = false;
					}
				} else {
					while place_meeting(x, y, myFloorPlat) {
						y -= _subPixel;
					}
					
					if !angleChecked {
						if global.Squash {
							extraXscale = 1.25;
						}
						
						if winningAngle != 0 {
							vel += yspd * 0.5 * -sign(sin(winningAngle));
						}
						
						if myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent) {
							obj_SFXManager.railGrindOn = true;
						}
						
						scr_Landing(footStep);
							
						angleChecked = true;
					}
					
					yspd = 0;
					wallJumpVel = 0;
					ground = true;
					jumping = false;
					dJumping = false;
					rampRing = false;
					afterRailJump = false;
				}
				
				isSlope = false;
				
				if railGrindCheckingTimer <= 0 {
					if myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent) {
						railGrindCheck = true;
					} else {
						railGrindCheck = false;
					}
				}
			} else {
				if railGrind {
					if railGrindCheckingTimer <= 0 {
						while place_meeting(x, y, myFloorPlat) {
							y -= _subPixel;
						}
						
						if !angleChecked {
							if global.Squash {
								extraXscale = 1.25;
							}
							
							if winningAngle != 0 {
								vel += yspd * 0.5 * -sign(sin(winningAngle));
							}
							
							scr_Landing(footStep);
							
							angleChecked = true;
						}
						
						yspd = 0;
						wallJumpVel = 0;
						ground = true;
						jumping = false;
						dJumping = false;
						rampRing = false;
						afterRailJump = false;
					}
				} else {
					while place_meeting(x, y, myFloorPlat) {
						y -= _subPixel;
					}
					
					if !angleChecked {
						if global.Squash {
							extraXscale = 1.25;
						}
						
						if winningAngle != 0 {
							vel += yspd * 0.5 * -sign(sin(winningAngle));
						}
						
						scr_Landing(footStep);
							
						angleChecked = true;
					}
					
					yspd = 0;
					wallJumpVel = 0;
					ground = true;
					jumping = false;
					dJumping = false;
					rampRing = false;
					afterRailJump = false;
				}
				
				isSlope = true;
				
				if railGrindCheckingTimer <= 0 {
					if myFloorPlat.object_index == obj_RailParent or object_is_ancestor(myFloorPlat.object_index, obj_RailParent) {
						railGrindCheck = true;
					} else {
						railGrindCheck = false;
					}
				}
			}
			
			y = floor(y);
			coyoteJumpTimer = coyoteJumpFrames;
		} else {
			ground = false;
			jumping = true;
		}
		
		if place_meeting(x, y + yspd, obj_Solid) && !place_meeting(x, y + yspd, obj_RailParent) && !ground && yspd < 0 {
			//Scoot up to wall precisely
			var _pixelCheck = _subPixel * sign(yspd);
		
			while !place_meeting(x, y + _pixelCheck, obj_Solid) {
				y += _pixelCheck;
			}
	
			//Bonk
			if yspd == 0 {
				yspd = 0;
			}
			
			yspd = 0;
		}
		
		
		#region //Old Y Collision
			/*var _subPixel = 0.5;
		
			if place_meeting(x, y + yspd, obj_Solid) && yspd > -1 {
				//Scoot up to wall precisely
				var _pixelCheck = _subPixel * sign(yspd);
		
				while !place_meeting(x, y + _pixelCheck, obj_Solid) {
					y += _pixelCheck;
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
				afterRailJump = false;
				rampRing = false;
		
			} else if place_meeting(x, y + yspd, obj_Solid) && ground == false {
				//Scoot up to wall precisely
				var _pixelCheck = _subPixel * sign(yspd);
		
				while !place_meeting(x, y + _pixelCheck, obj_Solid) {
					y += _pixelCheck;
				}
	
				//Bonk
				if yspd == 0 {
					yspd = 0;
				}
		
				yspd = 0;
			}

			//Check if touching a ground
			if place_meeting(x, y + 4, obj_Solid) && yspd > -1 {
				ground = true;
			} else {
				ground = false;
			}

			//If no ground, turn state to jumping without jumping
			if ground == false {
				jumping = true;
			}*/
		#endregion
		
		//Y position influenced by yspd variable
		y += yspd;
	
		//Gravity
		if gravTimer > 0 {
			gravTimer--;
		} else {
			yspd += grav;
		}
		
		//Terminal Velocity
		if yspd >= termVel { 
			yspd = termVel;
		}
		
		#region //Vel BS
			movePlatVel = 0;
			
			if instance_exists(myFloorPlat) {
				movePlatVel = myFloorPlat.vel;
			}
			
			if place_meeting(x + movePlatVel, y, obj_Solid) {
				var _subPixel = 0.5;
				var _pixelCheck = _subPixel * sign(movePlatVel);
				
				while !place_meeting(x + _pixelCheck, y, obj_Solid) {
					x += _pixelCheck;
				}
				
				movePlatVel = 0;
			}
			
			x += movePlatVel;
		#endregion
		
		#region //Yspd BS
			if instance_exists(myFloorPlat) && myFloorPlat.yspd != 0 {
				if myFloorPlat.yspd < 0 && place_meeting(x, y + myFloorPlat.yspd, obj_Solid) {
					if myFloorPlat.object_index == obj_SemiSolid or object_is_ancestor(myFloorPlat.object_index, obj_SemiSolid) {
						var _subPixel = 0.25;
					
						while place_meeting(x, y + myFloorPlat.yspd, obj_Solid) {
							y += _subPixel;
						}
					
						while place_meeting(x, y, obj_Solid) {
							y -= _subPixel
						}
					
						y = round(y);
					}
					
					global.Health = 0;
					global.Death = true;
				}
			}
		#endregion
		
		/*if instance_exists(myFloorPlat) && myFloorPlat.yspd != 0 {
			if !place_meeting(x, myFloorPlat.bbox_top, obj_Solid) && myFloorPlat.bbox_top >= bbox_bottom - 1 {
				y = myFloorPlat.bbox_top;
			}
		}*/
		
		#region //Special BS
			#region //Trinkets
				var _twinkLmao = instance_place(x, y, obj_Trinket);
				var _twink2 = instance_place(x, y, obj_LostTrinkets);
				
				if (_twinkLmao) && (invincibleTimer < 90 or !invincible) { //Y'know the meme
					global.Rings++;
					instance_create_depth(_twinkLmao.x + 10, _twinkLmao.y + 8, depth, obj_GOALRingSparkles);
					
					obj_SFXManager.funkinFav = true;
					obj_Timer.trinket = true;
					obj_Timer.trinketFrames = 0;
					obj_Timer.trinketScale = 1.5;
					
					with(instance_create_depth(-100000, y, -8, obj_TrinketUI)) {
						var _camX = camera_get_view_x(view_camera[0]);
						var _camY = camera_get_view_y(view_camera[0]);
						
						var _relX = _twinkLmao.x - _camX;
						var _relY = _twinkLmao.y - _camY;

						startX = _relX;
						startY = _relY;
					}
					
					instance_destroy(_twinkLmao);
				}
				
				//Lost ones
				if (_twink2) && (invincibleTimer < 90 or !invincible) { //Y'know the meme
					global.Rings++;
					instance_create_depth(_twink2.x + 10, _twink2.y + 8, depth, obj_GOALRingSparkles);
					
					obj_SFXManager.funkinFav = true;
					obj_Timer.trinket = true;
					obj_Timer.trinketFrames = 0;
					obj_Timer.trinketScale = 1.5;
					
					with(instance_create_depth(-100000, y, -8, obj_TrinketUI)) {
						var _camX = camera_get_view_x(view_camera[0]);
						var _camY = camera_get_view_y(view_camera[0]);
						
						var _relX = _twink2.x - _camX;
						var _relY = _twink2.y - _camY;

						startX = _relX;
						startY = _relY;
					}
					
					instance_destroy(_twink2);
				}
			#endregion
			
			#region //Launcher Ramp
				var _ramp = instance_place(x, y + 1, obj_Ramp);

				if _ramp && !global.Death {
					if !_ramp.launchConfirmed {
						if ground && yspd >= 0 {
							obj_SFXManager.jumpDash = true;
							_ramp.launchConfirmed = true;
	
							scr_StopPlayerHurt();
		
							beforeTrick = false;
							trick = false;
							upTrick = false;
							rightTrick = false;
							leftTrick = false;
							backTrick = false;
							altTrick = false;
							altTrickTimer = 0;
							rampRing = true;
		
							if _ramp.giveScore {
								getScore = true;
								_ramp.giveScore = false;
							}
		
							if _ramp.launchVel > 0 {
								if vel < _ramp.launchVel {
									vel = _ramp.launchVel;
								}
							} else if _ramp.launchVel < 0 {
								if vel > _ramp.launchVel {
									vel = _ramp.launchVel;
								}
							}
		
							yspd = _ramp.launchYspd;
	
							///-----Stop shit-----///
	
							//Everyone
							stomping = false;
							stomped = false;
							dJumping = false;
							sliding = false;
							ground = false;
							jumping = true;
						}
	
						scr_StopCharShit();
	
						if audio_is_playing(snd_Stomping) {
							audio_stop_sound(snd_Stomping);
						}
					}
				}
			#endregion
			
			#region //Launcher Ring
				var _launchRing = instance_place(x, y, obj_LaunchRingColl);

				if _launchRing && !global.Death {
					if !_launchRing.launchConfirmed {
						_launchRing.launchConfirmed = true;
	
						scr_StopPlayerHurt();
	
						obj_SFXManager.dashPanel = true;
	
						x = _launchRing.x + lengthdir_x(0, _launchRing.image_angle) + (_launchRing.sprite_width / 2);
						y = _launchRing.y + lengthdir_y(0, _launchRing.image_angle) + (_launchRing.sprite_height / 2);
		
						if _launchRing.giveScore {
							getScore = true;
							_launchRing.giveScore = false;
						} else {
							getScore = false;
						}
		
						beforeTrick = false;
						trick = false;
						altTrick = false;
						upTrick = false;
						rightTrick = false;
						leftTrick = false;
						backTrick = false;
						rushTrick = false;
						altFinish = false;
						altTrickTimer = 0;
		
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
		
						can_MoveFULL = true;
						preTrickTimer = preTrickFrames;
	
						///-----Stop shit-----///
	
						//Everyone
						stomping = false;
						stomped = false;
						dJumping = false;
						sliding = false;
						ground = false;
						wallJump = false;
	
						rampRing = true;
	
						vel = _launchRing.launchVel;
						yspd = _launchRing.launchYspd;
						gravTimer = _launchRing.launchFrames;
	
						scr_StopCharShit();
	
						if audio_is_playing(snd_Stomping) {
							audio_stop_sound(snd_Stomping);
						}
					}
				}
			#endregion
			
			#region //Rail-Trick Collision
				var _block = instance_place(x, y, obj_RailTrickColl);

				if _block && (action2_Key) && railGrind && !global.Death {
					yspd = -10;
					ground = false;
					jumping = true;
					rampRing = true;
					trickWait = 2;
					obj_SFXManager.trickPanel = true;
	
					if _block.giveScore {
						_block.giveScore = false;
						getScore = true;
						scr_BonusPoints(_block.bonus);
					}
				}
			#endregion
			
			#region //Boost Pad
				var _boost = instance_place(x, y, obj_BoostPad)

				if _boost && ground {
					scr_ControllerRumble();
					scr_StopCharShit();
		
					if !leftFacer {
						image_xscale = _boost.image_xscale;
					} else {
						if _boost.image_xscale == 1 {
							face_Left = false;
						} else if _boost.image_xscale == -1 {
							face_Left = true;
						}
					}
		
					if _boost.omega {
						if !_boost.soundHit {
							obj_SFXManager.boostPad = true;
							_boost.soundHit = true;
						}
				
						speedBreak = true;
			
						if _boost.image_xscale == 1 {
							if vel < full_Speed {
								vel = full_Speed;
							}
						} else if _boost.image_xscale == -1 {
							if vel > -full_Speed {
								vel = -full_Speed;
							}
						}
					} else {
						if !_boost.soundHit {
							obj_SFXManager.airDashSound = true;
							_boost.soundHit = true;
						}
					
						if _boost.image_xscale == 1 {
							if vel < max_Speed * 1.25 {
								vel = max_Speed * 1.25;
							}
						} else if _boost.image_xscale == -1 {
							if vel > -max_Speed * 1.25 {
								vel = -max_Speed * 1.25;
							}
						}
					}
				}
			#endregion
			
			#region //Springs
				var _spring = instance_place(x, y, obj_SpringParent);
			
				if _spring {
					if !_spring.active {
						obj_SFXManager.rushSpring = true;
						_spring.active = true;
						_spring.image_speed = 1;
						
						if _spring.giveScore {
							getScore = true;
							_spring.giveScore = false;
						} else {
							getScore = false;
						}
					
						scr_StopCharShit();
						scr_StopPlayerHurt();
					
						beforeTrick = false;
						trick = false;
						altTrick = false;
						altTrickTimer = 0;
						upTrick = false;
						rightTrick = false;
						leftTrick = false;
						backTrick = false;
						rushTrick = false;
						altFinish = false;
						wallJump = false;
						afterWallJump = false;
						dJumping = false;
		
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
					
						can_MoveFULL = true;
						preTrickTimer = preTrickFrames;
					
						if _spring.verti && !_spring.hori {
							yspd = _spring.launchYspd;
							rampRing = true;
							ground = false;
							jumping = true;
						} else if _spring.hori && !_spring.verti {
							vel = _spring.launchVel;
						} else if _spring.verti && _spring.hori {
							yspd = _spring.launchYspd;
							vel = _spring.launchVel;
							rampRing = true;
							ground = false;
							jumping = true;
						}
					}
				}
			#endregion
			
			#region //Trampoline
				var _tramp = instance_place(x, y, obj_Trampoline);
				
				if _tramp {
					if yspd >= 0 {
						obj_SFXManager.rushSpring = true;
						_tramp.active = true;
						_tramp.image_speed = 1;
						_tramp.image_index = 0;
						
						if _tramp.giveScore {
							getScore = true;
							_tramp.giveScore = false;
						} else {
							getScore = false;
						}
					
						scr_StopCharShit();
						scr_StopPlayerHurt();
						
						ground = false;
						jumping = true;
						dJumping = false;
						rampRing = true;
						wallJump = false;
						afterWallJump = false;
					
						beforeTrick = false;
						trick = false;
						altTrick = false;
						altTrickTimer = 0;
						upTrick = false;
						rightTrick = false;
						leftTrick = false;
						backTrick = false;
						rushTrick = false;
						altFinish = false;
		
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
					
						can_MoveFULL = true;
						preTrickTimer = preTrickFrames;
						
						if yspd < 20 {
							yspd = -(yspd + 2)
						} else {
							yspd = -25;
						}
					}
				}
			#endregion
			
			#region //Balloons
				var _balloon = instance_place(x, y, obj_Balloons);
				
				if _balloon {
					if !_balloon.popped {
						_balloon.popped = true;
						obj_SFXManager.balloonPop = true;
					
						scr_StopCharShit();
						scr_StopPlayerHurt();
						
						ground = false;
						jumping = true;
						realJumping = false;
						dJumping = false;
						airBoost = false;
					
						if _balloon.cluster {
							beforeTrick = false;
							trick = false;
							altTrick = false;
							altTrickTimer = 0;
							upTrick = false;
							rightTrick = false;
							leftTrick = false;
							backTrick = false;
							rushTrick = false;
							altFinish = false;
							rampRing = true;
							
							if _balloon.giveScore {
								_balloon.giveScore = false;
								getScore = true;
								scr_GivePoints(1000);
							} else {
								getScore = false;
							}
		
							if rushTrickFinish {
								rushTrickFinish = false;
								rushTrickCombo = 0;
							}
					
							can_MoveFULL = true;
							preTrickTimer = preTrickFrames;
							
							yspd = -9;
						} else {
							if _balloon.giveScore {
								_balloon.giveScore = false;
								getScore = true;
								scr_GivePoints(500);
							} else {
								getScore = false;
							}
							
							yspd = -7;
						}
					}
				}
			#endregion
			
			#region //Water Geyser
				var _geyser = instance_place(x, y, obj_WaterSpout);
				
				if _geyser && yspd >= 0 {
					scr_StopCharShit();
					scr_StopPlayerHurt();
					
					if _geyser.giveScore {
						_geyser.giveScore = false;
						getScore = true;
					} else {
						if yspd > 0 {
							getScore = false;
						}
					}
					
					obj_SFXManager.waterSpout = true;
					
					vel = 0;
					yspd = -15;
						
					ground = false;
					jumping = true;
					dJumping = false;
					rampRing = true;
					wallJump = false;
					afterWallJump = false;
					
					beforeTrick = false;
					trick = false;
					altTrick = false;
					altTrickTimer = 0;
					upTrick = false;
					rightTrick = false;
					leftTrick = false;
					backTrick = false;
					rushTrick = false;
					altFinish = false;
		
					if rushTrickFinish {
						rushTrickFinish = false;
						rushTrickCombo = 0;
					}
					
					can_MoveFULL = true;
					preTrickTimer = preTrickFrames;
				}
			#endregion
			
			#region //Pully
				var _pully = instance_place(x, y - 10, obj_Pully);

				if _pully {
					if !_pully.pulledDone {
						realJumping = false;
						dJumping = false;
						rampRing = false;
						afterRailJump = false;
						wallJump = false;
						afterWallJump = false;
						wallJumping = false;
						ground = false;
						jumping = true;
						
						obj_SFXManager.clench = true;
						scr_StopCharShit();
						scr_StopCharControls();
						scr_StopPlayerHurt();
		
						array_push(_pully.pulledChars, id);
		
						beforeTrick = false;
						trick = false;
						upTrick = false;
						rightTrick = false;
						leftTrick = false;
						obackTrick = false;
						rushTrick = false;
						altFinish = false;
						altTrick = false;
						altTrickTimer = 0;
		
						if rushTrickFinish {
							rushTrickFinish = false;
							rushTrickCombo = 0;
						}
			
						preTrickTimer = preTrickFrames;
						
						can_Move = false;
						can_MoveFULL = false;
						_pully.pulled = true;
					}
				}
			#endregion
			
			#region //Spikes
				var _spikeLeft = instance_place(x - 1, y, obj_Spikes);
				var _spikeRight = instance_place(x + 1, y, obj_Spikes);
				var _spikeUp = instance_place(x, y - 1, obj_Spikes);
				var _spikeDown = instance_place(x, y + 1, obj_Spikes);
				
				#region //Down
					if _spikeDown {
						if !boost && !invincible && !playerHurt && _spikeDown.image_angle == 0 {
							scr_HurtPlayer(200000, 5, 1, -7);
							obj_SFXManager.playerHurt = true;
							obj_SFXManager.spikeHurt = true;
		
							scr_StopCharShit();
							scr_StopCharControls();
	
							rampRing = false;
							afterRailJump = false;
							beforeTrick = false;
							trick = false;
							upTrick = false;
							rightTrick = false;
							leftTrick = false;
							backTrick = false;
							rushTrick = false;
							altFinish = false;
		
							if rushTrickFinish {
								rushTrickFinish = false;
								rushTrickCombo = 0;
							}
			
							can_MoveFULL = true;
							preTrickTimer = preTrickFrames;
						}
					}
				#endregion
				
				#region //Right
					if _spikeRight {
						if !boost && !invincible && !playerHurt && _spikeRight.image_angle == 90 {
							scr_HurtPlayer(200000, 5, 1, -7);
							obj_SFXManager.playerHurt = true;
							obj_SFXManager.spikeHurt = true;
		
							scr_StopCharShit();
							scr_StopCharControls();
	
							rampRing = false;
							afterRailJump = false;
							beforeTrick = false;
							trick = false;
							upTrick = false;
							rightTrick = false;
							leftTrick = false;
							backTrick = false;
							rushTrick = false;
							altFinish = false;
		
							if rushTrickFinish {
								rushTrickFinish = false;
								rushTrickCombo = 0;
							}
			
							can_MoveFULL = true;
							preTrickTimer = preTrickFrames;
						}
					}
				#endregion
				
				#region //Up
					if _spikeUp {
						if !boost && !invincible && !playerHurt && _spikeUp.image_angle == 180 {
							scr_HurtPlayer(200000, 5, 1, -7);
							obj_SFXManager.playerHurt = true;
							obj_SFXManager.spikeHurt = true;
		
							scr_StopCharShit();
							scr_StopCharControls();
	
							rampRing = false;
							afterRailJump = false;
							beforeTrick = false;
							trick = false;
							upTrick = false;
							rightTrick = false;
							leftTrick = false;
							backTrick = false;
							rushTrick = false;
							altFinish = false;
		
							if rushTrickFinish {
								rushTrickFinish = false;
								rushTrickCombo = 0;
							}
			
							can_MoveFULL = true;
							preTrickTimer = preTrickFrames;
						}
					}
				#endregion
				
				#region //Left
					if _spikeLeft {
						if !boost && !invincible && !playerHurt && _spikeLeft.image_angle == 270 {
							scr_HurtPlayer(200000, 5, 1, -7);
							obj_SFXManager.playerHurt = true;
							obj_SFXManager.spikeHurt = true;
		
							scr_StopCharShit();
							scr_StopCharControls();
	
							rampRing = false;
							afterRailJump = false;
							beforeTrick = false;
							trick = false;
							upTrick = false;
							rightTrick = false;
							leftTrick = false;
							backTrick = false;
							rushTrick = false;
							altFinish = false;
		
							if rushTrickFinish {
								rushTrickFinish = false;
								rushTrickCombo = 0;
							}
			
							can_MoveFULL = true;
							preTrickTimer = preTrickFrames;
						}
					}
				#endregion
			#endregion
			
			#region //Damage from Enemies
				var _enemy = instance_place(x, y, obj_EnemyParent);

				if _enemy {
					if !attacking && !megaAttacking && !_enemy.killed && !_enemy.launched {
						scr_HurtPlayer(_enemy.enemyDamage, 3, false, -5);
						scr_HitLag(30);
					}
				}
			#endregion
			
			#region //Dying (Bottomless)
				var _death = instance_place(x, y, obj_KillColl);

				if _death && !global.Death {
					global.Death = true;
					global.Health = 0;
					gamepad_set_vibration(0, 0, 0);
					scr_LoseTrinkets(100);
	
					if instance_exists(obj_StageTrackerSpeed) {
						global.PRank = false;
					}
	
					if rushMode {
						rushMode = false;
						boostEnergy -= 100;
						obj_SFXManager.rushModeLose = true;
					}
	
					vel = 0;
					can_Move = false;
					trick = false;
					rightTrick = false;
					leftTrick = false;
					upTrick = false;
					backTrick = false;
					beforeTrick = false;
					afterRailJump = false;
					rampRing = false;
					speedBreak = false;
	
					sprite_index = sprDeath;
	
					scr_StopCharShit();
					scr_StopCharControls();
	
					if audio_is_playing(snd_Stomping) {
						audio_stop_sound(snd_Stomping);
					}
				}
			#endregion
			
			#region //Goal Collision
				var _goal = instance_place(x, y, obj_GOALColl);

				if _goal && !global.Death {
					if !_goal.goal {
						_goal.goal = true;
						speedBreak = false;
						speedBreakTimer = speedBreakFrames;
						enemyComboTimer = 1;
	
						scr_StopCharShit();
						scr_StopCharControls();
						scr_StopPlayerHurt();
	
						with (instance_create_depth(-100000, 0, 0, obj_MoreBonus)) {
							_goal.bonus3 = 20000;
						}
	
						if vel > 0 && vel > full_Speed {
							vel = full_Speed;
		
							if !leftFacer {
								image_xscale = 1;
							} else {
								face_Left = false;
							}
						} else if vel < 0 && vel < -full_Speed {
							vel = -full_Speed;
		
							if !leftFacer {
								image_xscale = -1;
							} else {
								face_Left = true;
							}
						}
	
						can_Move = false;
	
						set_song_ingame(noone, 180, 0);
	
						if ground {
							obj_SFXManager.slideSound = true;
						}
					}
				}
			#endregion
			
			#region //Damage Hazard Beam
				var _beam = instance_place(x, y, obj_HeadBeamHazard)
			
				if _beam && !invincible && !playerHurt {
					var _dir = 1;
			
					if vel >= 0 {
						_dir = -1;
					} else {
						_dir = 1;
					}
			
					scr_HurtPlayer(200000, _dir * 3, false, -6);
				}
			#endregion
		#endregion
	}
}



function scr_Landing(_type = "hard") {
	if global.Footstep {
		if _type == "grass" {
			obj_SFXManager.landGrass = true;
		} else {
			obj_SFXManager.landHard = true;
		}
	}
	
	if global.Particles {
		if stomping {
			scr_StompedVFX();
		}
		
		instance_create_depth(x, y + 21, depth, obj_SlideDustVFX);
		instance_create_depth(x + 7, y + 21, depth, obj_SlideDustVFX);
		instance_create_depth(x - 17, y + 21, depth, obj_SlideDustVFX);
		instance_create_depth(x - 24, y + 21, depth, obj_SlideDustVFX);
	}
}


//Rail-Grind
function scr_RailGrindCreate() {
	railGrind = false;
	railGrindCrouch = false;
	railGrindFloor = noone;
	railGrindCheckingTimer = 0;
	railGrindCheckingFrames = 15;
	
	forgetSemiSolid = noone;
	
	afterRailJump = 0;
	afterRailJumpTimer = 0;
	afterRailJumpFrames = 10;
}

function scr_RailGrindingStep() {
	if railGrindCheckingTimer > 0 {
		railGrindCheckingTimer -= 1;
	}
	
	if !global.Death {
		if instance_exists(obj_RailParent) {
			var _list = ds_list_create();
			var _array = array_create(0);
			
			array_push(_array, obj_RailParent);
			
			var _collision = instance_place_list(x, y + 1, _array, _list, false);
			var _collision2 = instance_place(x, y + 1, obj_RailParent);
			
			for(var i = 0; i < _collision; i++) {
				var _listInst = _list[| i];
				
				if (_listInst.yspd < yspd or instance_exists(railGrindFloor)) && (_listInst.yspd > 0 or place_meeting(x, y + 1, _listInst)) {
					if (_listInst.object_index == obj_RailParent or object_is_ancestor(_listInst.object_index, obj_RailParent)) or floor(bbox_bottom) <= ceil(_listInst.bbox_top - _listInst.yspd) {
						if !instance_exists(railGrindFloor) or _listInst.bbox_top + _listInst.yspd <= railGrindFloor.bbox_top + railGrindFloor.yspd or _listInst.bbox_top + _listInst.yspd <= bbox_bottom {
							if railGrindCheckingTimer <= 0 {
								railGrindFloor = _listInst;
							}
						}
					}
				}
			}
			
			ds_list_destroy(_list);
		
			if instance_exists(railGrindFloor) && ground && railGrindCheck && yspd >= 0 {
				railGrind = true;
				
				if !leftFacer {
					if vel == 0 {
						vel = 3 * image_xscale;
					}
				} else {
					if !face_Left && vel == 0 {
						vel = 3;
					} else if face_Left && vel == 0 {
						vel = -3;
					}
				}
			} else {
				railGrind = false;
				railGrindCrouch = false;
			}
			
			if instance_exists(railGrindFloor) && !place_meeting(x, y + 1, railGrindFloor) {
				railGrindFloor = noone;
			}
		}
		
		if railGrind {
			obj_SFXManager.railGrinding = true;
			
			jumping = false;
			dJumping = false;
			sliding = false;
			stomped = false;
			afterRailJump = false;
			
			var _accAlt = (slopeFactor + acc) * sin(groundAngle);
			
			if !speedBreak {
				if vel > 0 && vel < max_Speed && right_Key {
					vel += acc;
				} else if vel < 0 && vel > -max_Speed && left_Key {
					vel -= acc;
				}
			} else {
				if !boost {
					if vel > 0 && vel < full_Speed && right_Key {
						vel += acc;
					} else if vel < 0 && vel > -full_Speed && left_Key {
						vel -= acc;
					}
				} else {
					if vel > 0 && vel < boost_Speed && right_Key {
						vel += acc;
					} else if vel < 0 && vel > -boost_Speed && left_Key {
						vel -= acc;
					}
				}
			}

			
			if !leftFacer {
				if vel > 0 {
					image_xscale = 1;
				} else if vel < 0 {
					image_xscale = -1;
				}
			} else {
				if vel > 0 {
					face_Left = false;
				} else if vel < 0 {
					face_Left = true;
				}
			}
			
		} else {
			if audio_is_playing(snd_RushRailGrindOn) {
				audio_stop_sound(snd_RushRailGrindOn);
			}
			
			obj_SFXManager.railGrinding = false;
		}
		
		//Shit for ramps and rings
		if rampRing {
			beforeTrick = true;
			afterRailJump = false;
		}
		
		
		if railGrind {
			if down_Key {
				railGrindCrouch = true;
			} else {
				railGrindCrouch = false;
			}
		} else {
			railGrindCrouch = false;
		}
	}
}


//Wall Cling
function scr_WallClingCreate() {
	wallJump = false;
	afterWallJump = false;
	wallJumping = false;
	onWall = 0;
	
	gravTimer = 0;
	
	wallJumpVel = 6;
	
	canWallJump = false;
	
	facingLeft = 1;
	extraRealX = 12; //Idk why the fuck I named it this
}

function scr_WallClingStep() {
	var _collisionGet = obj_Solid;
	var _wall = instance_place(x, y, _collisionGet);
	onWall = place_meeting(x + 1, y, _collisionGet) - place_meeting(x - 1, y, _collisionGet);
	
	if onWall == 1 {
		_wall = instance_place(x + 1, y, _collisionGet);
	} else if onWall == -1 {
		_wall = instance_place(x - 1, y, _collisionGet);
	} else {
		_wall = instance_place(x, y, _collisionGet);
	}
		
	if !global.Death && !playerHurt {
		if onWall != 0 && !ground && yspd >= -3 {
			if _wall {
				canWallJump = _wall.wallJumpable;
			}
				
			if canWallJump && action4_Key_Held {
				if !wallJump {
					if yspd > 0 {
						yspd = 0;
					}
					
					wallJump = true;
					obj_SFXManager.clench = true;
				}
				
				afterWallJump = false;
					
				if !leftFacer {
					if onWall {
						image_xscale = -1;
					} else if !onWall {
						image_xscale = 1;
					}
				} else {
					if onWall {
						face_Left = true;
					} else if -onWall {
						face_Left = false;
					}
				}
			}
		} else if onWall == 0 {
			wallJump = false;
			afterWallJump = false;
		}
	}
}


function scr_CeilingDetect() {
	var _ceilingDetect = collision_point(x, y - 10, obj_Solid, true, true);
	
	if _ceilingDetect && ground && !jumping {
		collide = true;
	} else {
		collide = false;
	}
	
	if collide {
		collideTimer = collideFrames;
	}
	
	if ground && collideTimer > 0 {
		if !railGrind {
			if vel != 0 {
				sliding = true;
			} else {
				ducking = true;
			}
		} else {
			railGrindCrouch = true;
		}
	}
	
	if collideTimer > 0 && !collide && railGrind {
		collideTimer -= 1;
	}
	
	if action2_Key && !collide && collideTimer > 0 && !railGrind {
		collideTimer = 0;
	}
	
	if !railGrind && !collide {
		collideTimer = 0;
	}
	
	
	//Fail-Safe if ceiling collides with idle mask while sliding
	if collide && sliding && vel > 0 {
		vel += dcc / 4;
	} else if collide && sliding && vel < 0 {
		vel -= dcc / 4;
	}
}

