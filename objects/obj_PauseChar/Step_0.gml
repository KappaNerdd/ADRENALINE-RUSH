if !instance_exists(obj_PauseMenuOverworld) && !instance_exists(obj_PauseMenuSpeed) && !instance_exists(obj_PauseMenuSpeedForced) {
	instance_destroy();
}

//Movement
x += xspd;

if xspd < 0 {
	xspd += 0.25;
}

if xspd > 0 {
	xspd = 0;
}


sprite_index = pauseChar;


///-----Characters-----///

//Head Kappa
if global.PlayerChar == 0 {
	pauseChar = pauseKappaHead;
}