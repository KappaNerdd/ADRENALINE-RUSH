display_set_gui_size(640, 360);

draw_set_halign(fa_right);

	var _prototype = "";
	var _version = " V0.3.0D";

	if global.FPSOn {
		draw_text_transformed(640, 350, scr_LocalText("game_Demo") + string(_version), 0.5, 0.5, 0);
		draw_text_transformed(640, 0, "REAL FPS: " + string(fps_real), 0.5, 0.5, 0);
		draw_text_transformed(640, 12, "FPS: " + string(fps), 0.5, 0.5, 0);
		//draw_text_transformed(640, 24, "INSTANCE COUNT: " + string(instance_count), 0.5, 0.5, 0);
	}

draw_set_halign(fa_left);

window_set_caption(scr_LocalText("wind_Title"));