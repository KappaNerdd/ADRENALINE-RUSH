draw_self();

if global.Language == 2 {
	draw_text_transformed(x + 40, y + 4, "Tipo de Control", 1, 1, 0);
} else {
	draw_text(x + 10, y + 4, "CONTROLLER TYPE");
}

draw_sprite(spr_ConsoleLogos, optBullshit, x + 200, y);