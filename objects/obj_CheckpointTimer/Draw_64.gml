var _xscale = 1;
var _yscale = 1;
var _ang = 0;

var _x = 60;
var _y = 90;

if global.speedStageData[global.SpeedSelected].complete {
	_y = 120;
}

display_set_gui_size(768, 432);

var _checkFont = global.CheckpointTimerFont;

if global.MIND or global.PlayerChar == 0 {
	_checkFont = global.CheckpointTimerFontHead;
}

draw_set_font(_checkFont);
draw_set_halign(fa_left);

	if selfSeconds < 10 && selfMinutes < 10 {
		draw_text_transformed_color(_x - 3, _y + 3, string(selfMinutes) + ":0" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	} else if selfSeconds >= 10 && selfMinutes >= 10 {
		draw_text_transformed_color(_x - 3, _y + 3, string(selfMinutes) + ":" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	} else if selfSeconds < 10 && selfMinutes >= 10 {
		draw_text_transformed_color(_x - 3, _y + 3, string(selfMinutes) + ":0" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	} else if selfSeconds >= 10 && selfMinutes < 10 {
		draw_text_transformed_color(_x - 3, _y + 3, string(selfMinutes) + ":" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	}

	if selfSeconds < 10 && selfMinutes < 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":0" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	} else if selfSeconds >= 10 && selfMinutes >= 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	} else if selfSeconds < 10 && selfMinutes >= 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":0" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	} else if selfSeconds >= 10 && selfMinutes < 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":" + string(selfSeconds), _xscale, _yscale, _ang, c_black, c_black, c_black, c_black, 1);
	}
	

	if selfSeconds < 10 && selfMinutes < 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":0" + string(selfSeconds), _xscale, _yscale, _ang, global.fullRGB, global.fullRGB, global.fullRGB, global.fullRGB, image_alpha);
	} else if selfSeconds >= 10 && selfMinutes >= 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":" + string(selfSeconds), _xscale, _yscale, _ang, global.fullRGB, global.fullRGB, global.fullRGB, global.fullRGB, image_alpha);
	} else if selfSeconds < 10 && selfMinutes >= 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":0" + string(selfSeconds), _xscale, _yscale, _ang, global.fullRGB, global.fullRGB, global.fullRGB, global.fullRGB, image_alpha);
	} else if selfSeconds >= 10 && selfMinutes < 10 {
		draw_text_transformed_color(_x, _y, string(selfMinutes) + ":" + string(selfSeconds), _xscale, _yscale, _ang, global.fullRGB, global.fullRGB, global.fullRGB, global.fullRGB, image_alpha);
	}

draw_set_halign(fa_left);
draw_set_font(global.font_main);