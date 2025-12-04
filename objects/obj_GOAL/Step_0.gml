getCharacterControls();

if jump_Key && goalTimer > 0 {
	goalTimer = 0;
}

if goalTimer > 0 {
	goalTimer -= 1;
	
	movedX = lerp(movedX, 320, 0.25);
}

if goalTimer <= 0 {
	goalTimer = 0;
}

if goalTimer == 0 && goal == false {
	goal = true;
}

if goal {
	movedX = lerp(movedX, -500, 0.2);
}

var _results = obj_ResultsCardNew;

if movedX <= -495 && goal && !instance_exists(obj_RoomTransitionSEGAMenu) {
	var _reRoom = rm_ResultsScreen;
	
	if global.Replay {
		_reRoom = rm_FreeplayNew;
		
		if instance_exists(obj_GhostRecorder) {
			instance_destroy(obj_GhostRecorder);
		}
		
		if instance_exists(obj_InputRecorder) {
			instance_destroy(obj_InputRecorder);
		}
	}
	
	with(instance_create_depth(-1000000, 0, 0, obj_RoomTransitionSEGAMenu)) {
		target_rm = _reRoom;
		division = 1;
	}
	
	instance_destroy();
}

if global.PlayerChar != 0 && !global.MIND {
	image_blend = global.fullRGB;
} else {
	image_blend = c_white;
}

