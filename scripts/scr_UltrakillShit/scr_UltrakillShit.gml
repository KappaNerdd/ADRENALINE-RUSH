function scr_ULTRATEXT(_text = "game_Whoops", _time = 240) {
	if !instance_exists(obj_ULTRATEXT) {
		with(instance_create_depth(0, 0, 0, obj_ULTRATEXT)) {
			ultraText = _text;
			ultraTimer = _time;
		}
	} else {
		with(obj_ULTRATEXT) {
			ultraText = _text;
			ultraTimer = _time;
			
			if ultraTimer == _time {
				scr_PlaySound(snd_Message);
			}
		}
	}
}

function scr_ULTRAPARRY(_lag = 180) {
	with(instance_create_depth(-100, 0, 0, obj_ParryFlash)) {
		hitLagCheck = _lag;
	}
}