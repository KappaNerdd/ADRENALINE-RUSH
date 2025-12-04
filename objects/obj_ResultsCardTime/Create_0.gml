x = camera_get_view_x(view_camera[0]) - 670;
y = camera_get_view_y(view_camera[0]) + 190;

if global.PlayerChar == 0 or global.MIND {
	timeGraphic = spr_ResultsTimeHead;
} else {
	timeGraphic = spr_ResultsTime;
}

image_xscale = 1;
image_yscale = 1;

depth = -1000000110

xspd = 8.45;