//Exit if no player
if !instance_exists(obj_Knuckles){
	exit;
}

//Get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//Get camera target coords
var _camX = obj_Knuckles.x - _camWidth/2;
var _camY = obj_Knuckles.y - _camHeight/2;

//Constrain camera to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//Set camera coords variables
if obj_Knuckles.vel < 10 or obj_Knuckles.vel > -10{
	finalCamX += (_camX - finalCamX) * camTrailSpd;
	finalCamY += (_camY - finalCamY) * camTrailSpd;
}

//Extended Camera (Camera moves more if you reach a certain speed.)
if obj_Knuckles.vel > 10{
	finalCamX += (_camX - finalCamX + 300) * camTrailSpd;
}

if obj_Knuckles.vel < -10{
	finalCamX += (_camX - finalCamX - 300) * camTrailSpd;
}

//Set camera coords
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);