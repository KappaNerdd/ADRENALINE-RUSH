x += xspd;
y += yspd;

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer == 80 {
		xspd = 9.5;
	}
}

if instance_exists(obj_PressEnterHead) {
	if obj_PressEnterHead.enterTimer > 80 {
		xspd -= 0.2;
	}
}

if xspd < 0 {
	xspd = 0;
}

if global.SimplifyVFX == true {
	image_speed = 0;
} else {
	image_speed = 1;
}