var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);


if !global.SimplifyVFX {
	var shake = power(4, 2) * 0.1;

	_camX += random_range(-shake, shake);
	_camY += random_range(-shake, shake);
}

if kysTimer > 0 {
	kysTimer -= 1;
}

if kysTimer <= 0 {
	instance_destroy();
}

draw_set_halign(fa_center);

	draw_text_transformed(_camX + 320, _camY + 50, "RUN!", 3, 3, 0);
	
draw_set_halign(fa_left)