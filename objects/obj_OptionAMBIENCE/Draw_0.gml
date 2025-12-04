draw_set_font(global.font_main)
draw_self();

draw_sprite(spr_AudioSlider, global.AMBIENCE_VOL * 10, x + 145, y - 10);

if place_meeting(x, y, obj_TitleCursor) {
	draw_text(30, 30, "Control how loud \nthe game's ambiance \nvolume is. \n(Goes down by \n10% each click.)");
}