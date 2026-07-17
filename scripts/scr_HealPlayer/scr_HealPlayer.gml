function scr_HealthPlayer(_amount = 100000) {
	if _amount >= 0 {
		obj_SFXManager.funkinCheckpoint = true;
	} else {
		obj_SFXManager.playerHurt = true;
	}
	
	global.Health += _amount;
}

function scr_HealingEffect(_obj, _stars = true, _col = c_white) {
	if !global.SimplifyVFX {
		with(instance_create_depth(_obj.x, _obj.y, _obj.depth - 2, obj_HealingSil)) {
			healedObj = _obj;
			col = _col;
		}
	}
	
	if global.Particles && _stars {
		repeat(round(random_range(3, 7))) {
			with(instance_create_depth(_obj.x + random_range(-10, 10), _obj.y + random_range(-15, 15), _obj.depth - 2, obj_HealingStars)) {
				image_blend = _col;
			}
		}
	}
}

function scr_DRDamageNumbers(_amount, _x, _y, _time = 120, _col = noone, _miss = false, _parry = false) {
	with(instance_create_depth(-100, -100, -8, obj_DRDamage)) {
		if global.Health + _amount >= global.MaxHealth && _amount > 0 {
			amount = "MAX";
		} else {
			amount = _amount;
		}
			
		var _camX = camera_get_view_x(view_camera[0]);
		var _camY = camera_get_view_y(view_camera[0]);
					
		var _relX = _x - _camX;
		var _relY = _y - _camY;

		baseX = _relX;
		baseY = _relY;
		moveX = _relX;
		moveY = _relY;
						
		createTimer = _time;
		col = _col;
		miss = _miss;
		parry = _parry;
	}
}