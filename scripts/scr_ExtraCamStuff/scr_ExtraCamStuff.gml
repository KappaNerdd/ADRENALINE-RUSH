function scr_StopCamMove(_resetTimer = 2, _timer = 10) {
	with(obj_CameraExtended) {
		resetTimer = _resetTimer;
		inactiveTimer = _timer;
	}
}

function scr_ChangeCamZoom(_sizeMult = 1, _speed = 0.1, _bars = false) {
	with(obj_CameraExtended) {
		ingameCamX = _sizeMult;
		ingameCamY = _sizeMult;
		camSpd = _speed;
		blackBars = _bars;
	}
}