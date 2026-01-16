display_set_gui_size(768, 432);

if !ringPower {
	var _power = spr_PowerUps;

	if global.MIND or global.PlayerChar == 0 {
		_power = spr_PowerUpsHead;
	}


	draw_sprite_ext(_power, powerUp, 384, 417, 1, 1, 0, c_white, 1);
} 
