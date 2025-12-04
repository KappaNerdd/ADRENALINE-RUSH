//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCard) {
	instance_destroy();
}

x += xspd;

//Character
if xspd > 0 {
	xspd -= 0.05;
}


if global.PlayerChar != 0 {
	image_blend = global.fullRGB;
}
