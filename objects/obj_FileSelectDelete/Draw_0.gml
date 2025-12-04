draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);


draw_set_halign(fa_center);

	draw_text_color(x + sprite_width / 2, y + 8, "DELETE", c_white, image_blend, image_blend, image_blend, image_alpha);

draw_set_halign(fa_left);


var _xscaleChange = 1;

if string_length(string(copyText)) > 17 {
	_xscaleChange = 0.8;
}

if global.deleteFile {
	draw_text_transformed_color(obj_FileSelectCopy.x + 78, y - 20, string(copyText), _xscaleChange, 1, 0, c_white, c_white, c_white, c_white, image_alpha);
		
	if !global.SimplifyVFX {
		draw_text_transformed_color(obj_FileSelectCopy.x + 78, y - 20, string(copyText), _xscaleChange, 1, 0, c_red, c_red, c_red, c_red, copyTextAlpha);
	}
}