if global.SimplifyVFX {
	fullBoost = simpleBoost;
} else {
	fullBoost = boost;
}

sprite_index = fullBoost;

if instance_exists(obj_Player) {
	if obj_Player.vel > 0 {
		image_xscale = 1;
	} else if obj_Player.vel < 0 {
		image_xscale = -1;
	}


	if obj_Player.ground {
		image_angle = obj_Player.drawAngle;
	} else {
		var _yspd = obj_Player.yspd;
	
		if image_xscale == 1 {
			_yspd = obj_Player.yspd;
		} else {
			_yspd = -obj_Player.yspd;
		}
	
		var _angle = point_direction(0, 0, abs(obj_Player.vel), _yspd);
	
		image_angle = _angle;
	}
}