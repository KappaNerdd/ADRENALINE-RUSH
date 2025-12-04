if distance_to_object(obj_Player) < 800 {
	var _sprCol = c_white;

	if !global.MIND && global.PlayerChar != 0 {
		_sprCol = sprColor;
	}

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, _sprCol, image_alpha);
}
