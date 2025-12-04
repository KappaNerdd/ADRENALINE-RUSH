var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _camWidth = camera_get_view_width(view_camera[0]) / 2;
var _camHeight = camera_get_view_height(view_camera[0]) / 2;

var _p1 = 0.9;
var _p2 = 0.8;
var _p3 = 0.6;
var _p4 = 0.4;

draw_sprite_tiled(spr_HeadBG, 0, 0, 0);

var _sonicRush = spr_SonicRushBG;

if global.PlayerChar == 0 {
	_sonicRush = spr_SonicRushBGHead;
} else {
	_sonicRush = spr_SonicRushBG;
}


if global.SimplifyVFX == false {
	draw_sprite_tiled_ext(_sonicRush, image_index * 2, _camX * _p1, _camY * _p1, 0.5, 0.5, global.fullRGB, 0.5);
} else {
	draw_sprite_tiled_ext(_sonicRush, 0, _camX * _p1, _camY * _p1, 0.5, 0.5, global.fullRGB, 0.5);
}