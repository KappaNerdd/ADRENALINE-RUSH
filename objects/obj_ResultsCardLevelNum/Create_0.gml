if instance_exists(obj_StageTrackerSpeed) {	
	levelNum = global.speedStageData[global.SpeedSelected].level_Sprite;
}

x = camera_get_view_x(view_camera[0]) - 675;
y = camera_get_view_y(view_camera[0]) + 140;

depth = -1000000150;

image_xscale = 1;
image_yscale = 1;

xspd = 8.5;