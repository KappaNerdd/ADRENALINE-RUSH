//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCardMinor) {
	instance_destroy();
}


if instance_exists(obj_LevelCardLevelMinor) {
	image_alpha = obj_LevelCardLevelMinor.image_alpha;
}


sprite_index = stageType;


if global.StageType == 0 {
	stageType = spr_SpeedStageHead;
} else if global.StageType == 1 {
	stageType = spr_ActionStageHead;
}

xChange = lerp(xChange, 20, 0.1);