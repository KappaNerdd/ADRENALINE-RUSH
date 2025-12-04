scr_GetCharShitCreate();

sprite_index = global.PlayerSelection[global.PlayerChar][9][0];

image_index = global.PlayerCostume;

x = camera_get_view_x(view_camera[0]) + 685;
y = camera_get_view_y(view_camera[0]) + 25;

depth = -100000000;

image_xscale = 0.25;
image_yscale = 0.25;

xspd = -6;
yspd = 0;

charTimer = 120;
charChecked = false;