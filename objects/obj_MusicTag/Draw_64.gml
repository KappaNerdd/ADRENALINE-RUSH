display_set_gui_size(640, 360);

var _musicTag = scr_LocalText("game_NP") + "\n----------------------------";
var _names = scr_LocalText("game_Track") + ": " + string(songName) + "\n" + scr_LocalText("game_By") + ": " + string(songCredits) + "\n" + scr_LocalText("game_Length") + ": " + string(songLength);
var _musicTagHeight = string_height_ext(_musicTag, -1, 250);
var _nameHeight = string_height_ext(_names, -1, 250)

var _spriteHeight = sprite_get_height(spr_WhiteTrans);
var _scaleFactor = ((_musicTagHeight + _nameHeight) / _spriteHeight) / 1.5;

if global.SongTag {
	draw_sprite_ext(spr_WhiteTrans, image_index, 465, 5, 5.25, _scaleFactor, 0, c_black, textAlpha / 2);
	
	draw_set_halign(fa_center);
		draw_text_ext_transformed_color(465 + 84, 10, string(_musicTag), -1, 250, 0.6, 0.6, 0, c_white, c_white, global.fullRGB, global.fullRGB, textAlpha);
	draw_set_halign(fa_left);
	
	draw_text_ext_transformed_color(475, 38, string(_names), -1, 250, 0.6, 0.6, 0, c_white, c_white, global.fullRGB, global.fullRGB, textAlpha);
}