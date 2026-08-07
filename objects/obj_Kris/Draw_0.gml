var _change = 1;
var _change2 = 2;
var _col1 = c_white;
var _col2 = c_black;
var _jacobAlpharad = image_alpha * extraAlpha;
	
extraXscale = lerp(extraXscale, 1, 0.1);
	
if global.Outline {
	gpu_set_fog(true, _col2, 0, 1);
		draw_sprite_ext(sprite_index, image_index, round(x) + _change2, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, round(x) - _change2, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change2, visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change2, visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
	gpu_set_fog(false, c_black, 0, 1);
	
	gpu_set_fog(true, _col1, 0, 1);
		draw_sprite_ext(sprite_index, image_index, round(x) + _change, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, round(x) - _change, round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change, visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
		draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change, visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
	gpu_set_fog(false, c_black, 0, 1);
}
	
#region //Shader Shit
	shader_set(shd_PaletteSwap);
		var _target = shader_get_sampler_index(shd_PaletteSwap, "samp_target");
		var _replace = shader_get_sampler_index(shd_PaletteSwap, "samp_replace");
		
		texture_set_stage(_target, sprite_get_texture(basePal, 0));
		texture_set_stage(_replace, sprite_get_texture(headPal, 0))
		
		draw_sprite_ext(sprite_index, image_index, round(x), round(y), visXScale * extraXscale, image_yscale, drawAngle, image_blend, _jacobAlpharad);
	shader_reset();
#endregion	
	
draw_sprite_ext(sprite_index, image_index, round(x), round(y), visXScale, image_yscale, 0, c_white, x / 1000);