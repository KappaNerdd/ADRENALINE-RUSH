//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_ResultsCard) {
	instance_destroy();
}

x += xspd;

if xspd < 0 {
	xspd += 0.05;
}
