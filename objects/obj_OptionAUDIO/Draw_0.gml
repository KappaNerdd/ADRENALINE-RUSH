draw_set_font(global.font_main)

if global.OptionChoice != 0 {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_grey, image_alpha);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, image_alpha);
}

if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Change audio \nsettings to your \nliking.");
}