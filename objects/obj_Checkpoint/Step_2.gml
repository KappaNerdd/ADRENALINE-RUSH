var _dist = point_distance(x, y, obj_Player.x, obj_Player.y);

if _dist <= 150 && active == false {
	global.RespawnX = x;
	global.RespawnY = y;
	
	scr_BonusPoints(bonus);
	
	if instance_exists(obj_Timer) {
		with (instance_create_depth(-100000000, y, depth, obj_CheckpointTimer)) {
			selfMinutes = global.minutes;
			selfSeconds = global.seconds;
		}
	}
	
	sprColor = c_gray;
	active = true;
	obj_Player.boostEnergy += 50;
	
	if obj_Player.rushMode {
		obj_Player.rushModeTimer = obj_Player.rushModeFrames;
		obj_SFXManager.rushModeTrick = true;
	}
	
	obj_SFXManager.funkinCheckpoint = true;
	
	if global.Particles {
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
		instance_create_depth(x, y, depth, obj_CheckpointPart);
	}
}

depth = obj_Player.depth + 1;