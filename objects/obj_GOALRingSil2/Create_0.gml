image_xscale = 1.5;
image_yscale = 1.5;

depth = obj_GOALRing.depth - 2;

image_blend = global.fullRGB;

if !global.MIND && global.PlayerChar != 0 {
	image_speed = 0;
} else {
	sprite_index = spr_GoalRingWholeStillHead;
}

image_index = 0;