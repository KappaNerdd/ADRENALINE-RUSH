if !killed {
	if !shake {
		if textScale > 1 {
			lowerScale += 0.05;
			textScale -= lowerScale;
			graphScale -= lowerScale;
		} else {
			textScale = 1;
			graphScale = 1;
			obj_SFXManager.enemyCounter = true;
			obj_SFXManager.stomped = true;
			shake = true;
		}
	} else {
		if createTimer <= 0 {
			fakeX = lerp(fakeX, 700, 0.1);
			fakeY = lerp(fakeY, 30, 0.1);
		}
	}
	
	if enemyCount <= 0 {
		killed = true;
		obj_SFXManager.crowdComplete = true;
		scr_BonusPoints(2000 * baseCount);
	}
} else {
	if killedTimer > 0 {
		killedTimer--;
	} else {
		textScale2 -= 0.05;
		
		if textScale2 <= 0 {
			instance_destroy();
		}
	}
}

if shake {
	textScale = scr_Approach(textScale, 1, 0.1);
}