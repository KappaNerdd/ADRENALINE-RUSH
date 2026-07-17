scr_EnemyStep();

flyAngle += flySpd;
y = savedY + lengthdir_y(6, flyAngle);

var _nearPlayer = instance_nearest(x, y, obj_Player);
mask_index = spr_HeadFleaIdle;

if distance_to_object(_nearPlayer) < 250 && !launched {
	if !agro {
		agro = true;
		image_index = 0;
		sprite_index = spr_HeadFleaRoar;
		image_speed = 1;
	} else {
		if image_index >= image_number - 3 {
			if spawnBallTimer > 0 {
				spawnBallTimer--;
			} else {
				spawnBallTimer = 60;
				
				with(instance_create_depth(x, y, depth - 1, obj_HeadFleaAttack)) {
					checkChar = other.id;
					createdChar = other.id;
				}
			}
		}
		
		if image_index >= image_number - 1 {
			image_index = image_number - 3;
			image_speed = 2;
		}
	}
} else {
	spawnBallTimer = spawnBallFrames;
	
	if agro {
		agro = false;
	} else {
		if sprite_index == spr_HeadFleaRoar {
			if image_index >= image_number - 1 {
				image_speed = -2;
			}
		}
		
		if image_index <= 1 {
			if sprite_index != spr_HeadFleaIdle {
				sprite_index = spr_HeadFleaIdle;
				image_speed = 1;
			}
		}
	}
}
