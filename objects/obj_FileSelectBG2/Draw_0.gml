if yChange > 0 {
	yChange -= 10;
}

draw_sprite_ext(sprite_index, image_index, x, y + yChange, image_xscale, image_yscale, 0, c_white, 1);

