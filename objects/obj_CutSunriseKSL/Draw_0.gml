var _scale = 1;
var _col = c_white;
var _text1 = "TO BE CONTINUED IN DEMO V0.3.0";
var _text2 = "CHAPTER 1 /// REUNION";

draw_self();

draw_set_halign(fa_center);

	draw_text_transformed_color(x, y - 200, string(_text1), _scale, _scale, 0, _col, _col, _col, _col, image_alpha);
	draw_text_transformed_color(x, y + 100, string(_text2), 1.5, 1.5, 0, _col, _col, c_yellow, c_yellow, image_alpha);

draw_set_halign(fa_left);