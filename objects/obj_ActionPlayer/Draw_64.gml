var _HP = HP;
var _maxHP = maxHP;

var _EN = EN;
var _maxEN = maxEN;

var _xChange = 0;
var _xScale = 1;

if !player {
	_xChange = 560;
	_xScale = -1;
}


draw_sprite_ext(spr_RainSplash, image_index, 40 + _xChange, 10, (100 * _xScale) / _maxHP * _HP, 5, 0, c_red, 1);
draw_sprite_ext(spr_RainSplash, image_index, 40 + _xChange, 24, (80 * _xScale) / _maxEN * _EN, 3, 0, c_blue, 1);