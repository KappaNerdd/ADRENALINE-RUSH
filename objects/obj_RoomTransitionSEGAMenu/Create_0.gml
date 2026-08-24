image_alpha = 0;
depth = -10;

x = -10000000;

transComplete = false;
color = c_black;
colorRed = 0;
colorGreen = 0;
colorBlue = 0;

division = 0.75;

target_x = 0;
target_y = 0;
target_rm = noone;
target_xscale = 1;
target_vel = 0;
target_yspd = 0;

if instance_exists(obj_Player) {
	obj_Player.can_Move = false;
}

waitType = true;
type = "sonion rings...";

checkChar = true;