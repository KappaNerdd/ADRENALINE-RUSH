var _camX = camera_get_view_x(view_camera[0]) + 50;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

if leftTrick or rightTrick or backTrick {
	var _xscale = image_xscale;
	
	draw_sprite_ext(spr_RushHummingVFX, image_index, x, y, _xscale, 1, 0, c_white, 1);
}

if global.DEBUG == true && instance_exists(self) {
	draw_text(_camX, _camY + 20, "vel: " + string(vel));
	draw_text(_camX, _camY + 40, "yspd: " + string(yspd));
	draw_text(_camX, _camY + 60, "x: " + string(x));
	draw_text(_camX, _camY + 80, "y: " + string(y));
	draw_text(_camX, _camY + 100, "room: " + string(room));
	draw_text(_camX, _camY + 120, "isSlope: " + string(isSlope));
	draw_text(_camX, _camY + 140, "myFloorPlat: " + string(myFloorPlat));
	draw_text(_camX, _camY + 160, "ground: " + string(ground));
	draw_text(_camX, _camY + 180, "jumping: " + string(jumping));


	draw_sprite_ext(mask_index, 0, x, y + termVel, 1, 1, 0, c_blue, 0.5);	
}