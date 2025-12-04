if distance_to_object(obj_Player) < 800 {
	draw_sprite_ext(sprite_index, image_index, x - 5, y + 5, image_xscale, image_yscale, image_angle, colChar, image_alpha);
	scr_Outline();

	draw_self();
}