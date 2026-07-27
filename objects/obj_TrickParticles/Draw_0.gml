if charCheck != noone && instance_exists(charCheck) {
	draw_sprite_ext(sprite_index, image_index, charCheck.x + drawX, charCheck.y - 8 + drawY, scale, scale, image_angle, c_white, image_alpha);
}