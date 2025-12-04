
var _gap = 25;

for (var i = 0; i < 10; i++) {
	var _sprite = spr_NewRecordN;
	var _mainCol = colArray[i + colNum];
	
	if i == 1 {
		_sprite = spr_NewRecordE1;
	} else if i == 2 {
		_sprite = spr_NewRecordW;
	} else if i == 3 {
		_sprite = spr_NewRecordR1;
	} else if i == 4 {
		_sprite = spr_NewRecordE2;
	} else if i == 5 {
		_sprite = spr_NewRecordC;
	} else if i == 6 {
		_sprite = spr_NewRecordO;
	} else if i == 7 {
		_sprite = spr_NewRecordR2;
	} else if i == 8 {
		_sprite = spr_NewRecordD;
	} else if i == 9 {
		_sprite = spr_NewRecordEXC;
	}
	
	draw_sprite_ext(_sprite, image_index, _camX + 5 + (_gap * i), _camY + 5, 1, 1, 0, c_black, 0.5);
	draw_sprite_ext(_sprite, image_index, _camX + (_gap * i), _camY, 1, 1, 0, _mainCol, 1);
}