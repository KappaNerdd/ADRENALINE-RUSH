draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_set_font(global.TimerFont);

if global.seconds < 10 && global.minutes < 10 {
	draw_text(round(x) + 100, round(y) - 3, string(global.minutes) + ":0" + string(global.seconds));
} else if global.seconds >= 10 && global.minutes >= 10 {
	draw_text(round(x) + 100, round(y) - 3, string(global.minutes) + ":" + string(global.seconds));
} else if global.seconds < 10 && global.minutes >= 10 {
	draw_text(round(x) + 100, round(y) - 3, string(global.minutes) + ":0" + string(global.seconds));
} else if global.seconds >= 10 && global.minutes < 10 {
	draw_text(round(x) + 100, round(y) - 3, string(global.minutes) + ":" + string(global.seconds));
}

draw_set_font(global.font_main);