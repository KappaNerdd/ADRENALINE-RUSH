if gamepad_is_connected(global.Player1Con) {
	if global.ConType == 0 {
		sprite_index = spr_HUDA_Xbox;
	} else if global.ConType == 1 {
		sprite_index = spr_HUDCross;
	} else if global.ConType == 2 {
		sprite_index = spr_HUDA_Switch;
	}
} else {
	sprite_index = spr_HUDZKey;
}

image_xscale = 0.5;
image_yscale = 0.5;