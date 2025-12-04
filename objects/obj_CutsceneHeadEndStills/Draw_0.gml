draw_self();


if gamepad_is_connected(0) {
	if global.ConType == 0 {
		draw_sprite_ext(spr_HUDB_Xbox, image_index / 6, x + 525, y + 8, 0.5, 0.5, 0, c_white, 1);
	} else if global.ConType == 1 {
		draw_sprite_ext(spr_HUDCross, image_index / 6, x + 525, y + 8, 0.5, 0.5, 0, c_white, 1);
	} else if global.ConType == 2 {
		draw_sprite_ext(spr_HUDB_Switch, image_index / 6, x + 525, y + 8, 0.5, 0.5, 0, c_white, 1);
	}
} else {
	draw_sprite_ext(spr_HUDXKey, image_index / 6, x + 525, y + 8, 0.5, 0.5, 0, c_white, 1);
}

draw_text(x + 580, y + 10, ": Skip");