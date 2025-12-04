depth = obj_Player.depth - 1;

if global.PlayerChar == 0 {
	sprite_index = spr_StompVFXHead;
} else {
	sprite_index = spr_StompVFXKappa;
	image_blend = global.fullRGB;
}

if obj_Player.vel > 0 {
	image_xscale = 1;
} else if obj_Player.vel < 0 {
	image_xscale = -1;
}

image_angle = obj_Player.drawAngle + (90 * image_xscale);