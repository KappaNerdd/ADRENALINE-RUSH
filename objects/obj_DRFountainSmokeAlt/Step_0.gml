x += xspd;
y += yspd;
yspd -= revGrav;

size -= 0.25;
		
if size <= 0 {
	instance_destroy();
}

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) > global.CamSafeArea {
	instance_destroy();
}