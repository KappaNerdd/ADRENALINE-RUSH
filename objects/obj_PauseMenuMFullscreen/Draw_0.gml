draw_self();

if global.Language == 2 {
	draw_text_transformed(x + 10, y + 4, "Pantalla Completa", 1, 1, 0);
} else {
	draw_text(x + 60, y + 4, "FULLSCREEN");
}

draw_sprite(spr_OptionCheckbox, optBullshit, x + 200, y);