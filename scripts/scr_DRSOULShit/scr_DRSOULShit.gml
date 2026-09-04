function scr_DRSOULVFX(_char = global.DRPlayerID, _spr = spr_DRSOULLoneSil) {
	var _camX = camera_get_view_x(view_camera[0]);
	var _camY = camera_get_view_y(view_camera[0]);

	var _playX = 0;
	var _playY = 0;

	if instance_exists(_char) {
		_playX = _char.x;
		_playY = _char.y - 18;
	}

	var _relX = _playX - _camX;
	var _relY = _playY - _camY;
	
	if !global.SimplifyVFX {
		with(instance_create_depth(-1000000, 0, -2, obj_DRSOULVFX)) {
			sprite_index = _spr;
			newX = _relX;
			newY = _relY;
			newScale = 0.25;
			changeShit = 0.1;
		}
	
		with(instance_create_depth(-1000000, 0, -2, obj_DRSOULVFX)) {
			sprite_index = _spr;
			newX = _relX;
			newY = _relY;
			newScale = 0.5;
			changeShit = 0.25;
		}
	
		with(instance_create_depth(-1000000, 0, -2, obj_DRSOULVFX)) {
			sprite_index = _spr;
			newX = _relX;
			newY = _relY;
			newScale = 1;
			changeShit = 0.5;
		}
	}
}