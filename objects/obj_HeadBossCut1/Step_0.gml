obj_Player.noMoveTimer = 2;
obj_Player.can_Move = false;

if fullVelTimer > 0 {
	fullVelTimer--;
	
	with(obj_Player) {
		vel = -16;
		can_Move = false;
		rushMode = true;
		boostEnergy = 300;
		speedBreak = true;
		
		if leftFacer {
			face_Left = true;
		} else {
			visXScale = -1;
		}
	}
} else {
	if boostingTimer > 0 {
		boostingTimer--;
		
		with(obj_Player) {
			if other.boostingTimer >= 419 {
				action1_Key = true;
			} else {
				action1_Key = false;
			}
			
			if other.boostingTimer > 60 {
				action1_Key_Held = true;
			} else {
				action1_Key_Held = false;
			}
			
			vel = -20;
		}
	} else {
		instance_destroy();
		obj_Player.can_Move = true;
		scr_StopCamDir("v", false);
		scr_ChangeCamZoom(1, 0.1);
		global.DisableHUD = false;
		obj_HeadBeam.stopped = false;
		
		instance_destroy(createdChar);
	}
}