if image_xscale == 1 {	
	draw_sprite_ext(sprite_index, image_index, obj_Player.x, obj_Player.y + 8, image_xscale, image_yscale, 0, image_blend, image_alpha);
} else if image_xscale == -1 {
	draw_sprite_ext(sprite_index, image_index, obj_Player.x, obj_Player.y + 8, image_xscale, image_yscale, 0, image_blend, image_alpha);
}