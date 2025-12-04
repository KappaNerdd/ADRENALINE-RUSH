if global.SimplifyVFX {
	image_index = 0;
}


if obj_Player.chargeTimer < obj_Player.chargeFrames - 15 {
	if image_alpha < 1 {
		image_alpha += 0.01;
	}
} else {
	if image_alpha > 0 {
		image_alpha -= 0.05;
	}
}