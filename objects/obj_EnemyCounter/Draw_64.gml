display_set_gui_size(768, 432);

var _font = global.EnemyComboFontHead;

if !global.MIND && global.PlayerChar != 0 {
	_font = global.EnemyComboFont;
}

draw_set_font(_font);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
	var _shakeX = 0;
	var _shakeY = 0;
	var _extra0 = "0";
	
	if enemyCount >= 10 {
		_extra0 = "";
	}
	
	if createTimer > 0 && shake {
		createTimer--;
		
		if !global.SimplifyVFX {
			_shakeX = random_range(-3, 3);
			_shakeY = random_range(-3, 3);
		}
	}
	
	draw_sprite_ext(spr_EnemyCounterText, global.MIND, fakeX + _shakeX + 3, fakeY + _shakeY + 3, graphScale, graphScale * textScale2, 0, c_black, 1);
	draw_text_transformed_color(fakeX + _shakeX + 3, fakeY + _shakeY + 43, _extra0 + string(enemyCount), textScale, textScale * textScale2, 0, c_black, c_black, c_black, c_black, 1);
	
	draw_sprite_ext(spr_EnemyCounterText, global.MIND, fakeX + _shakeX, fakeY + _shakeY, graphScale, graphScale * textScale2, 0, c_white, 1);
	draw_text_transformed_color(fakeX + _shakeX, fakeY + _shakeY + 40, _extra0 + string(enemyCount), textScale, textScale * textScale2, 0, c_white, c_white, global.fullRGB, global.fullRGB, 1);
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);