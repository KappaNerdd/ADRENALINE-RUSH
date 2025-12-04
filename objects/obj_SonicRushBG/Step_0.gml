if room == rm_CharSelect {
	if global.SelectedPlayer == 0 {
		sprite_index = spr_SonicRushBGHead;
	} else {
		sprite_index = spr_SonicRushBG;
		image_blend = global.fullRGB;
	}
} else {
	if global.PlayerChar == 0 {
		sprite_index = spr_SonicRushBGHead;
	} else {
		sprite_index = spr_SonicRushBG;
		image_blend = global.fullRGB;
	}
}