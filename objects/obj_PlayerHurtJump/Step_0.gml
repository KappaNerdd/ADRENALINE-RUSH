getCharacterControls();

if instance_exists(obj_Player) && !instance_exists(obj_CutsceneParent) {
	if !obj_Player.ground && obj_Player.yspd > 1 && obj_Player.playerHurt && !global.Death {
		if jump_Key {
			obj_SFXManager.jumpSound = true;
			obj_Player.yspd = obj_Player.normalJspd;
			obj_Player.playerHurt = false;
			obj_Player.can_Move = true;
		}
		
		
		if obj_Player.action1_Key {
			if obj_Player.sonicRush {
				obj_SFXManager.sonicRushTrick = true;
				obj_SFXManager.sonicRush = true;
			} else if obj_Player.blazeRush {
				obj_SFXManager.blazeRushTrick = true;
				obj_SFXManager.blazeRush = true;
			}
			
			if obj_Player.leftFacer {
				if obj_Player.face_Left {
					obj_Player.vel = -obj_Player.full_Speed;
				} else {
					obj_Player.vel = obj_Player.full_Speed;
				}
			} else {
				obj_Player.vel = obj_Player.full_Speed * image_xscale;
			}
			
			scr_StopCamMove();
			scr_ScreenShake();
			scr_ControllerRumble();
			
			obj_Player.boost = true;
			obj_Player.boostEnergy -= 10;
			obj_Player.playerHurt = false;
			obj_Player.can_Move = true;
		}
	}
}