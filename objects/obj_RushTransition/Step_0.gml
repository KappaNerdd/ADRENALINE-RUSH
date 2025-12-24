if !transd {
	rushX = lerp(rushX, -20, 0.15);
	
	if rushX <= -19.5 {
		transd = true;
		
		if !speedStage && !restart {
			room_goto(target_rm);
		}
	}
} else {
	if !restart {
		if !speedStage {
			rushX = lerp(rushX, -400, 0.15);
		
			if rushX <= -399.5 {
				instance_destroy();
			}
		} else {
			if speedAlpha < 1.5 {
				speedAlpha += 0.025;
			} else {
				room_goto(target_rm);
				instance_destroy();
			}
		}
	} else {
		if speedAlpha < 1.5 {
			speedAlpha += 0.025;
		} else {
			room_restart();
			instance_destroy();
		}
	}
}