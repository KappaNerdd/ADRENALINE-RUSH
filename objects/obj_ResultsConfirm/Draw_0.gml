draw_sprite_ext(sprite_index, image_index, x, y + 30, 1, 1, -52, c_white, image_alpha);

var _return = "RETURN";

if global.Freeplay {
	_return = "RETURN";
} else {
	_return = "CONTINUE";
}

draw_text_transformed_color(x - 30, y - 30, "RETURN", 1, 1, -52, c_white, c_white, c_white, c_white, image_alpha);

