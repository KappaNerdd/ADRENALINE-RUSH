x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

xspd = 43;


image_xscale = -1;
image_yscale = 1;

depth = -110000000;


if global.PlayerChar == 0 {
	sprite_index = spr_SideBarHead;
} else {
	sprite_index = spr_SideBar;
	image_blend = global.fullRGB;
}