//Variables
x = camera_get_view_x(view_camera[0]) + 80;
y = camera_get_view_y(view_camera[0]) - 310;

yspd = 20;

image_xscale = 15;
image_yscale = 5;

image_alpha = 1;

depth = -100000000; //This is really not good to do btw lol. I learned that depth has a limit.

saveConfirmed = false;
omegaConfirmed = false;


//Create some shit.
instance_create_depth(x, y, depth - 1, obj_SavSave);
instance_create_depth(x, y, depth - 1, obj_SavCancel);
instance_create_depth(x, y, depth - 1, obj_SavRoomChecker);
instance_create_depth(x, y, depth - 1, obj_SavCharName);
instance_create_depth(x, y, depth - 1, obj_SavPlayerName);
instance_create_depth(x, y, depth - 1, obj_SavPlayerChar);
instance_create_depth(x, y, depth - 1, obj_SavPlayerTime);
