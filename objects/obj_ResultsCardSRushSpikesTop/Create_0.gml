spike = spr_SonicRush_Spikes_HeadUp;

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]) - 100;

image_xscale = 2.75;
image_yscale = 2.75;

if global.PlayerChar == 0 {
	sprite_index = spr_SonicRush_Spikes_HeadUp;
} else {
	sprite_index = spr_SonicRushSpikesNormTop;
}

depth = -1000000003

yspd = 3;

if global.SimplifyVFX == true {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 1;
}