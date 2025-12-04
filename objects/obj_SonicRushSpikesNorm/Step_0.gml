scr_ShiftRGB();

if room != rm_CharSelect {
	if global.PlayerChar == 0 {
		sprite_index = spr_SonicRush_Spikes_Head;
	} else {
		sprite_index = spr_SonicRushSpikesNorm;
	}
} else {
	if global.SelectedPlayer == 0 {
		sprite_index = spr_SonicRush_Spikes_Head;
	} else {
		sprite_index = spr_SonicRushSpikesNorm;
	}
}


if !global.SimplifyVFX {
	if image_xscale > 0 {
		image_speed = 1;
	} else if image_xscale < 0 {
		image_speed = -1;
	}
} else {
	image_speed = 0;
}