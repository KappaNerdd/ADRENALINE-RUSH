//Create other shit
instance_create_depth(x, y, depth, obj_ResultsCardSRushSpikesBottom);
instance_create_depth(x, y, depth, obj_ResultsCardSRushSpikesTop);
instance_create_depth(x, y, depth, obj_ResultsCardSRushSpikesLeft);
instance_create_depth(x, y, depth, obj_ResultsCardChar);
instance_create_depth(x, y, depth, obj_ResultsCardSideBar);
instance_create_depth(x, y, depth, obj_ResultsCardResults);
instance_create_depth(x, y, depth, obj_ResultsCardLevel);
instance_create_depth(x, y, depth, obj_ResultsCardTime);
instance_create_depth(x, y, depth, obj_ResultsCardRankChecker);
instance_create_depth(x, y, depth, obj_ResultsCardRank);
instance_create_depth(x, y, depth, obj_ResultsCardLevelNum);
instance_create_depth(x, y, depth, obj_ResultsCardWhiteTrans);
instance_create_depth(x, y, depth, obj_NewRecordN);
instance_create_depth(x, y, depth, obj_ResultsCardRushBossBall);

x = camera_get_view_x(view_camera[0]) - 10;
y = camera_get_view_y(view_camera[0]) - 10;

image_xscale = 21;
image_yscale = 12;

depth = -1000000;

image_alpha = 0;


//Variable that change based on specific things
scr_GetCharTextboxes();

global.ResultsTimer = 300;

if global.SimplifyVFX == true {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 1;
}