var _camX2 = camera_get_view_x(view_camera[0]);
var _camY2 = camera_get_view_y(view_camera[0]);

var _camWidth = camera_get_view_width(view_camera[0]) / 2;
var _camHeight = camera_get_view_height(view_camera[0]) / 2;

var _p1 = 1.025;
var _p2 = 0.8;
var _p3 = 0.6;
var _p4 = 0.4;

draw_sprite_ext(spr_HeadParallax2, 0, _camX2 * _p1 - room_width / 2, _camY2 * -_p1, room_width / 300, 1, 0, merge_color(obj_HeadParallaxBack.mergedCol, c_white, 0.5), 1);

