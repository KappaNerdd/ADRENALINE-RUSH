if instance_exists(self) {	
	draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, drawAngle, image_blend, image_alpha);
}
/*draw_set_font(global.font_main);
	draw_set_color(c_white);

if global.DEBUG == true && instance_exists(self) {
	draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_red, 0.5);
}