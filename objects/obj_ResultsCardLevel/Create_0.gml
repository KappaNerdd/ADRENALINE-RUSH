if instance_exists(obj_StageTrackerSpeed) {
	level = global.speedStageData[global.SpeedSelected].stage_Sprite;
}

x = camera_get_view_x(view_camera[0]) - 335;
y = camera_get_view_y(view_camera[0]) + 120;

depth = -1000000110

image_xscale = 0.25;
image_yscale = 0.25;

xspd = 9.2;

charTimer = 120;
charChecked = false;