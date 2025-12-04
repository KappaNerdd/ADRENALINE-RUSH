var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);


//Top Bar
draw_sprite_ext(sprite_index, 0, _camX, _camY + bar1Y - 100, image_xscale, image_yscale, 0, c_black, 1);


//Bottom Bar
draw_sprite_ext(sprite_index, 0, _camX, _camY + bar2Y + 360, image_xscale, image_yscale, 0, c_black, 1);