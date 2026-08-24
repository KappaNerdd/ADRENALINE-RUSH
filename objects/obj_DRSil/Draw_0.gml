var _col = image_blend;

if global.MIND or global.PlayerChar == 0 {
	_col = c_black;
}

if global.PlayerID != noone {
	var _char = global.PlayerID;
	var _charSpr = _char.sprite_index;
	var _charIndex = _char.image_index;
	var _charX = _char.x;
	var _charY = _char.y;
	var _charXScale = _char.visXScale;
	var _charYScale = _char.image_yscale;
	var _charAngle = _char.drawAngle;
	var _change = 3;
	
	if !global.Outline {
		_change = 1;
	}
	
	if global.PlayerID.visible {
		if !outline {
			gpu_set_fog(true, c_dkgrey, 0, 1);
				draw_sprite_ext(_charSpr, _charIndex, round(_charX), round(_charY), _charXScale, _charYScale, _charAngle, image_blend, image_alpha);
			gpu_set_fog(false, c_black, 0, 1);
		} else {
			gpu_set_fog(true, _col, 0, 1);
				draw_sprite_ext(_charSpr, _charIndex, round(_charX) + _change, round(_charY), _charXScale, _charYScale, _charAngle, image_blend, image_alpha * 2);
				draw_sprite_ext(_charSpr, _charIndex, round(_charX) - _change, round(_charY), _charXScale, _charYScale, _charAngle, image_blend, image_alpha * 2);
				draw_sprite_ext(_charSpr, _charIndex, round(_charX), round(_charY) + _change, _charXScale, _charYScale, _charAngle, image_blend, image_alpha * 2);
				draw_sprite_ext(_charSpr, _charIndex, round(_charX), round(_charY) - _change, _charXScale, _charYScale, _charAngle, image_blend, image_alpha * 2);
			gpu_set_fog(false, c_black, 0, 1);
		}
	}
}