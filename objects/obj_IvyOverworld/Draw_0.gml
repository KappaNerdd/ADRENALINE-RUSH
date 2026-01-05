var _camX = camera_get_view_x(view_camera[0]);
var _camXAdd = 450;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

if upTrick or backTrick {
	var _xscale = image_xscale;
	
	draw_sprite_ext(spr_IvyHummingVFX, image_index * 2, x, y, _xscale, 1, 0, c_white, 1);
}

if global.DEBUG == true && instance_exists(self) {
	draw_text(_camX + _camXAdd, _camY + 20, "vel: " + string(vel));
	draw_text(_camX + _camXAdd, _camY + 40, "yspd: " + string(yspd));
	draw_text(_camX + _camXAdd, _camY + 60, "x: " + string(x));
	draw_text(_camX + _camXAdd, _camY + 80, "y: " + string(y));
	draw_text(_camX + _camXAdd, _camY + 100, "angleSin: " + string(sin(groundAngle)));
	draw_text(_camX + _camXAdd, _camY + 120, "angleCos: " + string(cos(groundAngle)));
	draw_text(_camX + _camXAdd, _camY + 140, "stompPow: " + string(stompPow));
	draw_text(_camX + _camXAdd, _camY + 160, "chargeTimer: " + string(chargeTimer));
	draw_text(_camX + _camXAdd, _camY + 180, "shootAir: " + string(shootAir));


	draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_red, 0.5);
	
	draw_sprite_ext(mask_index, 0, x, y + 4, 1, 1, 0, c_green, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel, y - abs(vel) - 30, 1, 1, 0, c_blue, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel, y + 25, 1, 1, 0, c_orange, 0.5);
	draw_sprite_ext(mask_index, 0, x + vel, y + 55, 1, 1, 0, c_yellow, 0.5);
	
}