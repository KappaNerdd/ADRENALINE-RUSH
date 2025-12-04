draw_set_font(global.font_main)
draw_self();

draw_sprite(spr_ConsoleLogos, global.ConType, x + 195, y - 5);


if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Choose what type \nof controller \nbuttons to display \nwhen a controller \nis connected.");
}