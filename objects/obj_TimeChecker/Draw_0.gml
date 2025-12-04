//draw_self();

draw_set_font(global.font_main);
draw_set_color(c_white);

if localSeconds < 10 && localMinutes < 10 {
	draw_text_color(x, y, string(localMinutes) + ":0" + string(localSeconds), c_white, c_white, c_white, c_white, global.Opacity);
} else if localSeconds >= 10 && localMinutes >= 10 {
	draw_text_color(x, y, string(localMinutes) + ":" + string(localSeconds), c_white, c_white, c_white, c_white, global.Opacity);
} else if localSeconds < 10 && localMinutes >= 10 {
	draw_text_color(x, y, string(localMinutes) + ":0" + string(localSeconds), c_white, c_white, c_white, c_white, global.Opacity);
} else if localSeconds >= 10 && localMinutes < 10 {
	draw_text_color(x, y, string(localMinutes) + ":" + string(localSeconds), c_white, c_white, c_white, c_white, global.Opacity);
}