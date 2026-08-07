display_set_gui_size(768, 432);

draw_sprite_ext(sprite_index, 0, 768 / 2, 216, 15, 10, 0, c_white, image_alpha);
draw_sprite_ext(sprite_index, 0, 768 / 2, yPos, 6, 3, 0, c_white, 1);

if itemSpr != noone {
	draw_sprite_ext(itemSpr, 0, 768 / 2, itemPos - 50, 1, 1, 0, c_white, 1);
}

draw_set_halign(fa_middle);
	draw_text_transformed_color(768 / 2, yPos - 40, scr_LocalText("game_Acquire") + "...", 1, 1, 0, c_white, c_white, c_white, c_white, 1);
	draw_text_transformed_color(768 / 2, yPos + 20, scr_LocalText(itemName), 2, 2, 0, c_white, c_white, c_yellow, c_yellow, 1);
draw_set_halign(fa_left);