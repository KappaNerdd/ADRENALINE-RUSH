//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCard) {
	instance_destroy();
}

x += xspd;

sprite_index = levelNum;

//Character
if xspd > 0 {
	xspd -= 0.1;
}
