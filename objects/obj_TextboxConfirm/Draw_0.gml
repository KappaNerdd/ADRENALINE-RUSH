var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

//Play Button
draw_sprite_ext(spr_CassettePlay, 0, _camX + 200, _camY + 5, 0.25, 0.25, 0, c_white, playAlpha);
draw_sprite_ext(obj_CustomJumpKeySpeed.sprite_index, obj_CustomJumpKeySpeed.image_index, _camX + 215, _camY + 13, 0.5, 0.5, 0, c_white, playAlpha);

//Forward Button
draw_sprite_ext(spr_CassetteForward, 0, _camX + 300, _camY + 5, 0.25, 0.25, 0, c_white, forwardAlpha);
draw_sprite_ext(obj_CustomAct1KeySpeed.sprite_index, obj_CustomAct1KeySpeed.image_index, _camX + 315, _camY + 13, 0.5, 0.5, 0, c_white, forwardAlpha);

//Fast-Forward Button
draw_sprite_ext(spr_CassetteFastForward, 0, _camX + 400, _camY + 5, 0.25, 0.25, 0, c_white, fastForwardAlpha);
draw_sprite_ext(obj_CustomAct2KeySpeed.sprite_index, obj_CustomAct2KeySpeed.image_index, _camX + 415, _camY + 13, 0.5, 0.5, 0, c_white, fastForwardAlpha);
