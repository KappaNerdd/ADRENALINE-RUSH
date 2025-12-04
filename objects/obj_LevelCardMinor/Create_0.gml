//Create other shit
instance_create_depth(x, y, depth, obj_LevelCardLevelMinor);
instance_create_depth(x, y, depth, obj_LevelCardLevelNumMinor);
instance_create_depth(x, y, depth, obj_LevelCardStageTypeMinor);
instance_create_depth(x, y, depth, obj_LevelCardBestTimeMinor);
instance_create_depth(-100000, 0, 0, obj_MusicTag);

if !global.Girly {
	playTrack = global.speedStageData[global.SpeedSelected].musicTrack;
} else {
	playTrack = global.speedStageData[global.SpeedSelected].musicTrackGirly;
}
	
set_song_ingame(playTrack, 60, 30);

//Placement when created
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);


//Opacity for BG
image_alpha = 1;


//Size for BG (Make sure 9-Slice is on)
image_xscale = 25;
image_yscale = 25;


//Depth of everything
depth = -100000000


visible = false;