function scr_GetCharCamX(_char = global.DRPlayerID) {
	var _camX = camera_get_view_x(view_camera[0]);
	var _playX = 0;

	if instance_exists(_char) {
		_playX = _char.x;
	}

	var _relX = _playX - _camX;
	
	return _relX;
}

function scr_GetCharCamY(_char = global.DRPlayerID) {
	var _camY = camera_get_view_y(view_camera[0]);
	var _playY = 0;

	if instance_exists(_char) {
		_playY = _char.y - 18;
	}

	var _relY = _playY - _camY;
	
	return _relY;
}