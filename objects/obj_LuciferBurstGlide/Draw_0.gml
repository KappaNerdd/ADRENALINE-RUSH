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
			if charID.vel > 0 {
				_angle = (-45) * (charID.vel / charID.max_Speed);
			} else if charID.vel < 0 {
				_angle = (45) * (charID.vel / -charID.max_Speed);
			}
		} else {
			_angle = -45 * _boostXscale;
		}
	}
}

draw_sprite_ext(sprite_index, image_index, _x - (10 * _boostXscale), _y, 0.75, 0.75, _angle, c_white, 1);