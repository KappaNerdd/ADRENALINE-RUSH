function scr_DRDim(_depth = 0, _outline = true) {
	if !instance_exists(obj_DRBlackBG) {
		instance_create_depth(-1000, 0, _depth, obj_DRBlackBG);
	}
	
	if _outline {
		if instance_exists(obj_Player) && !instance_exists(obj_DRSil) {
			with(instance_create_depth(-1000, 0, obj_Player.depth + 2, obj_DRSil)) {
				outline = true;
			}
			
			instance_create_depth(-1000, 0, obj_Player.depth - 2, obj_DRSil);
		}
	}
}

function scr_DRDimAlpha(_check) {
	if instance_exists(obj_DRBlackBG) {
		with(obj_DRBlackBG) {
			alphCheck = _check;
		}
	}
	
	if instance_exists(obj_DRSil) {
		with(obj_DRSil) {
			alphCheck = _check;
		}
	}
}

function scr_DRDimKill() {
	if instance_exists(obj_DRBlackBG) {
		instance_destroy(obj_DRBlackBG);
	}
	
	if instance_exists(obj_DRSil) {
		instance_destroy(obj_DRSil);
	}
}