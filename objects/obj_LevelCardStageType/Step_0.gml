//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCard) {
	instance_destroy();
}

x += xspd;

sprite_index = stageType;


if global.StageType == 0 {
	stageType = spr_SpeedStageHead;
} else if global.StageType == 1 {
	stageType = spr_ActionStageHead;
}

//Character
if xspd > 0 {
	xspd -= 0.1;
}
