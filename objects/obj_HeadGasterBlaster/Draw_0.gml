if !fire {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
} else {
	draw_sprite_ext(spr_HeadHazardBeam, 0, x, y, fakeXScale, fakeYScale, image_angle, image_blend, image_alpha);
}