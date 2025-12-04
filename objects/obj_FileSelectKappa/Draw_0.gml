if xChange > 0 {
	xChange -= 10;
}

draw_sprite_ext(sprite_index, image_index, x + xChange, y, image_xscale, image_yscale, 0, c_white, 1);