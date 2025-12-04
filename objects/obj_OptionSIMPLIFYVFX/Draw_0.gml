draw_set_font(global.font_main)
draw_self();

draw_sprite(spr_OptionCheckbox, global.SimplifyVFX, x + 170, y - 5);

if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Simplify, stop, \nor remove visual \neffects for ease \non the eyes.");
}