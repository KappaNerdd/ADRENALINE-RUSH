if shakeTimer > 0 {
	shakeTimer--;
}

if playChar.combo == 0 {
	numberAlpha = 0;
} else {
	numberAlpha = 1;
}

if numberScale > 2 {
	numberScale -= 0.05;
}


if player {
	if playChar.combo > 0 {
		if global.ActionEnemy.hitStun <= 0 {
			if !finished {
				finished = true;
				numberScale = 2.5;
			}
		}
	}
} else {
	if playChar.combo > 0 {
		if global.ActionPlayer.hitStun <= 0 {
			if !finished {
				finished = true;
				numberScale = 2.5;
			}
		}
	}
}

if finished {
	if finishedTimer > 0 {
		finishedTimer--;
	}
	
	numberCol1 = numberCol2;
	
	if finishedTimer <= 0 {
		finished = false;
		playChar.combo = 0;
	}
} else {
	finishedTimer = finishedFrames;
	numberCol1 = c_white;
	
	if mainCombo != playChar.combo {
		mainCombo = playChar.combo;
	}
}

if mainCombo != playChar.combo {
	numberScale = 2.5;
	finished = false;
}
