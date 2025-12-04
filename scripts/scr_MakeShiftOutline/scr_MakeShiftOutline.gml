function scr_Outline() {
	var _change = 1;
	var _change2 = 2;
	var _col1 = c_white;
	var _col2 = c_black;
	
	if global.MIND or global.PlayerChar == 0 {
		_col1 = c_black;
		_col2 = c_white;
	}
	
	if global.Outline {
		gpu_set_fog(true, _col2, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change2, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	
		gpu_set_fog(true, _col1, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change, round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	}
}