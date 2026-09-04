function scr_RingsPlayer(_amount = 1, _enemComb = true) {
	global.Rings += _amount;
	obj_SFXManager.funkinFav = true;
	
	if instance_exists(obj_Timer) {
		obj_Timer.trinket = true;
		obj_Timer.trinketFrames = 0;
		obj_Timer.trinketScale = 1.5;
	}
	
	if _enemComb {
		if global.PlayerID.enemyCombo > 0 {
			if global.PlayerID.enemyCombo < 10 {
				if global.PlayerID.enemyComboTimer + 15 < global.PlayerID.enemyComboFrames {
					global.PlayerID.enemyComboTimer += 15;
				} else {
					global.PlayerID.enemyComboTimer = global.PlayerID.enemyComboFrames;
				}
			} else {
				if global.PlayerID.enemyComboTimer + 8 < global.PlayerID.enemyComboFrames / 1.5 {
					global.PlayerID.enemyComboTimer += 8;
				} else {
					global.PlayerID.enemyComboTimer = global.PlayerID.enemyComboFrames / 1.5;
				}
			}
		}
	}			
}