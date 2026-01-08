var _col = c_aqua;

if global.MIND or global.PlayerChar == 0 {
	_col = c_white;
}

draw_set_halign(fa_middle);
draw_set_valign(fa_bottom);
	draw_text_transformed_color(x, y, scr_LocalText("envo_Secret"), image_xscale, image_yscale, 0, _col, _col, _col, _col, image_alpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);