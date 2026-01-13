var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) < global.CamSafeArea {
	if powerUp < 3 {
		var _power = spr_PowerUps;

		if global.MIND or global.PlayerChar == 0 {
			_power = spr_PowerUpsHead;
		}

		scr_Outline();

		draw_self();


		if active {
			draw_sprite_ext(_power, powerUp, x, y, 1, 1, 0, c_white, 1);
		}
	} else {
		var _sprite = _charCheck3;
	
		if global.MIND or global.PlayerChar == 0 {
			_sprite = spr_HeadCollectable;
		}
	
		scr_Outline();

		draw_self();

	
		if active {
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
				draw_text(x, y, string(powers[powerUp][0]));
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
		}
	}
}