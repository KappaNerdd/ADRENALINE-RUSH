var _randomX = random_range(-5, 5);

if createTimer > 0 {
	createTimer--;
} else {
	createTimer = createFrames;
	
	if createPart && global.Particles {
		with(instance_create_depth(x + _randomX, y, depth, obj_DRFountainSmokeAlt)) {
			createPart = false;
			size = other.size;
			revGrav = other.revGrav + 0;
			smokeCheck = other.id;
			xspd = 0 //other.xspd;
			yspd = 0 //other.yspd - 1;
		}
		
		with(instance_create_depth(x + _randomX, y, depth + 1, obj_DRFountainSmokeAlt)) {
			createPart = false;
			size = other.size + 3;
			revGrav = other.revGrav + 0;
			smokeCheck = other.id;
			xspd = 0 //other.xspd;
			yspd = 0 //other.yspd - 1;
			col = c_white;
		}
	}
}

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

if distance_to_point(_camX, _camY) > global.CamSafeArea {
	instance_destroy();
}

if kysTimer > 0 {
	if size < sizeCheck {
		if !stopCreating {
			size += 0.25;
			
			if instance_exists(createdChar) {
				if !createdChar.agro {
					stopCreating = true;
				}
			} else {
				kysTimer = 0;
			}
		} else {
			size -= 0.25;
			
			if size <= 0 {
				instance_destroy();
			}
		}
	} else { 
		kysTimer--;
		
		if !fire {
			var _num = 16;
			
			if global.FreeFall {
				_num = -16;
			}
			
			fire = true;
			direction = point_direction(x, y, obj_Player.x, obj_Player.y - _num);
			speed = 5;
			obj_SFXManager.airDashSound = true;
		}
		
		canHurt = true;
	}
} else {
	size -= 0.25;
	
	if size <= 0 {
		instance_destroy();
	}
	
	canHurt = false;
}
