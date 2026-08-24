function scr_SetCharSpeedMove(_canMove = true, _canMoveFULL = true, _stopH = false, _stopV = false) {
	if instance_exists(obj_Player) {
		with(obj_Player) {
			can_Move = _canMove;
			can_MoveFULL = _canMoveFULL;
			
			if !_canMove {
				scr_ControlSpeedCreate();
			}
			
			if _stopH {
				vel = 0;
			}
			
			if _stopV {
				yspd = 0;
			}
		}
	}
}

function scr_SetCharDRMove(_canMove = true, _canMoveFULL = true, _stopH = false, _stopV = false) {
	if instance_exists(obj_DRPlayer) {
		with(obj_DRPlayer) {
			can_Move = _canMove;
			can_MoveFULL = _canMoveFULL;
			
			if !_canMove {
				scr_ControlSpeedCreate();
			}
			
			if _stopH {
				vel = 0;
			}
			
			if _stopV {
				yspd = 0;
			}
		}
	}
}