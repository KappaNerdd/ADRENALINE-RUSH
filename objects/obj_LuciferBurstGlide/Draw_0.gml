var _boostXscale = 1;
var _angle = image_angle;
var _x = x;
var _y = y;

if charID != noone {
	if follow {
		_x = charID.x;
		_y = charID.y + 5;
	}
	
	if angleCheck {
		if charID.leftFacer {
			if face_Left {
				_boostXscale = -1;
			}
		} else {
			_boostXscale = charID.visXScale;
		}
		
		if abs(charID.vel) < charID.max_Speed {
			_angle = -60 * (charID.vel / charID.max_Speed);
		} else {
			var _faceCheck = 1;
			
			if charID.vel > 0 {
				if _boostXscale == 1 {
					_faceCheck = 1;
				} else {
					_faceCheck = -1;
				}
			} else if charID.vel < 0 {
				if _boostXscale == 1 {
					_faceCheck = -1;
				} else {
					_faceCheck = 1;
				}
			}
			
			_angle = -60 * (_boostXscale * _faceCheck);
		}
	}
}

draw_sprite_ext(sprite_index, image_index, _x - (5 * _boostXscale), _y, 1, 1, _angle, c_white, 1);