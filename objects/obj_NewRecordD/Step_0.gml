//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_NewRecordN) {
	instance_destroy();
}

if colorTimer > 0 {
	colorTimer -= 1;
}

if colorTimer <= 0 {
	colorTimer = 0;
}

if colorTimer == 0 {
	alarm_set(0, 6);
	colorTimer = colorFrames;
}

if instance_exists(obj_NewRecordN) {
	visible = obj_NewRecordN.visible;
}