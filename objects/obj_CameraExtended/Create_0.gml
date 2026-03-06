depth = -25;

finalCamX = floor(obj_Player.x);
finalCamY = floor(obj_Player.y);

ingameCamX = 1;
ingameCamY = 1;
camSpd = 0.1;
blackBars = false;
blackBarsPos = 0;

bar1 = 0;
bar2 = 180;

camX2 = 1;
camY2 = 1;

_changeX = 0;
_changeY = 0;

resetTimer = 0;
inactiveTimer = 0;

following = obj_Player;

x = floor(following.x);
y = floor(following.y);

camTrailSpd = 0.4;

//Shake
shakePower = 8;
shakePowerTimer = 0;
shakePowerFrames = 2;

shakeValue = 0;
shakeTimer = 0;

//Look Up & Down Timer
lookTimer = 60;
lookFrames = 60;