x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]) - 10;

image_speed = 1;

image_xscale = 25;
image_yscale = 25;

image_alpha = 0;

depth = -9999999;

box = spr_PauseMenuBGBasic;
paused = spr_PausedHead;
pausedBack = spr_SideBarHeadR;

if global.SimplifyVFX == true {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 1;
}