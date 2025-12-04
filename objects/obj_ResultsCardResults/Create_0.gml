x = camera_get_view_x(view_camera[0]) - 505;
y = camera_get_view_y(view_camera[0]) + 60;

if global.PlayerChar == 0 or global.MIND {
	resultGraphic = spr_ResultsHead;
} else {
	resultGraphic = spr_Results;
}

image_xscale = 0.25
image_yscale = 0.25;

depth = -1000000110

xspd = 7.4;