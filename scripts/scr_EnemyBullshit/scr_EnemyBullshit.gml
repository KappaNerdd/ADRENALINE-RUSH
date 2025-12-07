function scr_EnemyCreate() {
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
	
	if enemyHealth > 0 && (place_meeting(x, y, obj_StompVFX) or place_meeting(x, y, obj_StompingVFX) or place_meeting(x, y, obj_RushBoostBreak)) {
		enemyHealth -= enemyHealth;
		obj_SFXManager.enemyExplode = true;
		
		scr_ScreenShake();
		scr_ControllerRumble();
	}
	
	if _touchedPlayer && (!killed && !launched && enemyHealth > 0) {
		if (_touchedPlayer.attacking && !_touchedPlayer.playerHurt) {
			enemyHealth -= enemyHealth;
			obj_SFXManager.UndertaleDamage = true;
			
			scr_ScreenShake();
			scr_ControllerRumble();
			
			if _touchedPlayer.jumping {
				if _touchedPlayer.yspd > 0 {
					if _touchedPlayer.jump_Key_Held {
						_touchedPlayer.yspd = -_touchedPlayer.yspd + 1;
					} else {
						_touchedPlayer.yspd = -2;
					}
				}
			}
			
			_hitLag = 30;
			
		} else if _touchedPlayer.megaAttacking && !_touchedPlayer.playerHurt {
			obj_SFXManager.enemyExplode = true;
			
			if !launched {
				launched = true;
				enemyHealth -= enemyHealth;
				
				scr_ScreenShake();
				scr_ControllerRumble();
			}
			
			_hitLag = 15;
		}
	}
	
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
					
				obj_Player.enemyCombo += 1;
				obj_Player.enemyComboTimer = obj_Player.enemyComboFrames;
				obj_EnemyComboCounterSpeed.sizeChange = 1.3;
					
				if instance_exists(obj_GOALColl) {
					if !obj_GOALColl.goal {	
						if obj_Player.enemyCombo == 0 {
							obj_Player.boostEnergy += 10;
						} else {
							obj_Player.boostEnergy += 10 * obj_Player.enemyCombo / 4;
						}
					}
				
					if obj_Player.rushMode && !obj_GOALColl.goal {
						obj_SFXManager.rushModeTrick = true;
						obj_Player.rushModeTimer = obj_Player.rushModeFrames;
					}
				} else {
					if obj_Player.enemyCombo == 0 {
						obj_Player.boostEnergy += 10;
					} else {
						obj_Player.boostEnergy += 10 * obj_Player.enemyCombo / 4;
					}
				
				if obj_Player.rushMode {
						obj_SFXManager.rushModeTrick = true;
						obj_Player.rushModeTimer = obj_Player.rushModeFrames;
					}
				}
				
				scr_GivePoints(100 * obj_Player.enemyCombo);
				
				if instance_exists(obj_StageTrackerSpeed) {
					global.EnemyCount += 1;
				}
				
				instance_destroy();
				obj_SFXManager.UndertaleDamage = true;
			}
		} else {
			if !launched {
				obj_SFXManager.playerHurt = true;
			}
		}
	}
	
	
	if launched && !killed {
		killed = true;
		vel = obj_Player.vel;
		yspd = -0.5;
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

function scr_EnemyDeathParticles(_particle, _amount) {
	var _partAmount = _amount;
	
	if _partAmount > 0 {
		if global.Particles {
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
			instance_create_depth(x, y, depth, _particle);
		}
			
		_partAmount -= 1;
	}
}


function scr_HurtPlayer(_damage, _knockback, _imageXscale, _yKnockback) {
	if !obj_Player.invincible {
		var _ringMult = 1;
		
		if instance_exists(obj_StageTrackerSpeed) {
			if global.Rings > 0 {
				_ringMult = 2;
			}
		}
		
		global.Health -= _damage / _ringMult;
		
		scr_StopCharShit();
		scr_ScreenShake();
		scr_ControllerRumble();
		scr_LoseTrinkets();
		scr_StopCharControls();
		
		scr_BonusPoints(-1000 * (_damage / 100000));
	
		var _basedX = _imageXscale;

		if obj_Player.leftFacer {
			if !obj_Player.face_Left {
				obj_Player.vel = -_knockback;
			} else {
				obj_Player.vel = _knockback;
			}
		} else {
			obj_Player.vel = -_knockback * obj_Player.image_xscale;
		}
		
		obj_Player.ground = false;
		obj_Player.jumping = true;
		obj_Player.yspd = _yKnockback;
		obj_Player.speedBreak = false;
		obj_Player.playerHurt = true;
		obj_Player.invincible = true;
		
		
		if obj_Player.enemyCombo > 0 {
			obj_Player.enemyCombo = 0;
		}
		
		if obj_Player.rushTrickCombo > 0 {
			obj_SFXManager.crowdAww = true;
			obj_Player.rushTrick = false;
			obj_Player.rushTrickCombo = 0;
		}
		
		if !obj_Player.rushMode {
			obj_Player.boostEnergy -= 50;
		} else {
			obj_Player.rushModeTimer = 0;
			obj_Player.boostEnergy -= 150;
		}
		
		obj_SFXManager.playerHurt = true;
	}
}

function scr_LoseTrinkets(_loseRings = 50) {
	if instance_exists(obj_StageTrackerSpeed) {
		//Lose Trinkets
		var _rings = 0;
		var _ringStartAngle = 101.25;
		var _ringAngle = _ringStartAngle;
		var _ringFlip = false;
		var _ringSpeed = 6;
		var _ringCheck = _loseRings;
	
		if global.Rings < _loseRings {
			_ringCheck = global.Rings;
		}
  
		//Perform loop while the ring counter is less than number of lost rings
		while _rings < _ringCheck {
		    //Create the ring
			var _ringID = instance_create_depth(global.PlayerID.x - 10, global.PlayerID.y - 7, global.PlayerID.depth + 1, obj_LostTrinkets);
		
		    _ringID.ringXSpeed = cos(_ringAngle) * _ringSpeed;
		    _ringID.ringYSpeed = -sin(_ringAngle) * _ringSpeed;
     
		    //Every ring created will moving be at the same angle as the other in the current pair, but flipped the other side of the circle
		    if _ringFlip {
		        _ringID.ringXSpeed = _ringID.ringXSpeed * -1;
		        _ringAngle += 22.5;
		    }
    
		    //Toggle flip
		    _ringFlip = !_ringFlip;
    
		    //Increment counter
		    _rings += 1;
    
		    //If we are halfway, start second "circle" of rings with lower speed
		    if _rings == _ringCheck / 2 {
		        _ringSpeed = 3;
		        _ringAngle = _ringStartAngle;
		    }
		}
	
		if global.Rings > _ringCheck {
			global.Rings -= _ringCheck;
		} else {
			global.Rings -= global.Rings;
		}
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


function scr_HitLag(_lagTime) { //Unused
	
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
	if instance_exists(obj_KappaHeadOverworld) or instance_exists(obj_KappaNormalOverworld) {
		obj_Player.airDash = false;
	}
	
	
	//Sarah
	if instance_exists(obj_SarahOverworld) {
		obj_Player.hover = false;
		obj_Player.sideWallJump = false;
		obj_Player.stompingTimer = obj_Player.stompingFrames;
		obj_Player.normalStomp = false;
		obj_Player.omegaStomp = false;
		obj_Player.omegaStompingTimer = 0;
	}
	
	
	//Rush
	if instance_exists(obj_RushOverworld) {
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
	if instance_exists(obj_IvyOverworld) {
		obj_Player.shootAir = false;
		obj_Player.shootGround = false;
		obj_Player.hShootWeak = false;
		obj_Player.hShoot = false;
		obj_Player.preStomp = false;
	}
}