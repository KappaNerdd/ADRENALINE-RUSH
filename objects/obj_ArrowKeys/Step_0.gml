if gamepad_is_connected(global.Player1Con) {
	if global.ConType == 0 {
		sprite_index = spr_HUDDPad_Xbox;
	} else if global.ConType == 1 {
		sprite_index = spr_HUDDPad_PS;
	} else if global.ConType == 2 {
		sprite_index = spr_HUDDPad_Switch;
	}
} else {
	sprite_index = spr_HUDArrowKeys;
}

image_xscale = 0.5;
image_yscale = 0.5;