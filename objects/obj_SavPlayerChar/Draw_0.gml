draw_sprite_ext(sprite_index, image_index, obj_SavBox.x + 10, obj_SavBox.y + 10, 1, 1, 0, c_white, image_alpha);


var _extraX = 65;

/*if global.statData.partner2_Char != -1 && global.statData.partner_Char != -1 {
	_extraX = 140;
} else if global.statData.partner2_Char == -1 && global.statData.partner_Char != -1 {
	_extraX = 100;
} else if global.statData.partner2_Char == -1 && global.statData.partner_Char == -1 {
	_extraX = 65;
}*/

draw_text(obj_SavBox.x + _extraX, obj_SavBox.y + 40, "x " + string(global.statData[0].player_ExtraLives));