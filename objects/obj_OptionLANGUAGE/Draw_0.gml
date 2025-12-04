draw_set_font(global.font_main)
draw_self();

if global.Language == 1 {
	draw_text(x + 142, y, "ENGLISH");
}

if global.Language == 2 {
	draw_text(x + 142, y, "ESPAÑOL (LATAM)");
}


if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Change the \nlanguage of the \ngame's text & visuals. \n(Unfinished.)");
}