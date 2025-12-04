var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camXAdd = 400;


scr_RushModeColorDraw();


draw_set_font(global.font_main);
	draw_set_color(c_white);

if global.DEBUG == true && instance_exists(self) {
	draw_text(_camX + _camXAdd, _camY + 20, "rightTrick: " + string(rightTrick));
	draw_text(_camX + _camXAdd, _camY + 40, "leftTrick: " + string(leftTrick));
	draw_text(_camX + _camXAdd, _camY + 60, "upTrick: " + string(upTrick));
	draw_text(_camX + _camXAdd, _camY + 80, "rushTrick: " + string(altTrickTimer));
	draw_text(_camX + _camXAdd, _camY + 100, "trick: " + string(trick));
	draw_text(_camX + _camXAdd, _camY + 120, "altTrick: " + string(altTrick));
	draw_text(_camX + _camXAdd, _camY + 140, "angleJumpCos: " + string(beforeTrick));
	draw_text(_camX + _camXAdd, _camY + 160, "wallJumpVel: " + string(trickWait));

	draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_red, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel / 2, y - abs(vel) - 30, 1, 1, 0, c_blue, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel, y + 50, 1, 1, 0, c_yellow, 0.5);
	
	
	
}