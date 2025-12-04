draw_sprite_ext(sprite_index, image_index, x, y, 10, 10, 0, image_blend, image_alpha);

if room == rm_CharSelect {
	if (obj_CharSelectWhiteBall.playerConfirmed && obj_CharSelectWhiteBall.playerConfirmedTimer >= obj_CharSelectWhiteBall.playerConfirmedFrames - 5) {
		confirmOpacity = 1;
	}
	
	if (obj_CharSelectWhiteBall.partnerConfirmed && obj_CharSelectWhiteBall.partnerConfirmedTimer >= obj_CharSelectWhiteBall.partnerConfirmedFrames - 5) {
		confirmOpacity = 1;
	}
	
	if (obj_CharSelectWhiteBall.partner2Confirmed && obj_CharSelectWhiteBall.partner2ConfirmedTimer >= obj_CharSelectWhiteBall.partner2ConfirmedFrames - 5) {
		confirmOpacity = 1;
	}

	if confirmOpacity > 0 {
		confirmOpacity -= 0.05;
	}
}

if !global.SimplifyVFX {
	draw_sprite_ext(sprite_index, image_index, x, y, 10, 10, 0, c_white, confirmOpacity);
}