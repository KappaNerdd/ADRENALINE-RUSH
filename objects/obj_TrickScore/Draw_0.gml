draw_set_font(global.LifeFont);
draw_set_halign(hAlign);

	draw_text_transformed_color(obj_Player.x + comboX, obj_Player.y - 40 + comboY, string(round(trickScore)), 1, 1, 0, colorFlash, colorFlash, colorFlash, global.fullRGB, 1);
	
draw_set_halign(fa_left);
draw_set_font(global.font_main);
	
	