//Create other shit
instance_create_depth(x, y, depth, obj_LevelCardChar);
instance_create_depth(x, y, depth, obj_LevelCardSRushSpikesLeft);
instance_create_depth(x, y, depth, obj_LevelCardSRushSpikesTop);
instance_create_depth(x, y, depth, obj_LevelCardSRushSpikesBottom);
instance_create_depth(x, y, depth, obj_LevelCardLevel);
instance_create_depth(x, y, depth, obj_LevelCardLevelNum);
instance_create_depth(x, y, depth, obj_LevelCardStageType);
instance_create_depth(x, y, depth, obj_LevelCardWhiteTrans);
instance_create_depth(x, y, depth, obj_LevelCardBestTime);
instance_create_depth(x, y, depth, obj_LevelCardRushBossBall);

if instance_exists(obj_Player) {
	obj_Player.can_Move = false;
	obj_Player.prepare = true;
}

//Placement when created
x = camera_get_view_x(view_camera[0]) - 10;
y = camera_get_view_y(view_camera[0]) - 10;


//Opacity for BG
image_alpha = 0;


//Size for BG (Make sure 9-Slice is on)
image_xscale = 21;
image_yscale = 12;


//Depth of everything
depth = -100000000

if global.SimplifyVFX == true {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 1;
}


//Variable that change based on specific things
scr_GetCharTextboxes();
