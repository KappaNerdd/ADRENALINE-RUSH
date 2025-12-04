x = camera_get_view_x(view_camera[0]) + 200;
y = camera_get_view_y(view_camera[0]) - 310;

image_xscale = 8;
image_yscale = 5;

depth = -99998;

yspd = 20.5;

restartTimer = 120;


//Create Shit
instance_create_depth(x, y, depth, obj_FileBoxYes);
instance_create_depth(x, y, depth, obj_FileBoxNo);