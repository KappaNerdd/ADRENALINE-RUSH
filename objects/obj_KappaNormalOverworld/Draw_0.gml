var _camX = camera_get_view_x(view_camera[0]);
var _camXAdd = 400;
var _camY = camera_get_view_y(view_camera[0]);

scr_RushModeColorDraw();

var _xscale = image_xscale;

if leftTrick or rightTrick or backTrick {
	draw_sprite_ext(spr_KappaHummingVFX, image_index, x, y, _xscale, 1, 0, c_white, 1);
}

if railGrind {
	/*var _changeX = 20;
	var _changeY = 0;
	
	if drawAngle == 22.5 {
		_changeY = 10;
	}
	
	if drawAngle == 337.5 or drawAngle == -22.5 {
		
	}*/
	
	draw_sprite_ext(spr_RailGrindSparksVFX, railGrindSprFrames, x, bbox_bottom, 0.5, 0.5, 0, c_white, 1);
	//draw_sprite_ext(spr_RailGrindSparksVFX, railGrindSprFrames, x + _changeX, bbox_bottom - _changeY, 0.5, 0.5, 0, c_white, 1);
}

if global.DEBUG {
	draw_text(_camX + _camXAdd, _camY + 20, "rightTrick: " + string(rightTrick));
	draw_text(_camX + _camXAdd, _camY + 40, "leftTrick: " + string(leftTrick));
	draw_text(_camX + _camXAdd, _camY + 60, "upTrick: " + string(upTrick));
	draw_text(_camX + _camXAdd, _camY + 80, "rushTrick: " + string(rushTrick));
	draw_text(_camX + _camXAdd, _camY + 100, "trick: " + string(trick));
	draw_text(_camX + _camXAdd, _camY + 120, "altTrick: " + string(altTrick));
	draw_text(_camX + _camXAdd, _camY + 140, "jumpVelBS: " + string((cos(degtorad(drawAngle)) * vel) + (sin(degtorad(drawAngle)) * -normalJspd)));
	draw_text(_camX + _camXAdd, _camY + 160, "globalPlayerID: " + string(global.PlayerID));

	draw_sprite_ext(mask_index, 0, x, y, 1, 1, image_angle, c_red, 0.5);
	draw_sprite_ext(mask_index, 0, x, y + 4, 1, 1, image_angle, c_green, 0.5);
	draw_line_color(vel + bbox_left, y, vel + bbox_right, y + 85, c_red, global.fullRGB);
	draw_sprite_ext(mask_index, 0, x + vel, y + 50, 1, 1, image_angle, c_yellow, 0.5);
	draw_point_color(x, y - 10, c_fuchsia);
}