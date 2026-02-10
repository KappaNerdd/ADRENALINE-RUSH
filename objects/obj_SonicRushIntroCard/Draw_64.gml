display_set_gui_size(global.CamWidth, global.CamHeight);

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

levelXscale = lerp(levelXscale, 0.5, 0.05);
levelXMove = lerp(levelXMove, 20, 0.05);
levelXMove2 += 0.25;

var _xMove = levelXMove + levelXMove2;
var _char = global.PlayerSelection[global.PlayerChar][28][4];

draw_sprite_ext(sprite_index, 0, 0, 0, 28, 16.5, 0, c_white, whiteAlpha);
draw_sprite_ext(_charCheck, global.PlayerCostume, -_xMove + spikeX + 434, -100, 1, 1, 0, c_white, (otheralpha / 2) * mainAlpha);
draw_sprite_ext(obj_Player.sprite_index, obj_Player.image_index, charX + _relX, _relY, obj_Player.image_xscale * charScale, obj_Player.image_yscale * charScale, obj_Player.drawAngle, c_black, mainAlpha);
draw_sprite_ext(_char, 0, 650, 50, 1, 1, 0, c_white, otheralpha * mainAlpha);

mindFrames += mindAnim;

if mindFrames >= 3 {
	mindFrames = 0;
}

rankFrames += rankAnim;

if rankFrames >= 60 {
	rankFrames = 0;
}

var _rankFrameAnim = mindFrames;

if !global.MIND && global.PlayerChar != 0 {
	_rankFrameAnim = rankFrames;
}

var _level = global.speedStageData[global.SpeedSelected];
var _timeSeconds = _level.seconds;
var _timeMinutes = _level.minutes;
var _extra0Minutes = "0";
var _extra0Seconds = "0";

if _timeSeconds >= 10 {
	_extra0Seconds = "";
}

var _font = global.EnemyComboFont;
var _plusUltra = 0;

if global.PlayerChar == 0 or global.MIND {
	_font = global.EnemyComboFontHead;
	_plusUltra = 7;
}

draw_set_font(_font);
	var _timeString = string(_timeMinutes) + ":" + string(_extra0Seconds) + string(_timeSeconds); 
	var _timeStringWidth = string_width(_timeString);
	
	draw_text_transformed_color(_xMove - 3, 233, _timeString, levelXscale * 2, 1, 0, c_black, c_black, c_black, c_black, otheralpha);
	draw_sprite_ext(ranks[_level.rankTime + _plusUltra], _rankFrameAnim, _xMove - 3 + _timeStringWidth + 20, 228, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);
	draw_sprite_ext(_level.player_SpriteTime, _level.player_CostumeTime, _xMove - 3 + _timeStringWidth + sprite_get_width(ranks[_level.rankTime]) + 20, 228, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);

	draw_text_transformed_color(_xMove, 230, _timeString, levelXscale * 2, 1, 0, c_white, c_white, c_white, c_white, otheralpha);
	draw_sprite_ext(ranks[_level.rankTime + _plusUltra], _rankFrameAnim, _xMove + _timeStringWidth + 20, 225, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	draw_sprite_ext(_level.player_SpriteTime, _level.player_CostumeTime, _xMove + _timeStringWidth + sprite_get_width(ranks[_level.rankTime]) + 20, 225, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	
	
	var _extra0s = "000000";
	
	if _level.gameScore < 1000000 && _level.gameScore >= 100000 {
		_extra0s = "0";
	} else if _level.gameScore < 100000 && _level.gameScore >= 10000 {
		_extra0s = "00";
	} else if _level.gameScore < 10000 && _level.gameScore >= 1000 {
		_extra0s = "000";
	} else if _level.gameScore < 1000 && _level.gameScore >= 100 {
		_extra0s = "0000";
	} else if _level.gameScore < 100 && _level.gameScore >= 10 {
		_extra0s = "00000";
	} else if _level.gameScore < 10 {
		_extra0s = "000000";
	}
	
	var _scoreString = string(_extra0s) + string(_level.gameScore);
	var _scoreStringWidth = string_width(_scoreString);
	
	
	draw_text_transformed_color(_xMove - 3, 283, _scoreString, levelXscale * 2, 1, 0, c_black, c_black, c_black, c_black, otheralpha);
	draw_sprite_ext(ranks[_level.rankScore + _plusUltra], _rankFrameAnim, _xMove + _scoreStringWidth + 17, 278, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);
	draw_sprite_ext(_level.player_SpriteScore, _level.player_CostumeScore, _xMove + _scoreStringWidth + sprite_get_width(ranks[_level.rankScore]) + 17, 278, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);
	
	draw_text_transformed_color(_xMove, 280, _scoreString, levelXscale * 2, 1, 0, c_white, c_white, c_white, c_white, otheralpha);
	draw_sprite_ext(ranks[_level.rankScore + _plusUltra], _rankFrameAnim, _xMove + _scoreStringWidth + 20, 275, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	draw_sprite_ext(_level.player_SpriteScore, _level.player_CostumeScore, _xMove + _scoreStringWidth + sprite_get_width(ranks[_level.rankScore]) + 20, 275, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	
	
	var _extra0sRings = "";
	
	if _level.rings >= 10 && _level.rings < 100 {
		_extra0sRings = "0";
	} else if _level.rings < 10 {
		_extra0sRings = "00";
	}
	
	var _ringString = string(_extra0sRings) + string(_level.rings)
	var _ringStringWidth = string_width(_ringString);
	
	draw_text_transformed_color(_xMove - 3, 333, _ringString, levelXscale * 2, 1, 0, c_black, c_black, c_black, c_black, otheralpha);
	draw_sprite_ext(ranks[_level.rings_Rank + _plusUltra], _rankFrameAnim, _xMove + _ringStringWidth + 17, 328, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);
	draw_sprite_ext(_level.player_SpriteRings, _level.player_CostumeRings, _xMove + _ringStringWidth + sprite_get_width(ranks[_level.rings_Rank]) + 17, 328, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);
	
	draw_text_transformed_color(_xMove, 330, _ringString, levelXscale * 2, 1, 0, c_white, c_white, c_white, c_white, otheralpha);
	draw_sprite_ext(ranks[_level.rings_Rank + _plusUltra], _rankFrameAnim, _xMove + _ringStringWidth + 20, 325, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	draw_sprite_ext(_level.player_SpriteRings, _level.player_CostumeRings, _xMove + _ringStringWidth + sprite_get_width(ranks[_level.rings_Rank]) + 20, 325, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	
	
	var _enemyString = string(_level.enemies);
	var _enemyStringWidth = string_width(_enemyString);
	
	draw_text_transformed_color(_xMove - 3, 383, _enemyString, levelXscale * 2, 1, 0, c_black, c_black, c_black, c_black, otheralpha);
	draw_sprite_ext(ranks[_level.enemy_Rank + _plusUltra], _rankFrameAnim, _xMove + _enemyStringWidth + 17, 378, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);
	draw_sprite_ext(_level.player_SpriteEnemy, _level.player_CostumeEnemy, _xMove + _enemyStringWidth + sprite_get_width(ranks[_level.enemy_Rank]) + 17, 378, levelXscale * 1.5, 0.75, 0, c_black, otheralpha);
	
	
	draw_text_transformed_color(_xMove, 380, _enemyString, levelXscale * 2, 1, 0, c_white, c_white, c_white, c_white, otheralpha);
	draw_sprite_ext(ranks[_level.enemy_Rank + _plusUltra], _rankFrameAnim, _xMove + _enemyStringWidth + 20, 375, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	draw_sprite_ext(_level.player_SpriteEnemy, _level.player_CostumeEnemy, _xMove + _enemyStringWidth + sprite_get_width(ranks[_level.enemy_Rank]) + 20, 375, levelXscale * 1.5, 0.75, 0, c_white, otheralpha);
	
	
	draw_sprite_ext(ranks[_level.rank + _plusUltra], _rankFrameAnim, _xMove - 3, 148, levelXscale * 2, 1, 0, c_black, otheralpha);
	draw_sprite_ext(_level.player_Sprite, _level.player_Costume, _xMove - 3 + (sprite_get_width(ranks[_level.rank]) * 1) + 20, 148, levelXscale * 2, 1, 0, c_black, otheralpha);
	
	draw_sprite_ext(ranks[_level.rank + _plusUltra], _rankFrameAnim, _xMove, 145, levelXscale * 2, 1, 0, c_white, otheralpha);
	draw_sprite_ext(_level.player_Sprite, _level.player_Costume, _xMove + (sprite_get_width(ranks[_level.rank]) * 1) + 20, 145, levelXscale * 2, 1, 0, c_white, otheralpha);
draw_set_font(global.font_main);


draw_sprite_ext(_level.stage_Sprite, mindFrames, _xMove - 5, 15, levelXscale, 0.5, 0, c_black, otheralpha);

draw_sprite_ext(_level.stage_Sprite, mindFrames, _xMove + 1, 10, levelXscale, 0.5, 0, c_black, otheralpha);
draw_sprite_ext(_level.stage_Sprite, mindFrames, _xMove - 1, 10, levelXscale, 0.5, 0, c_black, otheralpha);
draw_sprite_ext(_level.stage_Sprite, mindFrames, _xMove, 10 + 1, levelXscale, 0.5, 0, c_black, otheralpha);
draw_sprite_ext(_level.stage_Sprite, mindFrames, _xMove, 10 - 1, levelXscale, 0.5, 0, c_black, otheralpha);

draw_sprite_ext(_level.stage_Sprite, mindFrames, _xMove, 10, levelXscale, 0.5, 0, c_white, otheralpha);


draw_sprite_ext(_level.level_Sprite, mindFrames, _xMove - 3, 103, levelXscale * 2, 1, 0, c_black, otheralpha);

draw_sprite_ext(_level.level_Sprite, mindFrames, _xMove + 1, 100, levelXscale * 2, 1, 0, c_black, otheralpha);
draw_sprite_ext(_level.level_Sprite, mindFrames, _xMove - 1, 100, levelXscale * 2, 1, 0, c_black, otheralpha);
draw_sprite_ext(_level.level_Sprite, mindFrames, _xMove, 100 + 1, levelXscale * 2, 1, 0, c_black, otheralpha);
draw_sprite_ext(_level.level_Sprite, mindFrames, _xMove, 100 - 1, levelXscale * 2, 1, 0, c_black, otheralpha);

draw_sprite_ext(_level.level_Sprite, mindFrames, _xMove, 100, levelXscale * 2, 1, 0, c_white, otheralpha);




var _spikes = spr_SonicRushSpikesNorm;

if global.PlayerChar == 0 or global.MIND {
	_spikes = spr_SonicRush_Spikes_Head;
}

draw_sprite_ext(_spikes, spikeFrames, spikeX, 0, 2.25, 2.25, 0, global.fullRGB, otheralpha * mainAlpha);

var _charSel = global.PlayerSelection[global.SelectedPlayer];
var _charName = _charSel[0][0];
var _col = c_white;
		
if charBoxFrames < 2 && !global.SimplifyVFX {
	charBoxFrames += 1 / 2;
} else {
	charBoxFrames = 0;
}

charNameX -= 3;
		
if charNameX <= -427 {
	charNameX = 427;
}

draw_sprite_ext(spr_TextboxSonicRush, charBoxFrames, 427, charBoxY + 21, 30, 1, 0, c_black, otheralpha * mainAlpha);
draw_sprite_ext(spr_TextboxSonicRush, charBoxFrames, 427, charBoxY + 16, 30, 1, 0, c_white, otheralpha * mainAlpha);
		
draw_set_halign(fa_right);
	draw_text_transformed_color(charNameX, charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, otheralpha * mainAlpha);
	draw_text_transformed_color(charNameX + charNameXRepeat / 2, charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, otheralpha * mainAlpha);
	draw_text_transformed_color(charNameX + charNameXRepeat, charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, otheralpha * mainAlpha);
	draw_text_transformed_color(charNameX + charNameXRepeat * 1.5, charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, otheralpha * mainAlpha);
	draw_text_transformed_color(charNameX + charNameXRepeat * 2, charBoxY + 4, scr_LocalText(_charName), 1, 1, 0, _col, _col, _col, _col, otheralpha * mainAlpha);
draw_set_halign(fa_left);
