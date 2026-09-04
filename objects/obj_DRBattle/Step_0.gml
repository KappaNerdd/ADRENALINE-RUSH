if !entered {
	if waitTimer > 0 {
		waitTimer--;
	} else {
		if enteredTimer > 0 {
			enteredTimer--;
			
			if !otherEnter {
				otherEnter = true;
				global.DRBattle = true;
				savedMusPos = scr_GetMusPos();
				set_song_ingame(noone, 30);
				obj_SFXManager.block = true;
			}
			
			if array_length(global.DRPartyReal) > 0 {
				for(var i = 0; i < array_length(global.DRPartyReal); i++) {
					with(global.DRPartyReal[i]) {
						battleLand = true;
					}
				}
			}
		} else {
			if array_length(global.DRPartyReal) > 0 {
				for(var i = 0; i < array_length(global.DRPartyReal); i++) {
					with(global.DRPartyReal[i]) {
						action = false;
						battleLand = false;
						extraYspd = -4;
						image_speed = 1;
						image_index = 0;
					}
				}
			}
		
			entered = true;
			obj_SFXManager.jumpSound = true;
		}
	}
} else {
	if !battleStance {
		if battleTimer > 0 {
			battleTimer--;
			
			if array_length(global.DRPartyReal) > 0 {
				for(var i = 0; i < array_length(global.DRPartyReal); i++) {
					with(global.DRPartyReal[i]) {
						scr_CreateAfterImage(x + extraX, y + extraY, other.depth - 1);
					}
				}
			}
			
			if array_length(global.DREnemy) > 0 {
				for(var i = 0; i < array_length(global.DREnemy); i++) {
					with(global.DREnemy[i]) {
						sprite_index = battleSpr[BATTLE.IDLE];
						scr_CreateAfterImage(x + extraX, y + extraY, other.depth - 1);
					}
				}
			}
		} else {
			battleStance = true;
			obj_SFXManager.block = true;
			obj_SFXManager.enemyCounter = true;
			
			if array_length(global.DRPartyReal) > 0 {
				for(var i = 0; i < array_length(global.DRPartyReal); i++) {
					with(global.DRPartyReal[i]) {
						image_index = 1;
						image_speed = 1;
						battleAttack = true;
						action = true;
					}
				}
			}
		}
	} else {
		if battledTimer > 0 {
			battledTimer--;
		} else {
			if !battling {
				set_song_ingame(mus_MINDWAVE_A, 0, 0, 1, 0);
				battling = true;
			}
			
			if array_length(global.DRPartyReal) > 0 {
				for(var i = 0; i < array_length(global.DRPartyReal); i++) {
					with(global.DRPartyReal[i]) {
						battleAttack = false;
						action = false;
					}
				}
			}
		}
	}
}

if global.DRBattle {
	if image_alpha < 1 {
		image_alpha += 0.025;
	}
	
	if enteredTimer <= 0 {
		if array_length(global.DRPartyReal) > 0 {
			for(var i = 0; i < array_length(global.DRPartyReal); i++) {
				var _camX = camera_get_view_x(view_camera[0]);
				var _camY = camera_get_view_y(view_camera[0]);
				var _screenPos = 200 / array_length(global.DRPartyReal);
				var _posX = _camX + 70;
				var _posY = _camY + (_screenPos * (i + 1));
				
				if changePos {
					_posX = targetX[i];
					_posY = targetY[i];
				}
					
				with(global.DRPartyReal[i]) {
					scr_CharMovePos(x, y, _posX, _posY, 0.1);
				}
			}
		}
		
		if array_length(global.DREnemy) > 0 {
			for(var i = 0; i < array_length(global.DREnemy); i++) {
				var _camX = camera_get_view_x(view_camera[0]);
				var _camY = camera_get_view_y(view_camera[0]);
				var _screenPos = 200 / array_length(global.DREnemy);
				var _posX = _camX + 512 - 70;
				var _posY = _camY + (_screenPos * (i + 1));
				
				if changePos {
					_posX = enemTargetX[i];
					_posY = enemTargetY[i];
				}
					
				with(global.DREnemy[i]) {
					scr_CharMovePos(x, y, _posX, _posY, 0.1);
				}
			}
		}
	}
}