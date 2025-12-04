spike = spr_SonicRush_Spikes_HeadDown;

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]) + 190;

image_xscale = 2.75;
image_yscale = 2.75;

if global.PlayerChar == 0 {
	sprite_index = spr_SonicRush_Spikes_HeadDown;
} else {
	sprite_index = spr_SonicRushSpikesNormBottom;
}

depth = -1000000004;

yspd = -3;

if global.SimplifyVFX == true {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 1;
}