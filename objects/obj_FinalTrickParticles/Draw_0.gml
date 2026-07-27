if charCheck != noone && instance_exists(charCheck) {
	draw_sprite_ext(sprite_index, image_index, charCheck.x, charCheck.y - 8, scale, scale, 0, c_white, image_alpha);
}