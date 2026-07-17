function scr_GasterBlaster(_x, _y, _depth, _xscale = 1, _yscale = 1, _angle = 0, _wait = 60, _sus = 60) {
	with(instance_create_depth(_x, _y, _depth, obj_HeadGasterBlaster)) {
		image_xscale = _xscale;
		image_yscale = _yscale;
		image_angle = _angle;
		
		waitTimer = _wait;
		sustain = _sus;
	}
}

