var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, drawAngle, image_blend, image_alpha);
scr_RushModeColorDraw();

draw_set_font(global.font_main);
	draw_set_color(c_white);

if global.DEBUG == true && instance_exists(self) {
	draw_text(_camX, _camY + 20, "vel: " + string(vel));
	draw_text(_camX, _camY + 40, "yspd: " + string(yspd));
	draw_text(_camX, _camY + 60, "x: " + string(x));
	draw_text(_camX, _camY + 80, "y: " + string(y));
	draw_text(_camX, _camY + 100, "room: " + string(room));
	draw_text(_camX, _camY + 120, "speedBreak: " + string(speedBreak));
	draw_text(_camX, _camY + 140, "speedBreakTimer: " + string(speedBreakTimer));
	draw_text(_camX, _camY + 160, "wallRunning: " + string(wallRunning));
	draw_text(_camX, _camY + 180, "can_Move: " + string(can_Move));
	draw_text(_camX, _camY + 200, "can_MoveFULL: " + string(can_MoveFULL));


	draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_red, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel / 2, y - abs(vel) - 30, 1, 1, 0, c_blue, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel, y + 50, 1, 1, 0, c_yellow, 0.5);
	
	
	
}