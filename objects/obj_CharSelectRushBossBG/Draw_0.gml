image_blend = global.fullRGB;

draw_self();

if ballX > 0 {
	ballX -= changeBall;
}

if ballY < 0 {
	ballY += changeBall;
}

if !global.SimplifyVFX {
	changeAngle += changeBall;
}


draw_self();

if (obj_CharSelectWhiteBall.playerConfirmed && obj_CharSelectWhiteBall.playerConfirmedTimer >= obj_CharSelectWhiteBall.playerConfirmedFrames - 5) or (obj_CharSelectWhiteBall.partnerConfirmed && obj_CharSelectWhiteBall.partnerConfirmedTimer >= obj_CharSelectWhiteBall.partnerConfirmedFrames - 5) or (obj_CharSelectWhiteBall.partner2Confirmed && obj_CharSelectWhiteBall.partner2ConfirmedTimer >= obj_CharSelectWhiteBall.partner2ConfirmedFrames - 5) {
	confirmOpacity = 1;
}

if confirmOpacity > 0 {
	confirmOpacity -= 0.05;
}

if !global.SimplifyVFX {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, confirmOpacity);
}


draw_sprite_ext(spr_CharSelectRushBossBall, 0, x + ballX, y + ballY, image_xscale, image_yscale, changeAngle, image_blend, 1);

if !global.SimplifyVFX {
	draw_sprite_ext(spr_CharSelectRushBossBall, 0, x + ballX, y + ballY, image_xscale, image_yscale, changeAngle, c_white, confirmOpacity);
}

