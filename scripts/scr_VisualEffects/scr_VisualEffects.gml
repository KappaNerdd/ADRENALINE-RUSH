function scr_ScreenShake(_shakePower = 0.5, _shakeDuration = 10) {
	with(obj_CameraParent) {
		if global.ScreenShake {
			shakeValue = _shakePower;
			shakeTimer = _shakeDuration;
		}
	}
}


function scr_ControllerRumble(_rumblePower = 0.1, _rumbleTimer = 10) {
	with(obj_ConRumbleSystem) {
		if global.ConRumble {
			rumblePower = _rumblePower;
			rumbleTimer = _rumbleTimer;
		}
	}
}