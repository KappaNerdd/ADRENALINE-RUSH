if goal {
	global.countUp = false;
	obj_Player.sliding = false;
	obj_Player.rushModeTimer = 0;
	
	if instance_exists(obj_InputRecorder) {
		obj_InputRecorder.isRecording = false;
	}
	
	if obj_Player.ground && obj_Player.vel != 0 {
		obj_Player.skid = true;
	} else if obj_Player.ground && obj_Player.vel == 0 {
		obj_Player.skid = false;
	}
	
	
	//---Character Specific---//
	if obj_Player.vel > 0 {
		obj_Player.vel -= obj_Player.dcc;
	} else if obj_Player.vel < 0 {
		obj_Player.vel += obj_Player.dcc;
	}
	
	
	if obj_Player.speedBreak == true {
		obj_Player.speedBreak = false;
	}
	
	scr_StopCharShit();
	scr_StopCharControls();
}

if goal && !resultsCreate && obj_Player.vel == 0 {
	resultsCreate = true;
	instance_create_depth(-10000000, 0, 0, obj_GOAL);
}

if goal && goalTimer > 0 && obj_Player.vel == 0 {
	goalTimer -= 1;
}

if goalTimer < 0 {
	goalTimer = 0;
}

if goalTimer == 0 && resultsCreate == false {
	resultsCreate = true;
}
