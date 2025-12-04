spike = spr_SonicRush_Spikes_Head;

x = camera_get_view_x(view_camera[0]) - 50;
y = camera_get_view_y(view_camera[0]);

image_xscale = 2.5;
image_yscale = 2.5;

if global.PlayerChar == 0 {
	sprite_index = spr_SonicRush_Spikes_Head;
} else {
	sprite_index = spr_SonicRushSpikesNorm;
	image_blend = global.fullRGB;
}

depth = -1000000005

xspd = 2;

if global.SimplifyVFX == true {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 1;
}