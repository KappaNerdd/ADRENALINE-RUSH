if distance_to_object(obj_Player) < 800 {
	draw_sprite_ext(spr_OTSpecsGlow, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha / 2);

	draw_self();
}
