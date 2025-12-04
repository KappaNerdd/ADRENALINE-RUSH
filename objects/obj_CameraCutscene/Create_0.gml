finalCamX = 0;
finalCamY = 0;
camTrailSpd = 0.25;

//Shake
shakePower = 5;
shakeValue = 0;

//Look Up & Down Timer
lookTimer = 120;
lookFrames = 120;


//Follow player
followPlayer = false;

if followPlayer {
	finalCamX = (obj_Player.x - camera_get_view_width(view_camera[0]) / 2);
	finalCamY = (obj_Player.y - camera_get_view_height(view_camera[0]) / 2);
}