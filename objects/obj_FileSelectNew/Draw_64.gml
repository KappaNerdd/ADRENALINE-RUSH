display_set_gui_size(768, 432);
draw_sprite_ext(sprite_index, image_index, 0, 0, 13, 13, 0, c_white, 0.5);

var _angleLimit = 360 / global.FileLimit;

var _gapY = 120;

for (var i = 1; i <= global.FileLimit; i++) {
	var _dir = working_directory + "/saves/" + string(i) + "/";
	var _filename = _dir + string(global.MainDataFile) + string(i) + ".sav";
	var _chosenCol = c_grey;
	var _extraX = 0;
	
	if file_exists(_filename) {
		if fileChoice + 1 == i {
			_chosenCol = -1;
			_extraX = 50;
		} else {
			_chosenCol = c_white;
		}
		
		draw_sprite_ext(spr_TextboxHead, 0, 100 + _extraX, 184 + (_gapY * (i - 1)) + fileMove, 12, 3, 0, _chosenCol, 0.5);
		draw_sprite_ext(spr_TextboxTrans, 0, 100 + _extraX, 184 + (_gapY * (i - 1)) + fileMove, 12, 3, 0, _chosenCol, 1);
		
	} else {
		if fileChoice + 1 == i {
			_chosenCol = c_white;
			_extraX = 50;
		}
		
		draw_sprite_ext(spr_TextboxHead, 0, 100 + _extraX, 184 + (_gapY * (i - 1)) + fileMove, 12, 3, 0, _chosenCol, 0.5);
		draw_sprite_ext(spr_TextboxTrans, 0, 100 + _extraX, 184 + (_gapY * (i - 1)) + fileMove, 12, 3, 0, _chosenCol, 1);
	}
}

srSpikeFrames++;

if srSpikeFrames >= 20 {
	srSpikeFrames = 0;
}

draw_sprite_ext(srSpikes, srSpikeFrames, 0, 0, 2, 2, 0, c_white, 1);
draw_sprite_ext(srSpikes, -srSpikeFrames + (20), 768, 0, -2, 2, 0, c_white, 1);