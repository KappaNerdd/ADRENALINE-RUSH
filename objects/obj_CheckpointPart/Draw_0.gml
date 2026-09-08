var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) < global.CamSafeArea {
	var _sprCol = c_white;

	if !global.MIND && global.PlayerChar != 0 {
		_sprCol = sprColor;
	}

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, _sprCol, image_alpha);
}
