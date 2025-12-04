draw_set_font(global.font_main)
draw_self();

draw_sprite(spr_OptionCheckbox, global.Particles, x + 135, y - 5);

if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Control whether \nparticles (like \nweather particles) \nappear or not.");
}