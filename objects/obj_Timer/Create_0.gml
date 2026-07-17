moveY = -100;

resetCount = true;
global.countUp = false;

alarm_set(0, 1);

extraLife = [
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
]

inGameScore = 0;

image_alpha = 1;

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
