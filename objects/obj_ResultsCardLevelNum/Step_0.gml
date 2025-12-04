//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_ResultsCard) {
	instance_destroy();
}

if instance_exists(obj_StageTrackerSpeed) {	
	levelNum = global.speedStageData[global.SpeedSelected].level_Sprite;
}

x += xspd;

sprite_index = levelNum;

//Character
if xspd > 0 {
	xspd -= 0.05;
}