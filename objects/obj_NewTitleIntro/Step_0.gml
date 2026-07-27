getCharacterControls();

if jump_Key or pause_Key {
	scr_WhiteTrans(rm_NewTitle);
}

var _angleChange = 2.5;
var _thresh = 60;

if showLucifer {
	_thresh = 64;
}

if !playMus {
	playMus = true;
	set_song_ingame(mus_RoundNRound_Intro);
}

titleWhite = lerp(titleWhite, 0, 0.2);

if !chowder {
	if lightAngle < _thresh {
		lightAngle += _angleChange;
	} else {
		if !showLucifer {
			lightAngle = 62;
		} else {
			lightAngle = _thresh;
		}
		
		if !showLucifer {
			if !blueArrow {
				moveLeft = scr_Approach(moveLeft, 768 / 2, 30);
				
				if moveLeft <= 768 / 2 {
					blueArrow = true;
					obj_SFXManager.rankSlam = true;
					titleWhite = 1;
				}
			}
		} else {
			if !purpleArrow {
				moveRight = scr_Approach(moveRight, 768 / 2, 30);
				
				if moveRight >= 768 / 2 {
					purpleArrow = true;
					obj_SFXManager.rankSlam = true;
					titleWhite = 1;
				}
			}
		}
	
		if waitTimer > 0 {
			waitTimer--;
		} else {
			if !showBlue {
				noSurface = true;
				showBlue = true;
				obj_SFXManager.enemyCounter = true;
			}
		
			if showLucifer {
				if !showPurple {
					noSurface = true;
					showPurple = true;
					obj_SFXManager.enemyCounter = true;
				}
			}
		
			if noSurfaceTimer > 0 {
				noSurfaceTimer--;
			} else {
				if !showBluey {
					showBluey = true;
					obj_SFXManager.enemyCounter = true;
				}
				
				if showLucifer {
					if !showNurple {
						showNurple = true;
						obj_SFXManager.enemyCounter = true;
					}
				}
			
				if otherWait > 0 {
					otherWait--;
				} else {
					if !showLucifer {
						noSurface = false;
						lightAngle = 0;
						showLucifer = true;
						waitTimer = 30;
						noSurfaceTimer = 10;
						otherWait = 25;
					} else {
						chowder = true;
						noSurface = false;
						lightAngle = 0;
					}
				}
			}
		}
	}
} else {
	angleChange += 0.1;
	lightAngle += angleChange;
	lightScale += 0.05;
	
	if chowderTimer > 0 {
		chowderTimer--;
	} else {
		scr_WhiteTrans(rm_NewTitle, 0.4035);
	}
	
	a_Angle = ease(a_Angle, 0, 0.25, Easings.CUBE_IO);
	a_Alpha = ease(a_Alpha, 1, 0.1, Easings.CUBE_O);
	a_Scale = ease(a_Scale, 1, 0.05, Easings.CUBE_O);
	
	if a_Angle <= 2 {
		r_Move = scr_Approach(r_Move, 768 / 2, 20);
		
		if r_Move >= 768 / 2 && !nameCheck {
			nameCheck = true;
			obj_SFXManager.rankSlam = true;
			titleWhite = 1;
		}
	}
	
	if nameCheck {
		catAlpha = lerp(catAlpha, 1, 0.075);
	}
	
	if a_Angle > 180 {
		obj_SFXManager.doubleJumpSoundLoop = true;
	}
}

if srSpikesIndex < 20 && !global.SimplifyVFX {
	srSpikesIndex++;
} else {
	srSpikesIndex = 0;
}