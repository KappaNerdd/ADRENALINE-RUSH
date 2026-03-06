var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) < global.CamSafeArea {
	draw_sprite_ext(spr_OTSpecsGlow, 0, x, y, 0.5, 0.5, 0, c_white, image_alpha / 2);

	draw_self();
}
