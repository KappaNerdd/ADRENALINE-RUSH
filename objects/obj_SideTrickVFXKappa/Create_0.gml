depth = obj_Player.depth - 1;

image_speed = -1;

image_alpha = 0.6;

if global.PlayerChar == 0 {
	sprite_index = spr_TrickRightVFXHead;
} else {
	sprite_index = spr_TrickRightVFXKappa;
	image_blend = global.fullRGB;
}