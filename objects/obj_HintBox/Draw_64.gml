display_set_gui_size(768, 432);

draw_sprite_ext(spr_TextboxULTRAKILL, 0, moveX, moveY, changeXScale, changeYScale, 0, c_white, 0.6);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
	if changeYScale >= 5.8 {
		if hintNum == 0 {
			draw_text_transformed(moveX, moveY - 130, scr_LocalText(string(hintName)) + "\n----------------", 2, 2, 0);
		
			for(var i = 0; i < array_length(hint); i++) {
				var _gap = 140 * i;
				var _moveX = moveX - (_gap / 2);
				var _moveY = moveY - 70;
			
				if is_string(hint[i]) {
					var _scale = 1;
					
					if string_length(string(hint[i])) == 1 {
						_scale = 2;
					}
					
					draw_set_halign(fa_left);
						draw_text_transformed(_moveX + (_gap / 4) - 12, _moveY, scr_LocalText(hint[i]), _scale, _scale, 0);
					draw_set_halign(fa_middle);
				} else {
					draw_sprite(global.ConSpr, hint[i], _moveX, _moveY);
				}
			}
			
			if sprite_index != noone {
				draw_sprite_ext(sprite_index, image_index, moveX, moveY + 60, 2, 2, 0, c_white, 1);
			}
		} else {
			draw_text_ext(moveX, moveY, scr_LocalText(hintDesc), 21, 300);
		}
	}
	
	if changeYScale >= 5.8 {
		if hintDesc != noone {
			draw_text(moveX, moveY + 160, string(hintNum + 1) + " / 2");
			
			draw_sprite(global.ConSpr, global.ConS_L, moveX - 150, moveY + 160);
			draw_sprite(global.ConSpr, global.ConS_R, moveX + 86, moveY + 160);
		}
	}
draw_set_halign(fa_left);
draw_set_valign(fa_top);