draw_self();

draw_sprite(spr_OptionCheckbox, global.ControllerOnly, x + 195, y - 5);


if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Only use a \ncontroller. A \nscreen shows if \nno controller is \ndetected. \n(Turns off \nKeyboard P1.)");
}