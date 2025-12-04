var _camX = x;
var _camY = y;

var _camX2 = camera_get_view_x(view_camera[0]);
var _camY2 = camera_get_view_y(view_camera[0]);

var _camWidth = camera_get_view_width(view_camera[0]) / 2;
var _camHeight = camera_get_view_height(view_camera[0]) / 2;

var _p1 = 0.1;
var _p2 = 0.2;
var _p3 = 0.4;
var _p4 = 0.6;

draw_sprite_ext(spr_HeadBG, 0, _camX2, _camY2, 10, 5.625, 0, c_white, 1);

if !global.SimplifyVFX {
	draw_sprite_ext(spr_Static, image_index / 5, _camX2, _camY2, 1.4166666667, 1, 0, c_white, 0.1);
} else {
	draw_sprite_ext(spr_Static, 0, _camX2, _camY2, 1.4166666667, 1, 0, c_white, 0.1);
}

if global.SimplifyVFX == false {
	draw_sprite_tiled_ext(spr_WhiteTrans, image_index, _camX * _p1, _camY * _p1, 1, 1, c_white, global.ThunderOpacity / 4);
}

draw_sprite_tiled_ext(spr_HeadBlockBG, 2, _camX * _p2, _camY * _p2, -0.25, 0.25, #444444, 1);

draw_sprite_tiled_ext(spr_HeadBlockBG, 1, _camX * _p3, _camY * _p3 + 50, 0.5, 0.5, #666666, 1);
