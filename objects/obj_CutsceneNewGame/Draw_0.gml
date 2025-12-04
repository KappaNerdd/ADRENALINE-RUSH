draw_self();

var _cameraX = camera_get_view_x(view_camera[0]);
var _cameraY = camera_get_view_y(view_camera[0]);


if global.DEBUG == true {
	draw_text(_cameraX, _cameraY, string(beforeCameraTimer));
	draw_text(_cameraX, _cameraY + 20, string(beforeCameraConfirmed));
	draw_text(_cameraX, _cameraY + 40, string(obj_CameraParent.finalCamY));
	
	draw_text(_cameraX, _cameraY + 60, string(waitTimer));
	draw_text(_cameraX, _cameraY + 80, string(image_alpha));
	draw_text(_cameraX, _cameraY + 100, string(confirmedWait));
	draw_text(_cameraX, _cameraY + 120, string(getupTimer));
	draw_text(_cameraX, _cameraY + 140, string(getupConfirmed));
	draw_text(_cameraX, _cameraY + 160, string(endCutsceneTimer));
}