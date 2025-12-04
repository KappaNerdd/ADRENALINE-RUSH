if global.Rings <= 0 {
	global.Rings = 0;
}

if global.Rings >= 999 {
	global.Rings = 999;
}


for(var i = 0; i < array_length(extraLife); i++) {
	var _ringCount = 100;
	
	if global.Rings >= _ringCount * (i + 1) && !extraLife[(global.Rings + 1) / 100] {
		extraLife[(global.Rings + 1) / 100] = true;
		
		if !global.Freeplay {
			global.PlayerExtraLives += 1;
			global.CollectedLives += 1;
			obj_PlayerExtraLives.lifeScale = 1.5;
			obj_SFXManager.funkinCheckpoint = true;
		} else {
			obj_SFXManager.rushModeGain = true;
			obj_Player.rushMode = true;
			obj_Player.boostEnergy = 300;
			obj_Player.rushModeTimer = obj_Player.rushModeFrames;
		}
	}
}