if !instance_exists(obj_LevelCard) {
	instance_destroy();
}

if yspd < 0 {
	yspd += 0.1;
}

y += yspd;

timeSeconds = global.speedStageData[global.SpeedSelected].seconds;
timeMinutes = global.speedStageData[global.SpeedSelected].minutes;
