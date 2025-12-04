if instance_exists(obj_Player) {
	if obj_Player.vel > 0 {	
		draw_sprite_ext(sprite_index, image_index, obj_Player.x + 10, obj_Player.y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	} else if obj_Player.vel < 0 {
		draw_sprite_ext(sprite_index, image_index, obj_Player.x - 10, obj_Player.y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
}