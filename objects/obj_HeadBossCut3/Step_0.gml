if lowerPlayerTimer > 0 {
	lowerPlayerTimer--;
	
	with(obj_Player) {
		y += 30;
		
		if y <= 500 {
			if !instance_exists(obj_DRFountainSmoke) {
				if sonicRush {
					obj_SFXManager.breakSonic = true;
				} else if blazeRush {
					obj_SFXManager.breakBlaze = true;
				}
			}
			
			scr_DRFountainSmoke(x, y, depth - 1, random_range(-3, 3), 0.25, c_black, c_white, 15, 0.25, 10);
		}
	}
} else {
	if raiseMeUpTimer > 0 {
		raiseMeUpTimer--;
		
		with(obj_Player) {
			y = ease(y, 216, 0.09, Easings.QUAD_IO);
		}
		
		if obj_HeadParallaxBack.extraY < 60 {
			obj_HeadParallaxBack.extraY += 1;
		} else {
			obj_HeadParallaxBack.extraY = 60;
		}
	}
}

if raiseMeUpTimer <= 0 {
	obj_Player.can_MoveFULL = true;
	obj_Player.dontCollide = false;
	
	if !playerMove {
		if obj_Player.vel != 0 or obj_Player.yspd != 0 {
			playerMove = true;
			scr_HealingEffect(obj_Player);
			scr_HealthPlayer(global.MaxHealth);
			scr_DRDamageNumbers(global.MaxHealth, obj_Player.x, obj_Player.y, 120, c_lime);
			global.countUp = true;
			global.DisableHUD = false;
		}
	} else {
		if gasterWait > 0 {
			gasterWait--;
		} else {
			gasterWait = 120;
			
			if !gaster1 {
				scr_GasterBlaster(384, obj_Player.y, obj_Player.depth - 1, 35, 3, 0, 90, 30);
				gaster1 = true;
			} else {
				if !gaster2 {
					scr_GasterBlaster(obj_Player.x, 216, obj_Player.depth - 1, 3, 30, 0, 90, 30);
					gaster2 = true;
				} else {
					if !gaster3 {
						scr_GasterBlaster(obj_Player.x, obj_Player.y, obj_Player.depth - 1, 45, 3, 45, 60, 60);
						scr_GasterBlaster(obj_Player.x, obj_Player.y, obj_Player.depth - 1, 45, 3, -45, 60, 60);
						gaster3 = true;
					}
				}
			}
		}
	}
}

if gaster3 {
	if enemyWait > 0 {
		enemyWait--;
	} else {
		if !spawnEnemies {
			spawnEnemies = true;
			
			scr_CreateEnemyCounter(4);
			
			with(instance_create_depth(384 - 250, 216 - 150, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFalse;
			}
			
			with(instance_create_depth(384 + 250, 216 - 150, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFalse;
			}
			
			with(instance_create_depth(384 - 250, 216 + 150, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFalse;
			}
			
			with(instance_create_depth(384 + 250, 216 + 150, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFalse;
			}
		}
	}
}

if spawnEnemies && !playerMove2 {
	if obj_Player.fallDash {
		playerMove2 = true;
	}
}

if spawnEnemies && !instance_exists(obj_EnemyCounter) {
	if funnyTimer > 0 {
		funnyTimer--;
	} else {
		if !itsEvenFunnierTheSecondTime {
			itsEvenFunnierTheSecondTime = true;
			
			scr_CreateEnemyCounter(4);
			
			with(instance_create_depth(384, 216 - 150, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFlea;
			}
			
			with(instance_create_depth(384, 216 + 150, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFlea;
			}
			
			with(instance_create_depth(384 - 250, 216, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFlea;
			}
			
			with(instance_create_depth(384 + 250, 216, depth, obj_SpawnEnemy)) {
				enemObject = obj_HeadFlea;
			}
		}
	}
}

if itsEvenFunnierTheSecondTime && !instance_exists(obj_EnemyCounter) {
	if doneTimer > 0 {
		doneTimer--;
	} else {
		instance_create_depth(x, y, depth, obj_HeadBossSequence);
		instance_destroy();
	}
}