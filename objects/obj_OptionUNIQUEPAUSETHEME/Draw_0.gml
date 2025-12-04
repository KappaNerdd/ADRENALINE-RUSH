draw_set_font(global.font_main)
draw_self();

draw_sprite(spr_OptionCheckbox, global.UniquePauseTheme, x + 280, y - 5);


if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Have a character-\nspecific theme \nplay when you \npause the game.");
}