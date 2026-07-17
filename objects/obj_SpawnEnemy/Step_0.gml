if global.SimplifyVFX {
	image_speed = 0;
}

if !spawnEnemy {
	if image_yscale < 3 {
		image_yscale += 0.075;
	} else {
		if spawnEnemyTimer > 0 {
			spawnEnemyTimer--;
		} else {
			spawnEnemy = true;
			obj_SFXManager.stomped = true;
			scr_ControllerRumble();
			scr_ScreenShake();
		
			with(instance_create_depth(x, y, depth - 1, obj_EnemySpawner)) {
				enemObject = other.enemObject;
			}
		
			repeat(3) {
				scr_DRFountainSmoke(x, y, depth - 2, random_range(-3, 3), 0.25, c_black, c_white, 10, 0.5, 20);
			}
		}
	}
} else {
	if kysTimer > 0 {
		kysTimer--;
	} else {
		image_yscale -= 0.075;
		
		if image_yscale <= 0 {
			instance_destroy();
		}
	}
}