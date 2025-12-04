xspd = 0;
yspd = -3;

dcc = 0.1;

depth = -50;

image_xscale = 0.4;
image_yscale = 0.4;

enter = false;
enterTimer = 0;


vis = true;
visTimer = 15;

invis = false;
invisTimer = 5;

if gamepad_is_connected(0) && global.ConType == 0 {
	sprite_index = spr_PressStartXboxHead;
} else if gamepad_is_connected(0) && global.ConType == 1 {
	sprite_index = spr_PressStartPS4Head;
} else if gamepad_is_connected(0) && global.ConType == 2 {
	sprite_index = spr_PressStartSwitchHead;
} else {
	sprite_index = spr_PressEnterHead;
}