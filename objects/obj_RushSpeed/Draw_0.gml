var _camX = camera_get_view_x(view_camera[0]) + 50;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

var _xscale = visXScale;
var _humming = spr_RushHummingVFX;

if global.MIND {
	_humming = spr_HeadHummingVFX;
}

if leftTrick or rightTrick or backTrick {
	draw_sprite_ext(_humming, image_index, x, y - 16, _xscale, 1, drawAngle, c_white, 1);
}

if railGrind {
	var _rail = spr_RailGrindCentSparksVFX;
	
	if global.MIND {
		_rail = spr_RailGrindCentHeadVFX;
	}
	
	draw_sprite_ext(_rail, railGrindSprFrames, x + angleSin * 13, y + angleCos * 13, 1.25 * _xscale, 0.25, drawAngle, c_white, 1);
}

if global.DEBUG == true {
	draw_text(_camX + 200, _camY + 20, "vel: " + string(vel));
	draw_text(_camX + 200, _camY + 40, "yspd: " + string(yspd));
	draw_text(_camX + 200, _camY + 60, "x: " + string(x));
	draw_text(_camX + 200, _camY + 80, "y: " + string(y));
	draw_text(_camX + 200, _camY + 100, "homingAttacked: " + string(homingAttacked));
	draw_text(_camX + 200, _camY + 120, "isSlope: " + string(isSlope));
	draw_text(_camX + 200, _camY + 140, "realJumping: " + string(realJumping));
	draw_text(_camX + 200, _camY + 160, "ground: " + string(ground));
	draw_text(_camX + 200, _camY + 180, "jumping: " + string(jumping));
}