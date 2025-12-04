//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCard) {
	instance_destroy();
}

y += yspd;

//Character
if yspd < 0 {
	yspd += 0.05;
}

if global.PlayerChar != 0 {
	image_blend = global.fullRGB;
}
