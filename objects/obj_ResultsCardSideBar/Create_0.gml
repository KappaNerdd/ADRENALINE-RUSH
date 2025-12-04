bar = spr_SideBarHeadR;

x = camera_get_view_x(view_camera[0]) - 970;
y = camera_get_view_y(view_camera[0]);

if global.PlayerChar == 0 or global.MIND {
	sprite_index = spr_SideBarHeadR;
} else {
	sprite_index = spr_SideBarR;
}

image_xscale = 1;
image_yscale = 1;

depth = -1000000009

xspd = 6.6;