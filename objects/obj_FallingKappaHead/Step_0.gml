getCharacterControls();

x += xspd;
y += yspd;

if yspd > 0 {
	yspd += dcc;
}

if yspd <= 0 {
	yspd = 0;
}

if yspd = 0 && !instance_exists(obj_PressEnterHead) {
	instance_create_depth(305, 450, depth, obj_PressEnterHead);
}

if (jump_Key or pause_Key) && !instance_exists(obj_PressEnterHead) {
	instance_create_depth(305, 450, depth, obj_PressEnterHead);
}
