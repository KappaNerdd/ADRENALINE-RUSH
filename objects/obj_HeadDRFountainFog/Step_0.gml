angleChange += randomAngle;
moveX = lengthdir_x(10, angleChange);
moveY = lengthdir_y(10, angleChange);

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _randomX = random_range(_camX, _camX + global.CamSafeArea);

if obj_Player.y > room_height - global.CamSafeArea && createPart {	
	if createTimer > 0 {
		createTimer--;
	} else {
		createTimer = random_range(60, 120);
		scr_DRFountainSmoke(_randomX, room_height, depth, 0, random(0.25), c_black, c_white, 20, 0.5, 20);
	}
}