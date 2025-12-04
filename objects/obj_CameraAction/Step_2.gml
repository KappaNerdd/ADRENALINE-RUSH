//Get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//Get camera target coords
var _camX = floor((obj_ActionPlayer.x) - _camWidth / 2);
var _camY = floor((obj_ActionPlayer.y) - _camHeight / 2);

//Constrain camera to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//Apply Shake
var shake = shakePower * shakeValue;
//_camX += random_range(-shake, shake);
_camY += shake;
	
//Apply Camera Zoom
camX2 = lerp(camX2, ingameCamX, 0.2);
camY2 = lerp(camY2, ingameCamY, 0.2);

camera_set_view_size(view_camera[0], 640 + camX2, 360 + camY2);

//Shake
if shakeValue > 0 && shakeTimer <= 0 {
	shakeValue -= 0.05;
}

if shakeTimer > 0 {
	shakeTimer -= 1;
}

//Apply Shake
if shakePowerTimer > 0 {
	shakePowerTimer -= 1;
}

if shakePowerTimer <= 0 {
	shakePowerTimer = shakePowerFrames;
	shakePower = -shakePower;
}

//Actively Change
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

//Set camera coords
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

x = finalCamX;
y = finalCamY;