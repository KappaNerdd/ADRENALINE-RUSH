draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.75);
draw_sprite_ext(spr_TextboxTrans, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);

if !deleting {
	draw_text(x + 8, y + 4, "Are you sure you want to \ndelete your file?");
	
	if newGameYes {
		draw_text_color(x + 8, y + 68, "YES", c_white, c_white, c_white, c_white, 1);
		draw_text_color(x + 280, y + 68, "NO", c_grey, c_grey, c_grey, c_grey, 1);
	} else {
		draw_text_color(x + 8, y + 68, "YES", c_grey, c_grey, c_grey, c_grey, 1);
		draw_text_color(x + 280, y + 68, "NO", c_white, c_white, c_white, c_white, 1);
	}
} else {
	draw_text(x + 8, y + 4, "Deleting...\nPlease wait...");
}