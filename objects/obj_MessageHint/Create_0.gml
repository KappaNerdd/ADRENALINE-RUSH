hintMessageGeneral = "";

hintMessageKeyboard = "";
hintMessageXbox = "";
hintMessagePS4 = "";
hintMessageSwitch = "";


obj_SFXManager.menuPop = true;
obj_Player.can_MoveFULL = false;


if !instance_exists(obj_HintButton) {
	instance_create_depth(x, y, depth, obj_HintButton);
}


confirmed = false;


yspd = 20;


x = camera_get_view_x(view_camera[0]) + 165;
y = camera_get_view_y(view_camera[0]) - 310;

image_xscale = 10;
image_yscale = 5;

depth = -100000000;


if global.PlayerChar == 1 {
	sprite_index = spr_KappaTextbox;
} else if global.PlayerChar == 2 {
	sprite_index = spr_SarahTextbox;
} else if global.PlayerChar == 12 {
	sprite_index = spr_IvyTextbox;
} else {
	sprite_index = spr_TextboxHead;
}



if global.SimplifyVFX {
	image_speed = 0;
} else {
	image_speed = 1;
}