draw_set_font(global.font_main)
draw_self();

draw_sprite(spr_OptionCheckbox, global.ExtendCamera, x + 225, y - 5);


if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Camera trails a \nbit & gives \nmore room to \nreact when at \na certain speed.");
}