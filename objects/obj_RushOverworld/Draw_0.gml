var _camX = camera_get_view_x(view_camera[0]) + 50;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

if leftTrick or rightTrick or backTrick {
	var _xscale = visXScale;
	
	draw_sprite_ext(spr_RushHummingVFX, image_index, x, y - 16, _xscale, 1, drawAngle, c_white, 1);
}

if railGrind {
	draw_sprite_ext(spr_RailGrindSparksVFX, railGrindSprFrames, x + angleSin * 10, y + angleCos * 10, 1, 0.25, drawAngle, c_white, 1);
}

if global.DEBUG == true {
	draw_text(_camX, _camY + 20, "vel: " + string(vel));
	draw_text(_camX, _camY + 40, "yspd: " + string(yspd));
	draw_text(_camX, _camY + 60, "x: " + string(x));
	draw_text(_camX, _camY + 80, "y: " + string(y));
	draw_text(_camX, _camY + 100, "room: " + string(room));
	draw_text(_camX, _camY + 120, "isSlope: " + string(isSlope));
	draw_text(_camX, _camY + 140, "myFloorPlat: " + string(myFloorPlat));
	draw_text(_camX, _camY + 160, "ground: " + string(ground));
	draw_text(_camX, _camY + 180, "jumping: " + string(jumping));
}