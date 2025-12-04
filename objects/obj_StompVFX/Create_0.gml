depth = obj_Player.depth - 3;

if global.PlayerChar == 0 {
	sprite_index = spr_StompVFXHead;
} else {
	sprite_index = spr_StompVFXKappa;
	image_blend = global.fullRGB;
}

if !global.Particles {
	visible = false;
}