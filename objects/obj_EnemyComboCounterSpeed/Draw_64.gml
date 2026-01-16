display_set_gui_size(768, 432);

var _changeY = 392;
var _changeX = 568;

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


if _relY >= 700 {
	image_alpha = lerp(image_alpha, 0.5, 0.5);
} else {
	image_alpha = lerp(image_alpha, 1, 0.25);
}

if sizeChange > 1 {
	sizeChange -= 0.01;
	
	if !global.SimplifyVFX {
		var shake = power(4, 2) * 0.1 * obj_Player.enemyCombo / 4;
		newX = random_range(-shake, shake);
		newY = random_range(-shake, shake);
	
		newX2 = random_range(-shake, shake);
		newY2 = random_range(-shake, shake);
		
		newX3 = random_range(-shake, shake);
		newY3 = random_range(-shake, shake);
	}
} else {
	sizeChange = 1;
	
	newX = 0;
	newY = 0;
	
	newX2 = 0;
	newY2 = 0;
	
	newX3 = 0;
	newY3 = 0;
}

if obj_Player.enemyCombo > 0 {
	var _comboHits = spr_EnemyComboHITS;
	var _comboFont = global.EnemyComboFont;
	
	if global.MIND or global.PlayerChar == 0 {
		_comboHits = spr_EnemyComboHITSHead;
		_comboFont = global.EnemyComboFontHead;
	}
	
	draw_sprite_ext(sprite_index, image_index, _changeX + newX3, _changeY + newY3 - 30, sizeChange, sizeChange, 0, c_white, image_alpha);
	draw_sprite_ext(_comboHits, image_index, _changeX + newX + 80, _changeY + newY, sizeChange, sizeChange, 0, c_white, image_alpha);

	draw_set_font(_comboFont);
	draw_set_halign(fa_right);
	
		if obj_Player.enemyCombo < 10 {
			draw_text_transformed_color(_changeX + newX2 + 50, _changeY + newY2, "0" + string(obj_Player.enemyCombo), sizeChange, sizeChange, 0, c_white, global.fullRGB, global.fullRGB, global.fullRGB, image_alpha);
		} else {
			draw_text_transformed_color(_changeX + newX2 + 50, _changeY + newY2, string(obj_Player.enemyCombo), sizeChange, sizeChange, 0, c_white, global.fullRGB, global.fullRGB, global.fullRGB, image_alpha);
		}
		
	draw_set_halign(fa_left);	
	draw_set_font(global.font_main);
	
	draw_sprite_ext(spr_RainSplash, 0, _changeX + 10, _changeY + 25, 90 / obj_Player.enemyComboFrames * obj_Player.enemyComboTimer, 2, 0, global.fullRGB, image_alpha);
	
}