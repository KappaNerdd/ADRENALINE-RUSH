function scr_DRFountainSmoke(_x, _y, _depth, _xspd, _grav, _col1, _col2, _size, _sizeRed, _timer) {
	with(instance_create_depth(_x, _y, _depth, obj_DRFountainSmoke)) {
		col = _col1;
		size = _size;
		sizeReduct = _sizeRed;
		kysTimer = _timer;
		xspd = _xspd;
		revGrav = _grav;
	}
	
	with(instance_create_depth(_x, _y, _depth + 1, obj_DRFountainSmoke)) {
		col = _col2;
		size = _size + 3;
		sizeReduct = _sizeRed;
		kysTimer = _timer;
		xspd = _xspd;
		revGrav = _grav;
		createPart = false;
	}
}