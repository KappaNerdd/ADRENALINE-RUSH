var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

lengthDirAngle += lengthDirShit;

var _extraY = lengthdir_y(5, lengthDirAngle);

if alive {
	y = setY + _extraY;
}

if sprayAlpha > 0 {
	sprayAlpha -= 0.05;
}

if distance_to_point(_camX, _camY) < 950 {
	draw_sprite_ext(spr_CassetteC90Collected, image_index, setX, setY + _extraY, 1, 1, 0, c_white, 0.5);
	
	if doneTimer > 0 {
		scr_Outline();
		draw_self();
	}
	
	gpu_set_fog(true, c_white, 0, 1);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, sprayAlpha);
	gpu_set_fog(false, c_black, 0, 1);
}