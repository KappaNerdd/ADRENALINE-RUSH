scrollX = 0;
createLeaves = 20;

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

repeat(100) {
	var _ranX = random_range(_camX, _camX + 640);
	var _ranY = random_range(_camY, _camY + 320);
	
	if global.Particles {
		instance_create_depth(_ranX, _ranY, depth, obj_OTLeaves);
	}
}