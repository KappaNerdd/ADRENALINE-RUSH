if global.SimplifyVFX {
	image_index = 0;
}


if global.Particles {
	visible = true;
} else {
	visible = false;
}


if obj_Player.chargeTimer < obj_Player.chargeFrames - 15 {
	if image_angle <= 360 {
		image_angle -= changeAngle;
	}
	
	if changeAngle > 1 {
		changeAngle -= 0.1;
	}
	
	
	if image_alpha < 1 {
		image_alpha += 0.05;
	}
	
	
	if changeScale > 0.005 {
		changeScale -= 0.001;
	}
	
	if image_xscale > 0.1 && image_yscale > 0.1 {
		image_xscale -= changeScale;
		image_yscale -= changeScale;
	}
		
} else {
	if image_angle > 0 {
		image_angle -= 30;
	}
	
	changeAngle = changeAngleType;
	
	
	if image_alpha > 0 {
		image_alpha -= 0.1;
	}
	
	
	if image_xscale < 3 {
		image_xscale += 0.25;
	}
	
	if image_yscale < 3 {
		image_yscale += 0.25;
	}
	
	changeScale = changeScaleType;
}