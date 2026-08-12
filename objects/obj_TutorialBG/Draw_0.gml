var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _camWidth = camera_get_view_width(view_camera[0]) / 2;
var _camHeight = camera_get_view_height(view_camera[0]) / 2;

var _p1 = 0.9;
var _p2 = 0.8;
var _p3 = 0.6;
var _p4 = 0.4;

var _sonicRush = spr_SonicRushBG;

if !global.SimplifyVFX {
	draw_sprite_ext(_sonicRush, image_index, _camX, _camY, 17, 12.5, 0, global.fullRGB, 0.5);
} else {
	draw_sprite_ext(_sonicRush, 0, _camX, _camY, 17, 12.5, 0, global.fullRGB, 0.5);
}