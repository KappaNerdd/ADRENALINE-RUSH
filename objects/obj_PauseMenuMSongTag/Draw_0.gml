draw_self();

if global.Language == 2 {
	draw_text_transformed(x + 10, y + 6, "Información de Canción", 0.8, 1, 0);
} else {
	draw_text(x + 90, y + 4, "SONG TAG");
}

draw_sprite(spr_OptionCheckbox, optBullshit, x + 200, y);