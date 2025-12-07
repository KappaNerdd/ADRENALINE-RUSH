//---File Box---//
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, confirmColor, 0.5 * image_alpha);
draw_sprite_ext(spr_TextboxTrans, 0, x, y, image_xscale, image_yscale, 0, confirmColor, 1 * image_alpha);

var _healthCol = c_white;
var _backHealthCol = c_white;

if fileHovered {
	_healthCol = c_white;
	_backHealthCol = c_red;
} else {
	_healthCol = c_grey;
	_backHealthCol = c_maroon;
}

var _dir = working_directory + "/saves/" + string(fileNum) + "/";

if file_exists(_dir + string(global.MainDataFile) + string(fileNum) + ".sav") {	
	//Player
	_liveSprite = playerSprite;
	_charCostume = playerCostume;

	draw_sprite_ext(_liveSprite, _charCostume, x + 10, y + 10, 0.5, 0.5, 0, image_blend, image_alpha);
} else {
	draw_sprite_ext(spr_StageCharNone, 0, x + 10, y + 10, 0.5, 0.5, 0, image_blend, image_alpha);
}

//---Player Extra Lives---//
draw_text_color(x + 40, y + 15, "x" + string(playExtraLives), image_blend, image_blend, image_blend, image_blend, image_alpha);


//---Player Name---//
draw_set_halign(fa_right);
	draw_text_color(x + 310, y + 5, string(playerName), image_blend, image_blend, image_blend, image_blend, image_alpha);
draw_set_halign(fa_left);


//---Time Played---//
draw_set_halign(fa_right);

	if seconds < 10 && minutes < 10 {
		draw_text_color(x + 310, y + 35, string(hours) + ":0" + string(minutes) + ":0" + string(round(seconds)), image_blend, image_blend, image_blend, image_blend, image_alpha);
	} else if seconds >= 10 && minutes >= 10 {
		draw_text_color(x + 310, y + 35, string(hours) + ":" + string(minutes) + ":" + string(round(seconds)), image_blend, image_blend, image_blend, image_blend, image_alpha);
	} else if seconds < 10 && minutes >= 10 {
		draw_text_color(x + 310, y + 35, string(hours) + ":" + string(minutes) + ":0" + string(round(seconds)), image_blend, image_blend, image_blend, image_blend, image_alpha);
	} else if seconds >= 10 && minutes < 10 {
		draw_text_color(x + 310, y + 35, string(hours) + ":0" + string(minutes) + ":" + string(round(seconds)), image_blend, image_blend, image_blend, image_blend, image_alpha);
	}
	
draw_set_halign(fa_left);


//---Room Name---//
scr_RoomCheckerDraw();
savedRoom = savRM;

var _xscale = 1;
var _yscale = 1;

if string_length(_rmName) > 20 {
	_xscale = 0.8;
} else {
	_xscale = 1;
}

draw_text_transformed_color(x + 10, y + 35, string(_rmName), _xscale, _yscale, 0, image_blend, image_blend, image_blend, image_blend, image_alpha);



//Debug Bullshit - "You think you got more sauce than Yung Cash Register A.K.A. Lil' BROOMstick?!" - Yung Cash Register A.K.A. Lil' Broomstick
if global.DEBUG {
	draw_text(x, y, string(global.saveFile));
}
	
	