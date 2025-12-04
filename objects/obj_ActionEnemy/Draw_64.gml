var _HP = HP;
var _maxHP = maxHP;

var _EN = EN;
var _maxEN = maxEN;


draw_sprite_ext(spr_BoostBarColor, image_index, 600, 10, 0.25, -0.75 / _maxHP * _HP, -90, c_red, 1);
draw_sprite_ext(spr_BoostBarColor, image_index, 600, 20, 0.2, -0.5 / _maxEN * _EN, -90, c_blue, 1);