display_set_gui_size(global.CamWidth, global.CamHeight);

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _relX = moveX;
var _relY = moveY

if !miss && !parry {
	draw_set_font(global.DRDamageFont);
	draw_set_valign(fa_bottom);
		var _add = "+";
		
		if is_string(amount) {
			_add = "";
		} else {
			if amount < 0 {
				_add = "";
			}
		}
	
		draw_text_transformed_color(_relX, _relY, _add + string(amount), image_xscale, image_yscale, image_angle, col, col, col, col, image_alpha);
	draw_set_valign(fa_top);
	draw_set_font(global.font_main);
} else {
	var _index = 0;
	
	if parry {
		_index = 1;
	}
	
	draw_sprite_ext(spr_DRExtraFonts, _index, _relX, _relY, image_xscale, image_yscale, image_angle, col, image_alpha);
}