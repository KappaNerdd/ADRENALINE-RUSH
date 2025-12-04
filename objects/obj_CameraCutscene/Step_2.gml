//Get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

var _camX = floor(obj_Player.x - _camWidth / 2);
var _camY = floor(obj_Player.y - _camHeight / 2);

//Get camera target coords
if followPlayer == true {
	_camX = floor(obj_Player.x - _camWidth / 2);
	_camY = floor(obj_Player.y - _camHeight / 2);
} else {
	_camX = floor(x);
	_camY = floor(y);
}


//Constrain camera to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//Apply Shake
var shake = power(shakeValue, 2) * shakePower;
_camX += random_range(-shake, shake);
_camY += random_range(-shake, shake);
	
//Camera Zoom
var _addWidth = _camWidth * global.camZoom;
var _addHeight = _camHeight * global.camZoom;

_camWidth += _addWidth;
_camHeight += _addHeight;
	
//Apply Camera Zoom
camera_set_view_size(view_camera[0], _camWidth, _camHeight);

//Shake
if shakeValue > 0 {
	shakeValue -= 0.1;
}


if followPlayer == true {
	finalCamX += (_camX - finalCamX) * camTrailSpd;
	finalCamY += (_camY - finalCamY) * camTrailSpd;
}


//Set camera coords
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);


if !instance_exists(obj_CutsceneParent) {
	instance_change(obj_CameraExtended, true);
}