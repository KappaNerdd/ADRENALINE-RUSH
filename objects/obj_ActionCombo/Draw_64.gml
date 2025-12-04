draw_set_font(global.EnemyComboFont);

var _xChange = 0;
var _side = fa_left;
var _xScale = 1;

if !player {
	_xChange = 560;
	_side = fa_right;
	_xScale = -1;
	
	numberCol2 = c_red;
	numberCol3 = c_red;
	numberCol4 = c_red;
}
	
draw_set_halign(_side);
	draw_text_transformed_color(40 + _xChange, 70, string(mainCombo), numberScale, numberScale, 0, numberCol1, numberCol1, numberCol3, numberCol4, numberAlpha);
	draw_sprite_ext(spr_PauseArrow, 0, 40 + _xChange, 110, (numberScale / 2.25) * _xScale, 0.5, 0, numberCol2, numberAlpha);
draw_set_halign(fa_left);

draw_set_font(global.font_main);