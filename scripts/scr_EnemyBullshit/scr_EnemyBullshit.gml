function scr_EnemyCreate() {
	charKiller = global.PlayerID;
	
	enemyHealth = 100;
	enemyType = 1;
	enemyDamage = 100;
	enemySonicDeath = true;
	enemyKnockback = 3;
	enemyKnockbackY = -3;
	
	particleDeath = obj_HeadParticleDeath;
	particleAmount = 10;
	
	invincible = false;
	invincibilityTimer = 0;
	invincibilityFrames = 120;
	
	launched = false;
	launchedTimer = 30;
	
	killed = false;
	killedTimer = 180;
	
	_hitLag = 0;
	
	vel = 0;
	yspd = 0;
}

function scr_EnemyStep() {
	var _touchedPlayer = instance_place(x, y, obj_Player);
	
	//Kys *LowTierGod lightning image*
	if launched {
		if launchedTimer > 0 {
			launchedTimer -= 1;
		}
		
		if launchedTimer <= 0 {
			launched = false;
		}
	}
	
	if enemyHealth < 0 {
		enemyHealth = 0;
	}
	
	if enemyHealth <= 0 {
		if !enemySonicDeath {
			if !launched {
				if global.Particles {
					scr_EnemyDeathParticles(particleDeath, particleAmount);
				}
				
				scr_ScreenShake();
				scr_ControllerRumble();
					
				obj_Player.enemyCombo += 1;
				obj_Player.enemyComboTimer = obj_Player.enemyComboFrames;
				obj_EnemyComboCounterSpeed.sizeChange = 1.3;
					
				if instance_exists(obj_GOALColl) {
					if !obj_GOALColl.goal {
						if obj_Player.enemyCombo < 4 {
							scr_EnergyPlayer(10, charKiller);
						} else {
							scr_EnergyPlayer(10 * charKiller.enemyCombo / 4, charKiller);
						}
					}
				} else {
					if !global.FreeFall {
						if obj_Player.enemyCombo < 4 {
							scr_EnergyPlayer(10, charKiller);
						} else {
							scr_EnergyPlayer(10 * charKiller.enemyCombo / 4, charKiller);
						}
					}
				}
				
				scr_GivePoints(100 * obj_Player.enemyCombo);
				
				if instance_exists(obj_Timer) {
					global.EnemyCount++;
				}
				
				if instance_exists(obj_EnemyCounter) {
					obj_EnemyCounter.enemyCount--;
					obj_EnemyCounter.textScale += 0.5;
				}
				
				if global.FreeFall {
					global.EnemyCountCheck++;
				}
				
				instance_destroy();
				obj_SFXManager.UndertaleDamage = true;
			}
		} else {
			if !launched {
				obj_SFXManager.playerDeath = true;
			}
		}
	}
	
	
	if launched && !killed {
		killed = true;
		vel = charKiller.vel;
		yspd = -1;
	}
	
	if launched {
		if vel > 0 {
			image_angle -= 1 * abs(vel);
		} else if vel < 0 {
			image_angle += 1 * abs(vel);
		}
	}
	
	x += vel;
	y += yspd;
}

function scr_PlayerToEnemyShit() {
	var _tojiList = ds_list_create();
	var _toji = instance_place_list(x, y, obj_EnemyParent, _tojiList, false);
	
	var _stompedVFX = instance_find(obj_StompVFX, 0);
	var _boostBreakVFX = instance_find(obj_RushBoostBreak, 0);
	
	if _stompedVFX != noone {
		with(_stompedVFX) {			
			var _toji2 = instance_place(x, y, obj_EnemyParent);
		
			if _toji2 && image_index >= 2 {
				if !_toji2.launched {
					_toji2.charKiller = other.id;
					
					scr_ScreenShake(0.5, 10, true, true);
					scr_ControllerRumble();
					scr_HitStop(true, 1);
					
					scr_DRDamageNumbers(-_toji2.enemyHealth, _toji2.x, _toji2.y);
					_toji2.enemyHealth -= _toji2.enemyHealth;
					obj_SFXManager.UndertaleDamage = true;
				}
			}
		}
	}
	
	if _boostBreakVFX != noone {
		with(_boostBreakVFX) {
			var _toji2 = instance_place(x, y, obj_EnemyParent);
		
			if _toji2 {
				if !_toji2.launched {
					_toji2.charKiller = other.id;
					
					scr_ScreenShake(0.5, 10, true, true);
					scr_ControllerRumble();
					scr_HitStop(true, 1);
		
					scr_DRDamageNumbers(-_toji2.enemyHealth, _toji2.x, _toji2.y);
					_toji2.enemyHealth -= _toji2.enemyHealth;
					obj_SFXManager.UndertaleDamage = true;
				}
			}
		}
	}
	
	if _toji > 0 {
		for(var i = 0; i < _toji; i++) {
			//If not attacking
			if !attacking && !megaAttacking {
				if !_tojiList[| i].launched {
					if !global.FreeFall {
						if !playerHurt {
							scr_DRDamageNumbers(-_tojiList[| i].enemyDamage, x, y);
							scr_HurtPlayer(_tojiList[| i].enemyDamage, _tojiList[| i].enemyKnockback, false, _tojiList[| i].enemyKnockbackY - 2);
						}
					} else {
						if !fakeHurt {
							scr_DRDamageNumbers(-_tojiList[| i].enemyDamage, x, y, 120);
						}
						
						scr_FreeFallHurt(_tojiList[| i].enemyDamage, true);
					}
				}
			} else if attacking or megaAttacking { //If attacking
				if !playerHurt && !global.Death && !_tojiList[| i].launched {
					_tojiList[| i].charKiller = id;
				
					if attacking {
						scr_ScreenShake(0.5, 10, true, true);
						scr_ControllerRumble();
						scr_HitStop(true, 1);
						
						if jumping && yspd > 0 && !stomping && !fallVel {
							if realJumping {
								if jump_Key_Held {
									yspd = -yspd - 1;
								} else {
									yspd = -3;
								}
							} else {
								yspd = -yspd - 1;
							}
						}
						
						scr_DRDamageNumbers(-_tojiList[| i].enemyHealth, _tojiList[| i].x, _tojiList[| i].y);
						_tojiList[| i].enemyHealth -= _tojiList[| i].enemyHealth;
						obj_SFXManager.UndertaleDamage = true;
					} else if megaAttacking {
						scr_ScreenShake(1, 20, true, false);
						scr_ControllerRumble(0.25, 20);
						scr_HitStop(true, 3);
						
						scr_DRDamageNumbers(-_tojiList[| i].enemyHealth, _tojiList[| i].x, _tojiList[| i].y);
						_tojiList[| i].launched = true;
						_tojiList[| i].enemyHealth -= _tojiList[| i].enemyHealth;
						obj_SFXManager.enemyExplode = true;
					}
				}
			}
		}
	}
	
	ds_list_destroy(_tojiList);
}

function scr_EnemyDeathParticles(_particle, _amount) {
	var _partAmount = _amount;
	
	if _partAmount > 0 {
		if global.Particles {
			repeat(3) {
				scr_DRFountainSmoke(x, y, depth - 5, random_range(-3, 3), random_range(0.05, 0.25), c_black, c_white, 15, 0.05, 30);
			}
		}
			
		_partAmount -= 1;
	}
}

function scr_EnemySpawn(_health, _type, _damage, _enemy, _sonicDeath) {
	with (instance_create_depth(x, y, depth, _enemy)) {
		enemyHealth = _health;
		enemyType = _type;
		enemyDamage = _damage;
		enemySonicDeath = _sonicDeath;
	}
	
	instance_destroy();
}





//Stop Char Shit
function scr_StopCharShit() {
	//All Chars
	obj_Player.stomping = false
	obj_Player.stomped = false;
	obj_Player.sliding = false;
	obj_Player.wallJump = false;
	obj_Player.wallJumping = false;
	obj_Player.afterWallJump = false;
	obj_Player.rushTrickScore = 0;
	
	obj_TrickScore.trickScore = 0;
	obj_TrickScore.extraScore = 0;
	obj_TrickScore.visible = false;
	obj_TrickScore.comboTimer = 0;
	
	//Kappa
	if instance_exists(obj_KappaHeadSpeed) or instance_exists(obj_KappaSpeed) {
		obj_Player.airDash = false;
	}
	
	
	//Sarah
	if instance_exists(obj_SarahSpeed) {
		obj_Player.hover = false;
		obj_Player.sideWallJump = false;
		obj_Player.stompingTimer = obj_Player.stompingFrames;
		obj_Player.normalStomp = false;
		obj_Player.omegaStomp = false;
		obj_Player.omegaStompingTimer = 0;
	}
	
	
	//Rush
	if instance_exists(obj_RushSpeed) {
		obj_Player.homing_Active = false;
		obj_Player.homingAttacked = false;
		obj_Player.preStomp = false;
		obj_Player.preStompTimer = obj_Player.preStompFrames;
		obj_Player.dropdash = false;
		obj_Player.dropdashing = false;
		obj_Player.spindash = false;
		obj_Player.spindashRev = false;
		obj_Player.spindashTimer = 0;
		obj_Player.superPeelout = false;
		obj_Player.superPeeloutTimer = 0;
	}
	
	
	//Ivy
	if instance_exists(obj_IvySpeed) {
		obj_Player.shootAir = false;
		obj_Player.shootGround = false;
		obj_Player.hShootWeak = false;
		obj_Player.hShoot = false;
		obj_Player.preStomp = false;
	}
}