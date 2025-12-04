visible = true;

if global.PlayerChar == 0 {
	sprite_index = spr_StompingVFXHead;
} else {
	sprite_index = spr_StompingVFXKappa;
	image_blend = global.fullRGB;
}