moveY = -100;

global.ResetCount = true;
global.countUp = false;

if global.ResetCount {
	global.seconds = 00.00;
	global.minutes = 0;
	global.Rings = 0;
	global.GameScore = 0;
	global.ScoreMult = 1;
	global.EnemyCount = 0;
	
	if !global.MIND && global.PlayerChar != 0 {
		image_speed = 0;
	}
}

inGameScore = 0;

image_alpha = 1;

if !instance_exists(obj_HUDRankDisplayer) {
	instance_create_depth(x, y, depth, obj_HUDRankDisplayer);
}

x = -100000;

image_index = 0;

if global.MIND or global.PlayerChar == 0 {
	sprite_index = spr_HUDClockHead;
}

trinketAnim = 1 / 6;
trinketFrames = 0;
trinket = false;
trinketScale = 1;
trinkColCheck = false;
trinkColCheckTimer = 5;
