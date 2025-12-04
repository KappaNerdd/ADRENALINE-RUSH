draw_set_font(global.font_main)
draw_self();

draw_sprite(spr_OptionCheckbox, global.SongTag, x + 125, y - 5);


if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Occasionally show \nwhat song/track is \nplaying, who \ncomposed it, and \nthe length of the \ntrack/song.");
}