if kysTimer > 0 {
	kysTimer--;
} else {
	if size > 0 {
		size -= sizeReduct;
	} else {
		instance_destroy();
	}
}

x += xspd;
y += yspd;
yspd -= revGrav;

var _randomX = random_range(-5, 5);

if createTimer > 0 {
	createTimer--;
} else {
	createTimer = createFrames;
	
	if createPart {
		with(instance_create_depth(x + _randomX, y, depth, obj_DRFountainSmokeAlt)) {
			createPart = false;
			size = other.size;
			revGrav = other.revGrav + 0;
			smokeCheck = other.id;
			xspd = 0//other.xspd;
			yspd = 0//other.yspd - 1;
		}
	
		with(instance_create_depth(x + _randomX, y, depth + 1, obj_DRFountainSmokeAlt)) {
			createPart = false;
			size = other.size + 3;
			col = c_white;
			revGrav = other.revGrav + 0;
			smokeCheck = other.id;
			xspd = 0//other.xspd;
			yspd = 0//other.yspd - 1.5;
		}
	}
}

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) > global.CamSafeArea {
	instance_destroy();
}