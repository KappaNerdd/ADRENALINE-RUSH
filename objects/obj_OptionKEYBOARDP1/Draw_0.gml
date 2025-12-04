draw_sprite(sprite_index, image_index, x, y);

draw_sprite(spr_OptionCheckbox, global.KeyboardP1, x + 170, y - 5);


if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Make your \nkeyboard always \nbe Player 1 & your \nfirst controller \nwill be Player 2.");
}