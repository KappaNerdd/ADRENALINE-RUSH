draw_self();

if global.Language == 2 {
	draw_text_transformed(x + 10, y + 4, "Vibración de Control", 0.9, 1, 0);
} else {
	draw_text_transformed(x + 10, y + 4, "CONTROLLER RUMBLE", 0.89, 1, 0);
}

draw_sprite(spr_OptionCheckbox, optBullshit, x + 200, y);