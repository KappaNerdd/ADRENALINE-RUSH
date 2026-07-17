if global.Rings <= 0 {
	global.Rings = 0;
}

if global.Rings >= 999 {
	global.Rings = 999;
}

#region //Extra Life 1
	if global.Rings >= 100 && !extraLife[0] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[0] = true;
	}
#endregion

#region //Extra Life 2
	if global.Rings >= 200 && !extraLife[1] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[1] = true;
	}
#endregion

#region //Extra Life 3
	if global.Rings >= 300 && !extraLife[2] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[2] = true;
	}
#endregion

#region //Extra Life 4
	if global.Rings >= 400 && !extraLife[3] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[3] = true;
	}
#endregion

#region //Extra Life 5
	if global.Rings >= 500 && !extraLife[4] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[4] = true;
	}
#endregion

#region //Extra Life 6
	if global.Rings >= 600 && !extraLife[5] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[5] = true;
	}
#endregion

#region //Extra Life 7
	if global.Rings >= 700 && !extraLife[6] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[6] = true;
	}
#endregion

#region //Extra Life 8
	if global.Rings >= 800 && !extraLife[7] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[7] = true;
	}
#endregion

#region //Extra Life 9
	if global.Rings >= 900 && !extraLife[8] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[8] = true;
	}
#endregion

#region //Extra Life 10
	if global.Rings >= 999 && !extraLife[9] {
		if global.Freeplay {
			event_user(0);
		} else {
			event_user(1);
		}
	
		extraLife[9] = true;
	}
#endregion


if global.countUp {
	global.seconds += 1 / 60;
	image_speed = 1;
} else {
	if !global.MIND && global.PlayerChar != 0 {
		image_speed = 0;
	}
}

inGameScore = lerp(inGameScore, global.GameScore, 0.25);

if inGameScore <= 0 {
	inGameScore = 0;
}

if global.GameScore <= 0 {
	global.GameScore = 0;
}

if global.seconds < 60 && global.seconds > 59.9 {
	global.seconds = 0;
	global.minutes += 1;
}

if trinket {
	trinketFrames += trinketAnim;
	
	if trinketFrames >= 4 {
		trinketFrames = 0;
		trinket = false;
	}
} else {
	trinketFrames = 0;
}

trinketScale = lerp(trinketScale, 1, 0.1);

if global.DisableHUD or instance_exists(obj_LevelCard) or instance_exists(obj_LevelCardNew) or instance_exists(obj_ResultsCardNew) or instance_exists(obj_LevelCardMinor) or instance_exists(obj_ResultsCard) or instance_exists(obj_RoomTransParent) {
	moveY = lerp(moveY, -200, 0.1);
} else {
	moveY = lerp(moveY, 10, 0.1);
}

scr_GetCharRushBoostIcon();