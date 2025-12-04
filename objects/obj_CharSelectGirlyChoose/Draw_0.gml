draw_sprite_ext(spr_TextboxTrans, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.9);
draw_text_transformed_color(x + 8, y + 8, "Would you like to \nenable Girly Mixes?", 1, 1, 0, c_white, c_white, c_white, c_white, 1);

if yesVar {
	draw_text_transformed_color(x + 8, y + 96, "Yes", 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(x + 180, y + 96, "No", 1, 1, 0, c_white, c_white, c_white, c_white, 0.5);
} else if noVar {
	draw_text_transformed_color(x + 8, y + 96, "Yes", 1, 1, 0, c_white, c_white, c_white, c_white, 0.5);
	draw_text_transformed_color(x + 180, y + 96, "No", 1, 1, 0, c_white, c_white, c_white, c_white, 1);
}