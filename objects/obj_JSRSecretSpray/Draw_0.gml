var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) < 850 && doneTimer > 0 {
	draw_sprite_ext(sprays[count + 5], 0, setX, setY, 1, 1, 0, c_white, 0.5);
	
	scr_Outline();

	draw_self();
}