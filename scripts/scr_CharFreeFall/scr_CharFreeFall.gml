function scr_FreeFallCreate() {
	#region //Char
		can_Move = true;
		can_MoveFULL = true;
		vel = 0;
		yspd = 0;
		dontCollide = false;
		_deathY = -7;
		
		drawAngle = 0;
		visXScale = -1;
		leftFacer = false;
		face_Left = true;
		
		moveSpd = 5;
		dashSpd = 10;
		dir = 0;
		
		fallDash = false;
		fallDashTimer = 0;
		fallDashFrames = 15;
		
		playerHurt = false;
		fakeHurt = false;
		hurtTimer = 0;
		hurtFrames = 180;
		flashTimer = 10;
		
		hitStopped = false;
		hitStopTimer = 0;
		
		attacking = false;
		megaAttacking = false;
		
		afterImageTimer = 0;
		afterImageFrames = 7;
		
		savedIndex = 5;
		increDepth = 1;
		
		sonicRush = false;
		blazeRush = false;
		
		mask_index = idle_Mask;
		image_yscale = -1;
		image_speed = 2;
	#endregion
	
	#region //Controls
		scr_ControlSpeedCreate();
	#endregion
	
	#region //Random Bullshit Go
		if !instance_exists(obj_CreatePauseSpeed) {
			instance_create_depth(-100000, 0, -9, obj_CreatePauseSpeed);
		}
	
		rushMode = true;
		rushModeTimer = 0;
		rushModeFrames = 0;
		speedBreak = false;
		speedBreakTimer = 0;
		speedBreakFrames = 0;
		stomping = false;
		fallVel = 30;
		terrainLayer = 0;
		
		enemyCombo = 0;
		enemyComboTimer = 0;
		enemyComboFrames = 300;
	#endregion
}

function scr_FreeFallControl() {
	//Collision Mask
	mask_index = idle_Mask;
	attacking = fallDash;
	
	//Death
	if global.Health <= 0 {
		global.Health = 0;
		global.Death = true;
	}
	
	if global.Death {
		if !leftFacer {
			x += 4 * visXScale;
		} else {
			if !face_Left {
				x += 4;
			} else {
				x -= 4;
			}
		}
		
		_deathY += 0.25;
		y += _deathY;
	} else {
		_deathY = -7;
	}
	
	//Hitstop
	if !global.Death {
		if hitStopped {
			if hitStopTimer > 0 {
				can_MoveFULL = false;
				hitStopTimer--;
				image_speed = 0;
			} else {
				hitStopped = false;
				can_MoveFULL = true;
				image_speed = 2;
			}
		}
	}
	
	//After-Images
	if afterImageTimer > 0 {
		afterImageTimer--;
	} else {
		afterImageTimer = afterImageFrames;
		
		with(instance_create_depth(x, y, depth + 1, obj_FallinAfterImage)) {
			charID = other.id;
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_xscale = other.visXScale;
			image_yscale = other.image_yscale;
			image_angle = other.drawAngle;
		}
		
		if !fallDash && !global.SimplifyVFX && !playerHurt && !global.Death {
			with(instance_create_depth(x, y, depth - 1 - other.increDepth, obj_SRExceptionAura)) {
				savedChar = other.id;
				image_blend = global.fullRGB;
				image_angle = -90;
				image_index = other.savedIndex;
				moveY = true;
				other.increDepth++;
				
				if other.savedIndex < 5 {
					other.savedIndex++;
				} else {
					other.savedIndex = 0;
				}
			}
		}
	}
	
	if can_MoveFULL {
		//Get Controls
		if can_Move {
			getCharacterControls();
		} else {
			scr_ControlSpeedCreate();
		}
		
		if right_Key {
			if leftFacer {
				face_Left = true;
			} else {
				visXScale = 1;
			}
		} else 
		
		if left_Key {
			if leftFacer {
				face_Left = false;
			} else {
				visXScale = -1;
			}
		}
	
		//Movement
		if !fallDash {
			if playerHurt && hurtTimer > 150 {
				vel = 0;
				yspd = 0;
			} else {
				var _half = 1;
				
				if action_Key_Held {
					_half = 0.5;
				}
				
				vel = (right_Key - left_Key) * (moveSpd * _half);
				yspd = (down_Key - up_Key) * (moveSpd * _half);
			}
		} else {
			var _moveDawgX = 0;
			var _moveDawgY = 0;
		
			if fallDashTimer > 0 {
				fallDashTimer--;
			} else if fallDashTimer <= 0 or playerHurt {
				fallDash = false;
			}
		
			switch(dir) {
				case 0:
					_moveDawgX = dashSpd;
				break;
			
				case 1:
					_moveDawgX = dashSpd;
					_moveDawgY = dashSpd;
				break;
			
				case 2:
					_moveDawgY = dashSpd;
				break;
			
				case 3:
					_moveDawgX = -dashSpd;
					_moveDawgY = dashSpd;
				break;
			
				case 4:
					_moveDawgX = -dashSpd;
				break;
			
				case 5:
					_moveDawgX = -dashSpd;
					_moveDawgY = -dashSpd;
				break;
			
				case 6:
					_moveDawgY = -dashSpd;
				break;
			
				case 7:
					_moveDawgX = dashSpd;
					_moveDawgY = -dashSpd;
				break;
			}
			
			vel = _moveDawgX;
			yspd = _moveDawgY;
		}
	
		//Falling Air-Dash
		if (jump_Key or action1_Key) && !fallDash && (!playerHurt or hurtTimer < 120) {
			image_index = 0;
			fallDash = true;
			fallDashTimer = fallDashFrames;
			obj_SFXManager.jumpDash = true;
			scr_ControllerRumble()
		
			//Get Direction
			var _angle = 0;
		
			//Right
			if right_Key && (!up_Key && !down_Key) {
				dir = 0;
				_angle = 90;
			}
		
			//Down-Right
			if right_Key && down_Key {
				dir = 1;
				_angle = 45;
			}
		
			//Down
			if down_Key && (!left_Key && !right_Key) {
				dir = 2;
			}
		
			//Down-Left
			if left_Key && down_Key {
				dir = 3;
				_angle = -45;
			}
		
			//Left
			if left_Key && (!up_Key && !down_Key) {
				dir = 4;
				_angle = -90;
			}
		
			//Up-Left
			if left_Key && up_Key {
				dir = 5;
				_angle = -135;
			}
		
			//Up
			if up_Key && (!left_Key && !right_Key) {
				dir = 6;
				_angle = 180;
			}
		
			//Up-Right
			if right_Key && up_Key {
				dir = 7;
				_angle = -225;
			}
			
			if !right_Key && !left_Key && !up_Key && !down_Key {
				if leftFacer {
					if face_Left {
						dir = 0;
						_angle = 90;
					} else {
						dir = 4;
						_angle = -90;
					}
				} else {
					if visXScale == 1 {
						dir = 0;
						_angle = 90;
					} else {
						dir = 4;
						_angle = -90;
					}
				}
			}
			
			if instance_exists(obj_SRExceptionAura) {
				obj_SRExceptionAura.image_xscale = 1;
				obj_SRExceptionAura.image_yscale = 1;
				
			}
			
			with(instance_create_depth(x, y + 16, depth - 1, obj_RushBoostBreak)) {
				image_angle = _angle;
				sprite_index = other.stompedSprite;
			}
		}
	
		//Collision
		if !dontCollide {
			if place_meeting(x + vel, y, obj_Solid) {
				vel = 0;
			}

			if place_meeting(x, y + yspd, obj_Solid) {
				yspd = 0;
			}
			
			#region //Trinkets
				var _twinkList = ds_list_create();
				var _twinkLmao = instance_place_list(x, y, obj_Trinket, _twinkList, false);
				
				var _twink2List = ds_list_create();
				var _twink2 = instance_place_list(x, y, obj_LostTrinkets, _twink2List, false);
				
				if _twinkLmao > 0 && (hurtTimer < 90 or !playerHurt) { //Now the meme doesn't make sense
					for(var i = 0; i < _twinkLmao; i++) {
						global.Rings++;
						instance_create_depth(_twinkList[| i].x + 10, _twinkList[| i].y + 8, depth, obj_GOALRingSparkles);
					
						obj_SFXManager.funkinFav = true;
						
						if instance_exists(obj_Timer) {
							obj_Timer.trinket = true;
							obj_Timer.trinketFrames = 0;
							obj_Timer.trinketScale = 1.5;
						}
					
						with(instance_create_depth(-100000, y, -8, obj_TrinketUI)) {
							var _camX = camera_get_view_x(view_camera[0]);
							var _camY = camera_get_view_y(view_camera[0]);
						
							var _relX = _twinkList[| i].x - _camX;
							var _relY = _twinkList[| i].y - _camY;

							startX = _relX;
							startY = _relY;
						}
					
						instance_destroy(_twinkList[| i]);
					}
				}
				
				ds_list_destroy(_twinkList);
				
				//Lost ones
				if _twink2 > 0 && (hurtTimer < 90 or !playerHurt) {
					for(var i = 0; i < _twink2; i++) {
						global.Rings++;
						instance_create_depth(_twink2List[| i].x + 10, _twink2List[| i].y + 8, depth, obj_GOALRingSparkles);
					
						obj_SFXManager.funkinFav = true;
						
						if instance_exists(obj_Timer) {
							obj_Timer.trinket = true;
							obj_Timer.trinketFrames = 0;
							obj_Timer.trinketScale = 1.5;
						}
						
						with(instance_create_depth(-100000, y, -8, obj_TrinketUI)) {
							var _camX = camera_get_view_x(view_camera[0]);
							var _camY = camera_get_view_y(view_camera[0]);
						
							var _relX = _twink2List[| i].x - _camX;
							var _relY = _twink2List[| i].y - _camY;

							startX = _relX;
							startY = _relY;
						}
					
						instance_destroy(_twink2List[| i]);
					}
				}
				
				ds_list_destroy(_twink2List);
			#endregion
		}
	
		//Actually Move
		if can_MoveFULL {
			x += vel;
			y += yspd;
		}
	
		//Getting Hurt
		if fakeHurt {
			if hurtTimer > 0 {
				hurtTimer--;
				
				if hurtTimer < 150 {
					playerHurt = false;
				}
				
				if global.SimplifyVFX {
					image_alpha = 0.5;
				}
			
				if flashTimer > 0 {
					flashTimer--;
				} else {
					if !global.SimplifyVFX {
						visible = !visible;
					}
					
					flashTimer = 10;
				}
			} else {
				flashTimer = 10;
				hurtTimer = hurtFrames;
				fakeHurt = false;
				visible = true;
				image_alpha = 1;
			}
		} else {
			flashTimer = 10;
			hurtTimer = hurtFrames;
			fakeHurt = playerHurt;
		}
	}
	
	//Take Damage
	var _proj = instance_place(x, y, obj_HurtParent);
	
	if _proj && !fakeHurt {
		if _proj.canHurt {
			if _proj.canBoost {
				if !fallDash {
					scr_FreeFallHurt(_proj.damage, true, false);
					scr_ControllerRumble();
					scr_ScreenShake();
				}
			} else {
				scr_FreeFallHurt(_proj.damage, true, false);
				scr_ControllerRumble();
				scr_ScreenShake();
			}
		}
		
		if _proj.killProj {
			instance_destroy(_proj);
		}
	}
	
	if (!fakeHurt or hurtTimer < 120) && !global.Death {
		scr_PlayerToEnemyShit();
	}
	
	if enemyComboTimer > 0 {
		enemyComboTimer--;
	} else {
		with(obj_EnemyComboCounterSpeed) {
			if !createBonus {
				createBonus = true;
				scr_BonusPoints((500 * other.enemyCombo) * mult);
				other.enemyCombo = 0;
			}
		}
	}
}
	
function scr_FreeFallAnimation() {
	if playerHurt {
		if !global.Death {
			if !leftFacer {
				sprite_index = sprSpiral;
			} else {
				if face_Left {
					sprite_index = sprSpiralLeft;
				} else {
					sprite_index = sprSpiralRight;
				}
			}
			
			image_speed = 1;
		} else {
			image_speed = 0.5;
		}
	} else {
		if !fallDash {
			if !leftFacer {
				sprite_index = sprFreeFall;
			} else {
				if face_Left {
					sprite_index = sprFreeFallLeft;
				} else {
					sprite_index = sprFreeFallRight;
				}
			}
		} else {
			if !leftFacer {
				sprite_index = sprFallDash;
			} else {
				if face_Left {
					sprite_index = sprFallDashLeft;
				} else {
					sprite_index = sprFallDashRight;
				}
			}
		}
		
		image_speed = 2;
	}
}

function scr_FreeFallDraw() {
	var _change = 1;
	var _change2 = 2;
	var _col1 = c_white;
	var _col2 = c_black;
	
	if global.MIND or global.PlayerChar == 0 {
		_col1 = c_black;
		_col2 = c_white;
	}
	
	if global.Outline {
		gpu_set_fog(true, _col2, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change2, round(y), visXScale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change2, round(y), visXScale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change2, visXScale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change2, visXScale, image_yscale, drawAngle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	
		gpu_set_fog(true, _col1, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change, round(y), visXScale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change, round(y), visXScale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change, visXScale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change, visXScale, image_yscale, drawAngle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	}
	
	#region //Shader Shit
		shader_set(shd_PaletteSwap);
			var _target = shader_get_sampler_index(shd_PaletteSwap, "samp_target");
			var _replace = shader_get_sampler_index(shd_PaletteSwap, "samp_replace");
			
			texture_set_stage(_target, sprite_get_texture(basePal, 0));
			texture_set_stage(_replace, sprite_get_texture(headPal, 0))
			
			draw_sprite_ext(sprite_index, image_index, round(x), round(y), visXScale, image_yscale, drawAngle, image_blend, image_alpha);
		shader_reset();
	#endregion
}

function scr_FreeFallHurt(_damage = 100000, _ringsFly = true, _ignore = false) {
	if !fakeHurt {
		if object_index == global.PlayerID {
			var _ringMult = 1;
	
			if instance_exists(obj_StageTrackerSpeed) && !_ignore {
				if global.Rings >= 50 {
					_ringMult = 2;
				}
			}
		
			global.Health -= _damage / _ringMult;
		
			if _ringsFly {
				scr_LoseTrinkets();
			}
			
			if enemyCombo > 0 {
				enemyCombo = 0;
			}
		
			scr_BonusPoints(-5000 * (_damage / 100000));
		}
		
		playerHurt = true;
		fakeHurt = true;
		obj_SFXManager.playerHurt = true;
		obj_SFXManager.lightHit = true;
		
		scr_HitStop();
		scr_ScreenShake();
		scr_ControllerRumble();
	}
}