display_set_gui_size(640, 360);

var _change = 1;
var _change2 = 2;
var _col1 = c_white;
var _col2 = c_black;
var _jacobAlpharad = image_alpha;
	
if global.MIND or global.PlayerChar == 0 {
	_col1 = c_black;
	_col2 = c_white;
}

draw_sprite_ext(sprite_index, image_index, newX + 5, newY + 5, image_xscale, image_yscale, image_angle, c_black, image_alpha);
	
if global.Outline {
	gpu_set_fog(true, _col2, 0, 1);
		draw_sprite_ext(sprite_index, image_index, newX + _change2, newY, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, newX - _change2, newY, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, newX, newY + _change2, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, newX, newY - _change2, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
	gpu_set_fog(false, c_black, 0, 1);
	
	gpu_set_fog(true, _col1, 0, 1);
		draw_sprite_ext(sprite_index, image_index, newX + _change, newY, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, newX - _change, newY, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, newX, newY + _change, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, newX, newY - _change, image_xscale, image_yscale, image_angle, image_blend, _jacobAlpharad);
	gpu_set_fog(false, c_black, 0, 1);
}

draw_sprite_ext(sprite_index, image_index, newX, newY, image_xscale, image_yscale, image_angle, c_white, image_alpha);
