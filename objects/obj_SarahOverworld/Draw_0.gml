var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camXAdd = 400;

scr_RushModeColorDraw();

if backTrick or hover {
	var _xscale = 1;
	
	if face_Left {
		_xscale = -1;
	}
	
	draw_sprite_ext(spr_SarahTwirlVFX, image_index, x, y, _xscale, 1, 0, c_white, 1);
}

if railGrind {
	draw_sprite_ext(spr_RailGrindSparksVFX, railGrindSprFrames, x, bbox_bottom, 0.5, 0.5, 0, c_white, 1);
}

if global.DEBUG == true && instance_exists(self) {
	draw_text(_camX + _camXAdd, _camY + 20, "ground: " + string(ground));
	draw_text(_camX + _camXAdd, _camY + 40, "angle: " + string(angle));
	draw_text(_camX + _camXAdd, _camY + 60, "bottomColl: " + string(bottomCollision));
	draw_text(_camX + _camXAdd, _camY + 80, "vel: " + string(vel));
	draw_text(_camX + _camXAdd, _camY + 100, "yspd: " + string(yspd));
	draw_text(_camX + _camXAdd, _camY + 120, "altTrick: " + string(altTrick));
	draw_text(_camX + _camXAdd, _camY + 140, "angleJumpCos: " + string(beforeTrick));
	draw_text(_camX + _camXAdd, _camY + 160, "wallJumpVel: " + string(trickWait));

	draw_sprite_ext(mask_index, 0, x, y, 1, 1, 0, c_red, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel / 2, y - abs(vel) - 30, 1, 1, 0, c_blue, 0.5);
	
	draw_sprite_ext(mask_index, 0, x + vel, y + 50, 1, 1, 0, c_yellow, 0.5);
	
	
	
}