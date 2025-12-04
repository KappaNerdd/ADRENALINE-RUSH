var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, image_index, _camX, _camY, 30, 13, 0, c_white, image_alpha);