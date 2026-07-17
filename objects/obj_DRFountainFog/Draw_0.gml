var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if obj_Player.y > room_height - global.CamSafeArea {
	draw_circle_colour(_camX + savedX + moveX, savedY + moveY, size, col, col, false);
}	
	