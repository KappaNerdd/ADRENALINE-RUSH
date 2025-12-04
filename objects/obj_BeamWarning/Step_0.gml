if !global.SimplifyVFX {
	if attackTimer > 60 {
		image_speed = 1;
	} else if attackTimer <= 60 {
		image_speed = 2;
	}
} else {
	image_speed = 0;
}


if attackTimer > 180 {
	visible = false;
} else if attackTimer <= 180 && attackTimer > 60 {
	visible = true;
	
	if beepingTimer > 0 {
		beepingTimer -= 1;
	}
	
	if beepingTimer <= 0 {
		beepingTimer = 20;
	}
} else if attackTimer <= 60 {
	visible = true;
	
	if beepingTimer2 > 0 {
		beepingTimer2 -= 1;
	}
	
	if beepingTimer2 <= 0 {
		beepingTimer2 = 10;
	}
}


if attackTimer > 0 {
	attackTimer -= 1;
}

if attackTimer <= 0 {
	with (instance_create_depth(x, y, depth, obj_HeadBeamHazard)) {
		hori = other.makeHori;
		verti = other.makeVerti;
		changeXScale = other.image_xscale;
		image_xscale = other.image_xscale;
		changeYScale = other.image_yscale;
		image_yscale = other.image_yscale;
	}
	
	instance_destroy();
}