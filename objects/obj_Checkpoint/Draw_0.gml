var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) < global.CamSafeArea {
	scr_Outline();
	draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, sprColor, 1);
}