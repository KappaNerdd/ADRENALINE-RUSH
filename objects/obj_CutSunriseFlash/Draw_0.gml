var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, 0, _camX, _camY, 320, 180, 0, c_white, image_alpha);