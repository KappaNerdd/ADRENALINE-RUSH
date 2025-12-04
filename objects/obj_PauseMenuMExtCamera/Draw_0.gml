draw_self();

if global.Language == 2 {
	draw_text_transformed(x + 15, y + 4, "Camara Extendida", 1, 1, 0);
} else {
	draw_text_transformed(x + 10, y + 4, "EXTENDED CAMERA", 1, 1, 0);
}

draw_sprite(spr_OptionCheckbox, optBullshit, x + 200, y);