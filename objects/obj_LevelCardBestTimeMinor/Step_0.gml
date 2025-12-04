if !instance_exists(obj_LevelCardMinor) {
	instance_destroy();
}

yChange = lerp(yChange, 130, 0.1);

if instance_exists(obj_LevelCardLevelMinor) {
	image_alpha = obj_LevelCardLevelMinor.image_alpha;
}

timeSeconds = global.speedStageData[global.SpeedSelected].seconds;
timeMinutes = global.speedStageData[global.SpeedSelected].minutes;
