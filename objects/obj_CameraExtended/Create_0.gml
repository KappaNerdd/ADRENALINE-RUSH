finalCamX = floor(obj_Player.x);
finalCamY = floor(obj_Player.y);

ingameCamX = 0;
ingameCamY = 0;

camX2 = 0;
camY2 = 0;

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