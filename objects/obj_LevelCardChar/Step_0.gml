//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCard) {
	instance_destroy();
}

x += xspd;
y += yspd;

//Character
if xspd < 0 {
	xspd += 0.05;
}

if xspd >= 0 {
	charTimer -= 1;
}

if charTimer <= 0 && charChecked == false {
	charChecked = true;
	yspd = -1.5;
}

if charChecked == true {
	xspd -= 0.15;
	yspd += 0.1;
}