//Exit if no player or if a cutscene is playing
if !instance_exists(obj_Player) or global.Death {
	exit;
}

var _effect = 0.2;

//Get camera size
var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);

//Get camera target coords
var _camX = floor(following.x - _camWidth / 2);
var _camY = floor(following.y - _camHeight / 2);

if !global.ExtendCamera {
	_camX = floor((following.x + _changeX) - _camWidth / 2);
	_camY = floor((following.y + _changeY) - _camHeight / 2);
	
	if lookTimer == 0 {
		var _bot = 0;
		
		//Move Camera Up if Looking Up
		if obj_Player.look_up {
			_bot = -1;
		}

		//Move Camera Down if Crouching
		if obj_Player.ducking {
			_bot = 1;
		}
		
		_changeY = lerp(_changeY, 300 * _bot, _effect);
	}
} else if global.ExtendCamera && following == obj_Player {
	var _dir = 1;
	
	if obj_Player.vel > 0 {
		_dir = 1;
	} else if obj_Player.vel < 0 {
		_dir = -1;
	}
	
	_camX = floor(((following.x + _changeX) - _camWidth / 2));
	_camY = floor(((following.y + _changeY) - _camHeight / 2));
	
	_changeX = lerp(_changeX, obj_Player.vel * 12, 0.05);
	
	if obj_Player.yspd >= 0 {
		if !obj_Player.ground {
			_changeY = lerp(_changeY, obj_Player.yspd * 8, 0.05);
		}
	} else {
		_changeY = lerp(_changeY, 0, 0.1);
	}
	
	if obj_Player.ground {
		if obj_Player.drawAngle == 22.5 {
			if obj_Player.vel >= obj_Player.max_Speed {
				_changeY = lerp(_changeY, -25, _effect);
			} else if obj_Player.vel <= -obj_Player.max_Speed {
				_changeY = lerp(_changeY, 25, _effect);
			} else {
				_changeY = lerp(_changeY, 0, _effect);
			}
		} else if obj_Player.drawAngle == 337.5 {
			if obj_Player.vel <= -obj_Player.max_Speed {
				_changeY = lerp(_changeY, -25, _effect);
			} else if obj_Player.vel >= obj_Player.max_Speed {
				_changeY = lerp(_changeY, 25, _effect);
			} else {
				_changeY = lerp(_changeY, 0, _effect);
			}
		} else if obj_Player.drawAngle == 45 {
			if obj_Player.vel >= obj_Player.max_Speed {
				_changeY = lerp(_changeY, -50, _effect);
			} else if obj_Player.vel <= obj_Player.max_Speed {
				_changeY = lerp(_changeY, 50, _effect);
			} else {
				_changeY = lerp(_changeY, 0, _effect);
			}
		} else if obj_Player.drawAngle == 315 {
			if obj_Player.vel <= -obj_Player.max_Speed {
				_changeY = lerp(_changeY, -50, _effect);
			} else if obj_Player.vel >= obj_Player.max_Speed {
				_changeY = lerp(_changeY, 50, _effect);
			} else {
				_changeY = lerp(_changeY, 0, _effect);
			}
		} else if obj_Player.drawAngle == 77.5 {
			if obj_Player.vel >= obj_Player.max_Speed {
				_changeY = lerp(_changeY, -100, _effect);
			} else if obj_Player.vel <= obj_Player.max_Speed {
				_changeY = lerp(_changeY, 100, _effect);
			} else {
				_changeY = lerp(_changeY, 0, _effect);
			}
		} else if obj_Player.drawAngle == 282.5 {
			if obj_Player.vel <= -obj_Player.max_Speed {
				_changeY = lerp(_changeY, -100, _effect);
			} else if obj_Player.vel >= obj_Player.max_Speed {
				_changeY = lerp(_changeY, 100, _effect);
			} else {
				_changeY = lerp(_changeY, 0, _effect);
			}
		} else {
			_changeY = lerp(_changeY, 0, _effect);
		}
		
		
		if lookTimer == 0 {
			var _bot = 0;
		
			//Move Camera Up if Looking Up
			if obj_Player.look_up {
				_bot = -1;
			}

			//Move Camera Down if Crouching
			if obj_Player.ducking {
				_bot = 1;
			}
		
			_changeY = lerp(_changeY, 300 * _bot, _effect);
		}
	}
}



/*if (gamepad_is_connected(global.Player2Con) && instance_exists(obj_Partner)) && !gamepad_is_connected(global.Player3Con) {
	_camX = mean(obj_Player.x - _camWidth / 2, obj_Partner.x - _camWidth / 2);
	_camY = mean(obj_Player.y - _camHeight / 2, obj_Partner.y - _camHeight / 2);
} else if (gamepad_is_connected(global.Player2Con) && instance_exists(obj_Partner)) && (gamepad_is_connected(global.Player3Con) && instance_exists(obj_Partner2)) {
	_camX = mean(obj_Player.x - _camWidth / 2, obj_Partner.x - _camWidth / 2, obj_Partner2.x - _camWidth / 2);
	_camY = mean(obj_Player.y - _camHeight / 2, obj_Partner.y - _camHeight / 2, obj_Partner2.y - _camHeight / 2);
} else {
	_camX = floor(obj_Player.x - _camWidth / 2);
	_camY = floor(obj_Player.y - _camHeight / 2);
}*/

//Constrain camera to room borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

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

var shake = shakePower * shakeValue;
//_camX += random_range(-shake, shake);
_camY += shake;

camX2 = lerp(camX2, ingameCamX, 0.2);
camY2 = lerp(camY2, ingameCamY, 0.2);

camera_set_view_size(view_camera[0], global.CamWidth + camX2, global.CamHeight + camY2);


if !global.Death {
	//Looking Timer
	if (obj_Player.look_up or obj_Player.ducking) && lookTimer > 0 {
		lookTimer -= 1;
	}

	if lookTimer <= 0 {
		lookTimer = 0;
	}

	if !obj_Player.look_up && !obj_Player.ducking {
		lookTimer = lookFrames;
	}
}

if resetTimer > 0 {
	resetTimer -= 1;
}

if inactiveTimer > 0 {
	inactiveTimer -= 1;
}

if inactiveTimer <= 0 or resetTimer > 0 {
	if global.ExtendCamera {
		finalCamX += (_camX - finalCamX) * camTrailSpd;
		finalCamY += (_camY - finalCamY) * camTrailSpd;
	} else {
		finalCamX += (_camX - finalCamX);
		finalCamY += (_camY - finalCamY);
	}
}


//Set camera coords
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

x = finalCamX;
y = finalCamY;


if instance_exists(obj_CutsceneParent) {
	instance_change(obj_CameraCutscene, true);
}