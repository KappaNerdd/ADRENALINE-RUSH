if xChange < 0 {
	xChange += 10;
}

draw_sprite_ext(sprite_index, image_index, x + xChange, y, 0.5, 0.5, 0, c_white, 1);