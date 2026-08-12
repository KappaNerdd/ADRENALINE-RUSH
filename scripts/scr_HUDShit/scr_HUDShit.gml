function scr_CreateSpeedHUD(_timer = true, _resetTime = true, _countUp = false, _lives = true, _camera = true, _ghost = true, _rank = true, _combo = true, _boost = true) {
	if _timer && !instance_exists(obj_Timer) {
		with(instance_create_depth(-10000, 0, -9, obj_Timer)) {
			resetCount = _resetTime;
			global.countUp = _countUp;
		}
	}
	
	if _lives && !instance_exists(obj_PlayerExtraLives) {
		instance_create_depth(-10000, 0, -9, obj_PlayerExtraLives);
	}
	
	if _camera && !instance_exists(obj_CameraExtended) {
		instance_create_depth(-10000, 0, -9, obj_CameraExtended);
	}	
	
	if _ghost && !instance_exists(obj_GhostRecorder) {
		instance_create_depth(-10000, 0, -9, obj_GhostRecorder);
	}
	
	if _rank && !instance_exists(obj_HUDRankDisplayer) {
		instance_create_depth(-10000, 0, -9, obj_HUDRankDisplayer);
	}
	
	if _combo && !instance_exists(obj_EnemyComboCounterSpeed) {
		instance_create_depth(-10000, 0, -9, obj_EnemyComboCounterSpeed);
	}
	
	if _boost && !instance_exists(obj_BoostMeter) {
		instance_create_depth(-10000, 0, -9, obj_BoostMeter);
	}
	
	//instance_create_depth(-10000, 0, -9, obj_InputRecorder);
	//instance_create_depth(-10000, 0, -9, obj_LevelCoords);
}

function scr_CreateEnemyCounter(_enemies = 1) {
	with(instance_create_depth(-100, 0, -10, obj_EnemyCounter)) {
		enemyCount = _enemies;
		baseCount = _enemies;
	}
}