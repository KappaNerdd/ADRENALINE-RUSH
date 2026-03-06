display_set_gui_size(global.CamWidth, global.CamHeight);

if doneTimer > 0 {
	doneTimer--;
	
	if !global.SimplifyVFX {
		shakeX = random_range(-5, 5);
		shakeY = random_range(-5, 5);
	}
} else {
	changeXScale = lerp(changeXScale, 20, 0.1);
	changeYScale = lerp(changeYScale, 0, 0.1);
	
	if changeYScale <= 0.05 {
		instance_destroy();
	}
}

draw_set_halign(fa_middle);
draw_set_valign(fa_bottom);
	draw_text_transformed_color(baseX + shakeX, baseY + 60 + shakeY, scr_LocalText("level_Go"), changeXScale, changeYScale, 0, c_white, c_white, global.fullRGB, global.fullRGB, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
