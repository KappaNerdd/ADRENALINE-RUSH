var _camX = camera_get_view_x(view_camera[0]);
var _camXAdd = 400;
var _camY = camera_get_view_y(view_camera[0]);

if specialIdle && image_index >= 2 {
	var _change = 1;
	var _change2 = 2;
	var _col1 = c_white;
	var _col2 = c_black;
	
	specialAngle += 1;
	
	if specialAngle >= 360 {
		specialAngle = 0;
	}
	
	var _extraY = -5 + lengthdir_y(5, specialAngle);
	
	if global.MIND or global.PlayerChar == 0 {
		_col1 = c_black;
		_col2 = c_white;
	}
	
	extraXscale = lerp(extraXscale, 1, 0.1);
	
	if global.Outline {
		gpu_set_fog(true, _col2, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change2, round(y) + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change2, round(y) + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change2 + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change2 + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	
		gpu_set_fog(true, _col1, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x) + _change, round(y) + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x) - _change, round(y) + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _change + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) - _change + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	}
	
	#region //Shader Shit
		shader_set(shd_PaletteSwap);
			var _target = shader_get_sampler_index(shd_PaletteSwap, "samp_target");
			var _replace = shader_get_sampler_index(shd_PaletteSwap, "samp_replace");
			
			texture_set_stage(_target, sprite_get_texture(basePal, 0));
			texture_set_stage(_replace, sprite_get_texture(headPal, 0))
			
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _extraY, visXScale * extraXscale, image_yscale, drawAngle, image_blend, image_alpha);
		shader_reset();
	#endregion
	
	if rushMode && !global.SimplifyVFX {
		gpu_set_fog(true, rushColor, 0, 1);
			draw_sprite_ext(sprite_index, image_index, round(x), round(y) + _extraY, visXScale * extraXscale, image_yscale, drawAngle, rushColor, rushModeAlpha * image_alpha);
		gpu_set_fog(false, c_black, 0, 1);
	}
	
	if rushModeColor {
		if rushModeAlpha < 0.5 {
			rushModeAlpha += 0.01;
		}
		
		if rushModeAlpha >= 0.5 {
			rushModeColor = false;
		}
	} else {
		if rushModeAlpha > 0 {
			rushModeAlpha -= 0.01;
		}
		
		if rushModeAlpha <= 0 {
			rushModeColor = true;
		}
	}
} else {
	scr_RushModeColorDraw();
	specialAngle = 0;
}

var _xscale = visXScale;
var _humming = spr_LuciferHummingVFX;

if global.MIND {
	_humming = spr_HeadHummingVFX;
}

if backTrick {
	draw_sprite_ext(_humming, image_index, x, y - 16, _xscale, 1, drawAngle, c_white, 1);
}

if railGrind {
	var _rail = spr_RailGrindSparksVFX;
	
	if global.MIND {
		_rail = spr_RailGrindHeadVFX;
	}
	
	draw_sprite_ext(_rail, railGrindSprFrames, x + angleSin * 13, y + angleCos * 13, 1.25 * _xscale, 0.25, drawAngle, c_white, 1);
}

if global.DEBUG {
	draw_text(_camX + _camXAdd, _camY + 20, "ground: " + string(ground));
	draw_text(_camX + _camXAdd, _camY + 40, "vel: " + string(vel));
	draw_text(_camX + _camXAdd, _camY + 60, "canMove: " + string(can_Move));
	draw_text(_camX + _camXAdd, _camY + 80, "yspd: " + string(yspd));
	draw_text(_camX + _camXAdd, _camY + 100, "groundAngle: " + string(angle));
	draw_text(_camX + _camXAdd, _camY + 120, "edgeColl: " + string(edgeCollision));
	draw_text(_camX + _camXAdd, _camY + 140, "bottomColl: " + string(bottomCollision));
	draw_text(_camX + _camXAdd, _camY + 160, "collisionTest: " + string(collisionTest));
}