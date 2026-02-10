display_set_gui_size(768, 432);

var _charSel = global.PlayerSelection[global.PlayerChar];
var _charBox = _charSel[6][0];
sprite_index = _charBox;

draw_sprite_ext(spr_TextboxHead, 0, 0, createY, 10, image_yscale, 0, c_white, 1);

if !normalJuke && !customJuke {
	for(var i = 0; i < 2; i++) {
		var _col = c_grey;
		var _words = "freeplay_NormJuke";
		var _yGap = 64;
	
		if jukeboxChoice == i {
			_col = c_white;
		}
	
		if i == 1 {
			_words = "freeplay_CustJuke";
		}
		
		if chosenCustMus == i {
			draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, -8, 64 + (_yGap * i) + customY, 1, 1, 0, c_white, textAlpha);
		}
	
		draw_sprite_ext(spr_TextboxHead, 0, 0, 32 + (_yGap * i), 10, 2, 0, _col, textAlpha);
	
		draw_set_halign(fa_middle);
		draw_set_valign(fa_center);
			draw_text_transformed_color(160, 64 + (_yGap * i), scr_LocalText(_words), 0.75, 0.75, 0, c_white, c_white, _col, _col, textAlpha);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}
}


if customJuke {
	var _custArray = global.CustomJukeboxPlaylist;
	
	if global.JukeboxShuffle {
		_custArray = global.CustomJukeShuffled;
	}
	
	for(var c = 0; c < array_length(_custArray); c++) {
		var _yGap = 64;
		var _col = c_grey;
		
		if chosenCustMus == c {
			_col = c_white;
		}
		
		draw_sprite_ext(spr_TextboxHead, 0, 0, 32 + (_yGap * c) + customY, 10, 2, 0, _col, textAlpha);
		
		if global.CustomJukeChoice == c {
			draw_sprite_ext(sprite_index, image_index, 0, 32 + (_yGap * c) + customY, 10, 2, 0, _col, textAlpha / 4);
			//draw_sprite_ext(sprite_index, image_index, 320, 32, 3, 2, 0, c_grey, textAlpha);
			
			draw_set_halign(fa_center);
				//draw_text_transformed(368, 40, "< x" + string(pitch) + " >", 0.75, 0.75, 0);
			draw_set_halign(fa_left);
		}
		
		if chosenCustMus == c {
			draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, -8, 64 + (_yGap * c) + customY, 1, 1, 0, c_white, textAlpha);
		}
		
		var _fileName = filename_name(_custArray[c]);
		var _fileWidth = string_width(_fileName);
		var _fileLimit = 320;	
		
		draw_set_valign(fa_center);
			draw_text_transformed_color(64, 64 + (_yGap * c) + customY, scr_TextBull(_fileName, _fileLimit), 0.75, 0.75, 0, c_white, c_white, _col, _col, textAlpha);
		draw_set_valign(fa_top);
	}
}

draw_sprite_ext(spr_TextboxHead, 0, 0, createY, 10, 1, 0, global.fullRGB, textAlpha);
draw_sprite_ext(spr_TextboxHead, 0, 0, createY + 320, 10, 3.5, 0, global.fullRGB, textAlpha);

draw_sprite_ext(spr_JukeButtons, 0 + global.JukeboxShuffle, 32, createY + 360, 1, 1, 0, c_white, textAlpha);
draw_sprite_ext(spr_JukeButtons, 2 + global.JukeboxLoop, 288, createY + 360, 1, 1, 0, c_white, textAlpha);

if customJuke {
	draw_sprite_ext(spr_JukeButtons, 4, 96, createY + 360, 1, 1, 0, c_white, textAlpha);
}
	
draw_sprite_ext(spr_JukeButtons, 5, 224, createY + 360, 1, 1, 0, c_white, textAlpha);


var _buttonAsset = obj_CustomAct1KeySpeed.sprite_index;

draw_sprite_ext(_buttonAsset, obj_CustomAct2KeySpeed.image_index, 32 - 32, createY + 408, 1, 1, 0, c_white, textAlpha);
draw_sprite_ext(_buttonAsset, obj_CustomAct4KeySpeed.image_index, 288 - 32, createY + 408, 1, 1, 0, c_white, textAlpha);

if customJuke {
	draw_sprite_ext(_buttonAsset, obj_CustomPauseKeySpeed.image_index, 96 - 32, createY + 408, 1, 1, 0, c_white, textAlpha);
}

draw_sprite_ext(_buttonAsset, obj_CustomAct3KeySpeed.image_index, 224 - 32, createY + 408, 1, 1, 0, c_white, textAlpha);


draw_sprite_ext(spr_TextboxTrans, 0, 0, createY, 10, 13.5, 0, global.fullRGB, textAlpha);

draw_set_halign(fa_middle);
draw_set_valign(fa_center);
	draw_text_transformed_color(160, 16, scr_LocalText("freeplay_Juke"), 0.75, 0.75, 0, c_white, c_white, c_white, c_white, textAlpha);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

