display_set_gui_size(global.CamWidth, global.CamHeight);

if global.Replay {
	draw_sprite_ext(sprite_index, image_index, 603, 13, 1, 1, 0, c_black, 1);
	draw_sprite_ext(sprite_index, image_index, 600, 10, 1, 1, 0, c_white, 1);
}