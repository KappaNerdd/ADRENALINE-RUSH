image_blend = global.fullRGB;

powers = [
	[100], //Boost Power 1
	[200], //Boost Power 2
	[300], //Boost Power 3
	[5], //5 Rings
	[10], //10 Rings
	[20], //20 Rings
	[50], //50 Rings
	[1, 5, 10, 20, 50, 100] //Random Rings
]

scr_GetCharShitCreate();

randomPower = false;
randomTimer = 0;
randomFrames = 5;

active = true;
powerUp = 0;
homingAttackable = true;
hitLag = 0;
giveScore = true;

image_alpha = 1;