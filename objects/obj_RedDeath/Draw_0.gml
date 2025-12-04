var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);


draw_sprite_ext(spr_WhiteTrans, 0, _camX, _camY, 24, 13.5, 0, global.fullRGB, image_alpha);
draw_sprite_ext(obj_Player.sprite_index, 0, playX, playY, obj_Player.image_xscale, obj_Player.image_yscale, 0, c_black, image_alpha);
