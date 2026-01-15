var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, image_index, ((extraX + _camX) * 0.7) + 500, _camY, image_xscale, image_yscale, 0, thunderCol, image_alpha);