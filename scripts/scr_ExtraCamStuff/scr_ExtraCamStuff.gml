function scr_StopCamMove(_resetTimer = 2, _timer = 10) {
	with(obj_CameraExtended) {
		resetTimer = _resetTimer;
		inactiveTimer = _timer;
	}
}