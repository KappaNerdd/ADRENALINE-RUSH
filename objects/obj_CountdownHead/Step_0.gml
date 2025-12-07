getCharacterControls();

if countdownTimer > 0 {
	countdownTimer -= 1;
	image_speed = 0;
	
	if instance_exists(obj_Player) {
		obj_Player.can_Move = false;
		obj_Player.prepare = true;
	}
	
	if obj_Player.jump_Key {
		countdownTimer = 0;
		
		with(obj_Player) {
			image_index = image_number - 1;
		}
	}
}

if countdownTimer <= 0 {
	movedY = lerp(movedY, 180, 0.1);
	
	if !created {
		image_speed = 1;
		created = true;
	}
}

if image_index >= 9 {	
	if !instance_exists(obj_ActualGhost) {
		instance_create_depth(x, y, depth, obj_ActualGhost);
	}
	
	if instance_exists(obj_GhostRecorder) && !global.Replay {
		obj_GhostRecorder.ghostRecord = true;
	}
	
	if image_speed == 0 {
		movedX = lerp(movedX, -250, 0.2);
	}
	
	
	if movedX <= -240 {
		instance_destroy();
	}
	
	if instance_exists(obj_Timer) {
		global.countUp = true;
	}
	
	if instance_exists(obj_Player) {
		obj_Player.prepare = false;
		obj_Player.can_Move = true;
		
		if obj_Player.vel < 2 && image_speed > 0 {
			obj_Player.vel = 2;
		}
	}
	
	if boostFrames > 0 && other.action2_Key && obj_Player.can_MoveFULL == true {
		obj_Player.vel = obj_Player.full_Speed;
		obj_Player.speedBreak = true;
		scr_StopCamMove();
		
		scr_BonusPoints(10000);
		
		obj_SFXManager.airDashSound = true;
		boostFrames = -1;
	}
}

if image_index >= 9 && boostFrames >= 0 {
	boostFrames -= 1;
}