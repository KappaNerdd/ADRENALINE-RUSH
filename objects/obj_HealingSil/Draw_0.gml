if healedObj != noone {
	if !healed {
		if image_alpha < 1 {
			image_alpha += 0.075;
		} else {
			healed = true;
		}
	} else {
		if image_alpha > 0 {
			image_alpha -= 0.025;
		} else {
			instance_destroy();
		}
	}
	
	if instance_exists(healedObj) {
		var _xscale = healedObj.image_xscale;
		var _angle = healedObj.image_angle;
		
		if healedObj.object_index == global.PlayerID {
			_xscale = healedObj.visXScale;
			_angle = healedObj.drawAngle;
		}
		
		depth = healedObj.depth - 2;
	
		gpu_set_fog(true, col, 0, 1);
			draw_sprite_ext(healedObj.sprite_index, healedObj.image_index, healedObj.x, healedObj.y, _xscale, healedObj.image_yscale, _angle, col, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	}
} else {
	instance_destroy();
}