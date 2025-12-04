var _character = instance_place(x, y - 1, obj_Player);

if _character && launchConfirmed == false && !global.Death {
	launchConfirmed = true;
	
	if obj_Player.ground && obj_Player.yspd >= 0 {
		obj_SFXManager.boostPad = true;
	
		scr_StopPlayerHurt();
	
		if instance_exists(obj_Player) {		
			_character.beforeTrick = false;
			_character.trick = false;
			_character.upTrick = false;
			_character.rightTrick = false;
			_character.leftTrick = false;
			_character.backTrick = false;
		}
	
		if giveScore {
			_character.getScore = true;
			giveScore = false;
		}
	
		///-----Stop shit-----///
	
		//Everyone
		_character.stomping = false;
		_character.stomped = false;
		_character.dJumping = false;
		_character.sliding = false;
		_character.ground = false;
		_character.jumping = true;
	}
	
	
	scr_StopCharShit();
	
	
	if audio_is_playing(snd_Stomping) {
		audio_stop_sound(snd_Stomping);
	}
}

if launchConfirmed == true {
	
	if launchVel > 0 {
		if obj_Player.vel < launchVel {
			obj_Player.vel = launchVel;
		}
	} else if launchVel < 0 {
		if obj_Player.vel > launchVel {
			obj_Player.vel = launchVel;
		}
	}
		
	obj_Player.yspd = launchYspd;
	
	if launchTimer > 0 {
		launchTimer -= 1;
	}
	
	if instance_exists(obj_Player) {
		obj_Player.rampRing = true;
	}
	
	if launchTimer <= 0 {
		launchConfirmed = false;
		
		launchTimer = launchFrames;
	}
}