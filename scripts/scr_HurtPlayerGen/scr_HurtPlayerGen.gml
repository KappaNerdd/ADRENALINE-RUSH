function scr_HurtPlayer(_damage, _knockback, _imageXscale, _yKnockback, _ringsFly = true, _hitStop = 10, _ignore = false) {
	if !invincible {
		var _ringMult = 1;
		
		if instance_exists(obj_StageTrackerSpeed) {
			if global.Rings >= 50 && !_ignore {
				_ringMult = 2;
			}
		}
		
		global.Health -= _damage / _ringMult;
		
		scr_StopCharShit();
		scr_ScreenShake();
		scr_ControllerRumble();
		
		if _ringsFly {
			scr_LoseTrinkets();
		}
		
		scr_StopCharControls();
		scr_BonusPoints(-10000 * (_damage / 100000));
	
		var _basedX = _imageXscale;
		
		if abs(vel) < max_Speed {
			if leftFacer {
				if !face_Left {
					vel = -_knockback;
				} else {
					vel = _knockback;
				}
			} else {
				vel = -_knockback * visXScale;
			}
		} else {
			if !leftFacer {
				visXScale = -sign(vel);
			} else {
				if vel > 0 {
					face_Left = true;
				} else {
					face_Left = false;
				}
			}
		}
		
		ground = false;
		jumping = true;
		yspd = _yKnockback;
		speedBreak = false;
		playerHurt = true;
		invincible = true;
		slowSkid = false;
		scr_HitStop(true, 10);
		
		event_user(0);
		event_user(3);
		
		if enemyCombo > 0 {
			enemyCombo = 0;
		}
		
		if rushTrickCombo > 0 {
			obj_SFXManager.crowdAww = true;
			event_user(1);
			rushTrickCombo = 0;
		}
		
		scr_EnergyPlayer(-50, self);
		
		obj_SFXManager.playerHurt = true;
		obj_SFXManager.lightHit = true;
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
			var _ringID = instance_create_depth(global.PlayerID.x - 10, global.PlayerID.y - 26, global.PlayerID.depth - 1, obj_LostTrinkets);
		
		    _ringID.ringXSpeed = cos(_ringAngle) * _ringSpeed;
		    _ringID.ringYSpeed = -sin(_ringAngle) * _ringSpeed;
			_ringID.terrainLayer = terrainLayer;
     
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

function scr_HitStop(_stop = true, _stopTimer = 5) {
	if !_stop {
		hitStopped = false;
		hitStopTimer = 0;
		can_MoveFULL = true;
	} else {
		hitStopped = true;
		hitStopTimer = _stopTimer;
		can_MoveFULL = false;
	}
}