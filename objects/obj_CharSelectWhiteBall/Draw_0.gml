draw_self();

if playerConfirmed && playerConfirmedTimer == playerConfirmedFrames - 5 or partnerConfirmed && partnerConfirmedTimer == partnerConfirmedFrames - 5 or partner2Confirmed && partner2ConfirmedTimer == partner2ConfirmedFrames - 5 {
	confirmOpacity = 1;
}

if confirmOpacity > 0 {
	confirmOpacity -= 0.05;
}

if !global.SimplifyVFX {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, confirmOpacity);
}