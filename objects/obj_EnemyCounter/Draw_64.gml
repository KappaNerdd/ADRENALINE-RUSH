display_set_gui_size(768, 432);

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _playX = 0;
var _playY = 0;

if instance_exists(obj_Player) {
	_playX = obj_Player.x;
	_playY = obj_Player.y;
}

var _relX = _playX - _camX;
var _relY = _playY - _camY;


if _relX >= 650 && _relY <= 115 {
	image_alpha = lerp(image_alpha, 0.5, 0.5);
} else {
	image_alpha = lerp(image_alpha, 1, 0.25);
}

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
	
	draw_sprite_ext(spr_EnemyCounterText, global.MIND, fakeX + _shakeX + 3, fakeY + _shakeY + 3, graphScale, graphScale * textScale2, 0, c_black, image_alpha);
	draw_text_transformed_color(fakeX + _shakeX + 3, fakeY + _shakeY + 43, _extra0 + string(enemyCount), textScale, textScale * textScale2, 0, c_black, c_black, c_black, c_black, image_alpha);
	
	draw_sprite_ext(spr_EnemyCounterText, global.MIND, fakeX + _shakeX, fakeY + _shakeY, graphScale, graphScale * textScale2, 0, c_white, image_alpha);
	draw_text_transformed_color(fakeX + _shakeX, fakeY + _shakeY + 40, _extra0 + string(enemyCount), textScale, textScale * textScale2, 0, c_white, c_white, global.fullRGB, global.fullRGB, image_alpha);
draw_set_font(global.font_main);
draw_set_halign(fa_left);
draw_set_valign(fa_top);