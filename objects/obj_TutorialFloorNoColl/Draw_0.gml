var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) < global.CamSafeArea {
	draw_self();
	draw_sprite_ext(spr_TextboxWhiteOut, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
