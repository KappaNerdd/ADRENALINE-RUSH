var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, 0, _camX, _camY, global.CamWidth / 2, global.CamHeight / 2, 0, image_blend, image_alpha);