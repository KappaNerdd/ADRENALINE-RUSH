if timer > 0 {
	timer -= 1;
}

if timer <= 0 {
	if image_alpha > 0 {
		image_alpha -= alphaOpacityChange;
	}
}

if image_alpha <= 0 {
	instance_destroy();
}

if gamepad_is_connected(global.Player2Con) {
	sprite_index = spr_Player2;
} else {
	sprite_index = spr_PlayerCPU;
}


if global.PartnerChar == -1 {
	instance_destroy();
}

