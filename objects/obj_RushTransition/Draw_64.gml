display_set_gui_size(640, 360);

draw_sprite_ext(sprite_index, image_index, rushX, 0, 11, 10, 0, image_blend, 1);

if speedStage or restart {
	var _col = c_white;
	
	if global.MIND or global.PlayerChar == 0 {
		_col = c_black;
	}
	
	draw_sprite_ext(spr_WhiteTrans, 0, 0, 0, 20, 12, 0, _col, speedAlpha);
}

