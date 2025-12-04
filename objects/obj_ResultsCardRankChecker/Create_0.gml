x = camera_get_view_x(view_camera[0]) - 805;
y = camera_get_view_y(view_camera[0]) + 273;

if global.PlayerChar == 0 or global.MIND {
	rankCheckerGraphic = spr_ResultsRankCheckHead;
} else {
	rankCheckerGraphic = spr_ResultsRank;
}

image_xscale = 0.4;
image_yscale = 0.4;

depth = -1000000110

xspd = 9.2;