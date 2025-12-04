finalCamX = 0;
finalCamY = 0;

x = floor(obj_Player.x);
y = floor(obj_Player.y);

camTrailSpd = 0.25;


instance_create_depth(x, y, depth, obj_CameraExtended);
instance_destroy();


//Shake
shakePower = 5;
shakeValue = 0;

//Look Up & Down Timer
lookTimer = 120;
lookFrames = 120;