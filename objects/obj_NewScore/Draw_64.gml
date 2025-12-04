
var _gap = 20;

for (var i = 0; i < 4; i++) {
	var _sprite = spr_NewRecordN;
	var _mainCol = colArray[i + colNum];
	
	if i == 1 {
		_sprite = spr_NewRecordE1;
	} else if i == 2 {
		_sprite = spr_NewRecordW;
	} else if i == 3 {
		_sprite = spr_NewRecordEXC;
	}
	
	draw_sprite_ext(_sprite, image_index, _camX + 5 + (_gap * i), _camY + 5, 1, 1, 0, c_black, 0.5);
	draw_sprite_ext(_sprite, image_index, _camX + (_gap * i), _camY, 1, 1, 0, _mainCol, 1);
}