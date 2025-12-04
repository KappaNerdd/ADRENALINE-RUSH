function scr_BonusPoints(_points = 1000) {
	if instance_exists(obj_StageTrackerSpeed) or instance_exists(obj_StageTrackerAction) {
		if !instance_exists(obj_BonusPoints) {
			with(instance_create_depth(-100000, 0, 0, obj_BonusPoints)) {
				fullScore = _points * global.ScoreMult;
			}
		} else {
			with(obj_BonusPoints) {
				fullScore += _points * global.ScoreMult;
				soundDone = false;
				sprYScale = 1;
				image_alpha = 1;
				kysTimer = 180;
			}
		}
	}
}


function scr_GivePoints(_points = 1000) {
	if instance_exists(obj_StageTrackerSpeed) or instance_exists(obj_StageTrackerAction) {
		global.GameScore += _points;
	}
}