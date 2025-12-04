if !instance_exists(obj_LevelCard) {
	instance_destroy();
}

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


draw_sprite_ext(_sprite, 0, x + ballX, y + ballY, image_xscale, image_yscale, changeAngle, image_blend, image_alpha);

