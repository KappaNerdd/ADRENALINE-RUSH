draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha / 1.5);


draw_set_halign(fa_center);
draw_set_valign(fa_middle);

	draw_text_transformed_color(x, y, string(requirementText), 1, 1, 0, c_white, c_white, c_white, c_white, image_alpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

