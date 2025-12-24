display_set_gui_size(320, 180);

draw_sprite_ext(sprite_index, image_index, rushX, 0, 6, 9, 0, image_blend, 1);

if speedStage or restart {
	draw_sprite_ext(spr_WhiteTrans, 0, 0, 0, 10, 6, 0, c_white, speedAlpha);
}

