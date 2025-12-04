var _trickFont = global.EnemyComboFontHead;

if !global.MIND && global.PlayerChar != 0 {
	_trickFont = global.EnemyComboFont;
}

draw_set_font(_trickFont);

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


if _relX >= 540 {
	image_alpha = lerp(image_alpha, 0.5, 0.5);
} else {
	image_alpha = lerp(image_alpha, 1, 0.25);
}


draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _trickNum = personalTrick;
var _iconFrames = 0;
var _iconSprite = iconSprite;

if personalTrick >= 6 {
	_iconSprite = _liveSprite3;
}

if personalTrick < 6 {
	if personalTrick < 2 {
		_iconFrames = 0;
	} else if personalTrick < 4 && personalTrick >= 2 {
		_iconFrames = 1;
	} else if personalTrick >= 4 {
		_iconFrames = 2;
	}
} else {
	_iconFrames = iconFrames;
}

//Icons
if startI1X >= 8 {
	draw_sprite_ext(_iconSprite, _iconFrames, startI1X + 3, startI1Y + 3, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(_iconSprite, _iconFrames, startI1X, startI1Y, 1.5, 1.5, 0, c_white, image_alpha);
}

if startI2X >= 8 {
	draw_sprite_ext(_iconSprite, _iconFrames, startI2X + 3, startI2Y + 3, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(_iconSprite, _iconFrames, startI2X, startI2Y, 1.5, 1.5, 0, c_white, image_alpha);
}

if startI3X >= 8 {
	draw_sprite_ext(_iconSprite, _iconFrames, startI3X + 3, startI3Y + 3, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(_iconSprite, _iconFrames, startI3X, startI3Y, 1.5, 1.5, 0, c_white, image_alpha);
}

if startI4X >= 8 {
	draw_sprite_ext(_iconSprite, _iconFrames, startI4X + 3, startI4Y + 3, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(_iconSprite, _iconFrames, startI4X, startI4Y, 1.5, 1.5, 0, c_white, image_alpha);
}

if startI5X >= 8 {
	draw_sprite_ext(_iconSprite, _iconFrames, startI5X + 3, startI5Y + 3, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(_iconSprite, _iconFrames, startI5X, startI5Y, 1.5, 1.5, 0, c_white, image_alpha);
}

if startI6X >= 8 {
	draw_sprite_ext(_iconSprite, _iconFrames, startI6X + 3, startI6Y + 3, 1.5, 1.5, 0, c_black, image_alpha);
	draw_sprite_ext(_iconSprite, _iconFrames, startI6X, startI6Y, 1.5, 1.5, 0, c_white, image_alpha);
}

draw_text_transformed_color(textX + 3, textY + 3, string(_trickNum), numberScale, numberScale, 0, c_black, c_black, c_black, c_black, image_alpha);
draw_text_transformed_color(textX, textY, string(_trickNum), numberScale, numberScale, 0, c_white, c_white, global.fullRGB, global.fullRGB, image_alpha);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(global.font_main);