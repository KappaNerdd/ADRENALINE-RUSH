draw_sprite_ext(sprite_index, image_index, 0, 0, 38.5, 22, 0, c_white, 1);

var _checkY = 230;

if !chowder {
	if !showLucifer {
		gpu_set_fog(true, c_blue, 0, 1);
			draw_sprite_ext(spr_KappaTitle, 0, 200 - 10, _checkY - 10, 0.66, 0.66, 0, c_white, 1);
		gpu_set_fog(false, c_black, 0, 1);
		
		draw_sprite_ext(spr_KappaTitle, 0, 200, _checkY, 0.66, 0.66, 0, c_white, 1);
	} else {
		gpu_set_fog(true, c_fuchsia, 0, 1);
			draw_sprite_ext(spr_LuciferTitle, 0, 568 + 10, _checkY - 10, 0.66, 0.66, 0, c_white, 1);
		gpu_set_fog(false, c_black, 0, 1);
		
		draw_sprite_ext(spr_LuciferTitle, 0, 568, _checkY, 0.66, 0.66, 0, c_white, 1);
	}
} else {
	gpu_set_fog(true, c_blue, 0, 1);
		draw_sprite_ext(spr_KappaTitle, 0, 200 - 10, _checkY - 10, 0.66, 0.66, 0, c_white, 1);
	gpu_set_fog(false, c_black, 0, 1);
	
	gpu_set_fog(true, c_fuchsia, 0, 1);
		draw_sprite_ext(spr_LuciferTitle, 0, 568 + 10, _checkY - 10, 0.66, 0.66, 0, c_white, 1);
	gpu_set_fog(false, c_black, 0, 1);
	
	draw_sprite_ext(spr_KappaTitle, 0, 200, _checkY, 0.66, 0.66, 0, c_white, 1);
	draw_sprite_ext(spr_LuciferTitle, 0, 568, _checkY, 0.66, 0.66, 0, c_white, 1);
}

draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, 820, 50, 3, 3, -135, c_fuchsia, 1);
draw_sprite_ext(spr_SonicRushSpikesNorm, srSpikesIndex, -52, 382, 3, 3, 45, c_blue, 1);

surface_set_target(surfaceMask);
	draw_sprite_ext(spr_RainSplash, 0, 0, 0, 768 / 4, 432 / 2, 0, c_black, 1);
	draw_sprite_ext(spr_RainSplash, 0, 768 / 2, 0, 768 / 4, 432 / 2, 0, c_black, 1);

	gpu_set_blendmode(bm_subtract);
		var _newX = 768;
		var _angleMult = 1;
		
		if showLucifer {
			_newX = 0;
			_angleMult = -1;
		}
		
		if noSurface {
			if !showLucifer {
				var _name = "name_Kap";
				
				if showBluey {
					_name = "name_Kappa";
				}
				
				draw_sprite_ext(spr_RainSplash, 0, 0, 0, 768 / 4, 432 / 2, 0, c_white, 1);
				
				draw_set_halign(fa_center);
					draw_text_ext_transformed_color(568, 50, scr_LocalText(_name), 40, 50, 3, 5, 0, c_black, c_black, c_black, c_black, 1);
				draw_set_halign(fa_left);
			} else {
				var _name = "name_Luci";
				
				if showNurple {
					_name = "name_Lucifer";
				}
				
				draw_sprite_ext(spr_RainSplash, 0, 768 / 2, 0, 768 / 4, 432 / 2, 0, c_white, 1);
				
				draw_set_halign(fa_center);
					draw_text_ext_transformed_color(200, 50, scr_LocalText(_name), 40, 50, 3, 5, 0, c_black, c_black, c_black, c_black, 1);
				draw_set_halign(fa_left);
			}
		} else {
			if !chowder {
				draw_sprite_ext(spr_TitleLight, 0, _newX, 432, 2, 2.25, lightAngle * _angleMult, c_white, 1);
			} else {
				draw_sprite_ext(spr_TitleLight, 0, 0, 432, lightScale, 2.25, 50 + -lightAngle, c_white, 1);
				draw_sprite_ext(spr_TitleLight, 0, 768, 432, lightScale, 2.25, -10 + lightAngle, c_white, 1);
			}
		}
	gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_surface(surfaceMask, x, y);

var _scaleChange = 2;
var _checkOtherY = 300;

draw_sprite_ext(spr_TitleLogoNormal, 0, 768 / 2, _checkOtherY, _scaleChange / 3, _scaleChange / 3, 0, c_white, catAlpha);

draw_sprite_ext(spr_TitleNewPiecesEN, 0, moveLeft, _checkOtherY, _scaleChange, _scaleChange, 0, c_white, 1);
draw_sprite_ext(spr_TitleNewPiecesEN, 3, moveRight, _checkOtherY, _scaleChange, _scaleChange, 0, c_white, 1);

draw_sprite_ext(spr_TitleNewPiecesEN, 1, 768 / 2, _checkOtherY, _scaleChange * a_Scale, _scaleChange * a_Scale, a_Angle, c_white, a_Alpha);
draw_sprite_ext(spr_TitleNewPiecesEN, 2, r_Move, _checkOtherY, _scaleChange, _scaleChange, 0, c_white, 1);

if blueArrow {
	gpu_set_fog(true, c_white, 0, 1);
		draw_sprite_ext(spr_TitleNewPiecesEN, 0, moveLeft, _checkOtherY, _scaleChange, _scaleChange, 0, c_white, titleWhite);
	gpu_set_fog(false, c_black, 0, 1);
}

if purpleArrow {
	gpu_set_fog(true, c_white, 0, 1);
		draw_sprite_ext(spr_TitleNewPiecesEN, 3, moveRight, _checkOtherY, _scaleChange, _scaleChange, 0, c_white, titleWhite);
	gpu_set_fog(false, c_black, 0, 1);
}

if chowder { //Old Cartoon Network heads will know why I named this variable like this
	gpu_set_fog(true, c_white, 0, 1);
		draw_sprite_ext(spr_TitleNewPiecesEN, 1, 768 / 2, _checkOtherY, _scaleChange * a_Scale, _scaleChange * a_Scale, a_Angle, c_white, titleWhite);
		draw_sprite_ext(spr_TitleNewPiecesEN, 2, r_Move, _checkOtherY, _scaleChange, _scaleChange, 0, c_white, titleWhite);
	gpu_set_fog(false, c_black, 0, 1);
}