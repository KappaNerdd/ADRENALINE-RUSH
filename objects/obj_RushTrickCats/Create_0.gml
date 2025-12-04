if !global.MIND && global.PlayerChar != 0 {
	cats = [
		spr_RTSaiyan,
		spr_RTLuna,
		spr_RTSolar,
	]
} else {
	cats = [
		spr_RTSaiyanHead,
		spr_RTLunaHead,
		spr_RTSolarHead,
	]
}

catSpr = 0;

sprite_index = cats[catSpr];
image_index = 0;
image_speed = 0;
depth = -1;
x = -1000000;

newX = 0;
newY = 700;

xspd = 0;
yspd = -23;

grav = 0.5;

disTimer = 180;
waitTimer = 0;