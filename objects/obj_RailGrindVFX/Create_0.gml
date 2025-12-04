depth = obj_Player.depth - 1;

image_speed = 2.5;

if !obj_Player.leftFacer {
	image_xscale = obj_Player.image_xscale;
} else {
	if obj_Player.face_Left {
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
}

//Check what character you're playin' as so it can change sprites.
if global.PlayerChar == 0 {
	sprite_index = spr_RailGrindVFXHead;
} else {
	sprite_index = spr_RailGrindVFXKappa;
	image_blend = global.fullRGB;
}