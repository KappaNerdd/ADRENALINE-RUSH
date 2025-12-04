var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_sprite_ext(spr_RainSplash, 0, _camX, _camY, 320, 180, 0, c_black, 1);
draw_sprite_ext(sprite_index, image_index, _camX, _camY, 10, 10, 0, global.fullRGB, 0.20);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

	draw_text_transformed_color(320, 180, "No Controller Detected", 2, 2, 0, c_white, c_white, global.fullRGB, global.fullRGB, 1);
	draw_text_transformed_color(320, 240, "(Press any key on your keyboard \nto disable Controller Only)", 1, 1, 0, c_grey, c_grey, global.fullRGB, global.fullRGB, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);