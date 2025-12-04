if distance_to_object(obj_Player) < 800 {
	scr_Outline();
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, sprColor, 1);
}