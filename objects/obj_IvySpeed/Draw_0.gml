var _camX = camera_get_view_x(view_camera[0]);
var _camXAdd = 450;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

var _xscale = visXScale;

if upTrick or backTrick {
	var _humming = spr_IvyHummingVFX;
	
	if global.MIND {
		_humming = spr_HeadHummingVFX;
	}
	
	draw_sprite_ext(_humming, image_index * 2, x, y - 16, _xscale, 1, drawAngle, c_white, 1);
}

if railGrind {
	var _rail = spr_RailGrindSparksVFX;
	
	if global.MIND {
		_rail = spr_RailGrindHeadVFX;
	}
	
	draw_sprite_ext(_rail, railGrindSprFrames, x + angleSin * 13, y + angleCos * 13, _xscale, 0.5, drawAngle, c_white, 1);
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
}