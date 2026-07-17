if !enemyWave {
	if enemyWaveTimer > 0 {
		enemyWaveTimer--;
	} else {
		enemyWaveTimer = 180;
		scr_GasterBlaster(384, obj_Player.y, depth - 1, 35, 4, 0, 90, 60);
	}
	
	if !spawnWave1 {
		spawnWave1 = true;
		
		scr_CreateEnemyCounter(5);
		
		with(instance_create_depth(384, 216 - 50, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
		
		with(instance_create_depth(384 - 250, 216 - 100, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
		
		with(instance_create_depth(384 + 250, 216 - 100, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
		
		with(instance_create_depth(384 - 250, 216 + 120, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
		
		with(instance_create_depth(384 + 250, 216 + 120, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
	} else {
		if !instance_exists(obj_EnemyCounter) {
			enemyWave = true;
		}
	}
}

if enemyWave {
	if !gasterWave {
		if gasterWaveTimer > 0 {
			gasterWaveTimer--;
		} else {
			gasterWave = true;
		}
		
		if blastTimer > 0 {
			blastTimer--;
		} else {
			if !blast1 {
				scr_GasterBlaster(384, obj_Player.y, depth - 1, 35, 3, 0, 45, 60);
				blastTimer = 15;
				blast1 = true;
			} else {
				if !blast2 {
					scr_GasterBlaster(obj_Player.x, 216, depth - 1, 3, 30, 0, 45, 60);
					blastTimer = 15;
					blast2 = true;
				} else {
					if !blast3 {
						scr_GasterBlaster(obj_Player.x, obj_Player.y, depth - 1, 45, 3, 45, 45, 60);
						blastTimer = 15;
						blast3 = true;
					} else {
						scr_GasterBlaster(obj_Player.x, obj_Player.y, depth - 1, 45, 3, -45, 45, 60);
						blastTimer = 120;
						blast1 = false;
						blast2 = false;
						blast3 = false;
					}
				}
			}
		}
	}
}

if gasterWave && !doneWave {
	if blastTimer2 > 0 {
		blastTimer2--;
	} else {
		if !blast4 {
			scr_GasterBlaster(150, 216, depth - 1, 3, 30, 0, 60, 30);
			blastTimer2 = 60;
			blast4 = true;
		} else {
			if !blast5 {
				scr_GasterBlaster(300, 216, depth - 1, 3, 30, 0, 60, 30);
				blastTimer2 = 60;
				blast5 = true;
			} else {
				if !blast6 {
					scr_GasterBlaster(450, 216, depth - 1, 3, 30, 0, 60, 30);
					blastTimer2 = 60;
					blast6 = true;
				} else {
					scr_GasterBlaster(600, 216, depth - 1, 3, 30, 0, 60, 30);
					blastTimer2 = 120;
					blast4 = false;
					blast5 = false;
					blast6 = false;
				}
			}
		}
	}
	
	if !enemyWave2 {
		enemyWave2 = true;
		scr_CreateEnemyCounter(3);
		
		with(instance_create_depth(384, 216 - 180, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 + 300, 216 + 180, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 - 300, 216 + 180, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
	} else {
		if !instance_exists(obj_EnemyCounter) {
			doneWave = true;
		}
	}
}

if doneWave && !doneWave2 {
	if blastTimer3 > 0 {
		blastTimer3--;
	} else {
		if !blast7 {
			scr_GasterBlaster(384, 50, depth - 1, 35, 2, 0, 60, 30);
			blastTimer3 = 60;
			blast7 = true;
		} else {
			if !blast8 {
				scr_GasterBlaster(384, 150, depth - 1, 35, 2, 0, 60, 30);
				blastTimer3 = 60;
				blast8 = true;
			} else {
				if !blast9 {
					scr_GasterBlaster(384, 250, depth - 1, 35, 2, 0, 60, 30);
					blastTimer3 = 60;
					blast9 = true;
				} else {
					scr_GasterBlaster(384, 350, depth - 1, 35, 2, 0, 60, 30);
					blastTimer3 = 90;
					blast7 = false;
					blast8 = false;
					blast9 = false;
				}
			}
		}
	}
	
	if !enemyWave3 {
		enemyWave3 = true;
		scr_CreateEnemyCounter(6);
		
		with(instance_create_depth(384, 216 - 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 + 250, 216 - 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 - 250, 216 - 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384, 216 + 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 + 250, 216 + 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 - 250, 216 + 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
	} else {
		if !instance_exists(obj_EnemyCounter) {
			doneWave2 = true;
		}
	}
}

if doneWave2 && !doneWave3 {
	if blastTimer4 > 0 {
		blastTimer4--;
	} else {
		if !blast10 {
			scr_GasterBlaster(384, 216, depth - 1, 2, 30, 0, 30, 30);
			blastTimer4 = 60;
			blast10 = true;
		} else {
			if !blast11 {
				scr_GasterBlaster(384, 216, depth - 1, 2, 30, 45, 30, 30);
				blastTimer4 = 60;
				blast11 = true;
			} else {
				if !blast12 {
					scr_GasterBlaster(384, 216, depth - 1, 40, 2, 0, 30, 30);
					blastTimer4 = 60;
					blast12 = true;
				} else {
					scr_GasterBlaster(384, 216, depth - 1, 40, 2, 45, 30, 30);
					blastTimer4 = 60;
					blast10 = false;
					blast11 = false;
					blast12 = false;
				}
			}
		}
	}
	
	if !enemyWave4 {
		enemyWave4 = true;
		scr_CreateEnemyCounter(6);
		scr_HealthPlayer(250000);
		scr_HealingEffect(obj_Player);
		scr_DRDamageNumbers(250000, obj_Player.x, obj_Player.y, 120, c_lime);
		obj_SFXManager.funkinCheckpoint = true;
		
		with(instance_create_depth(384, 216 - 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
		
		with(instance_create_depth(384 + 200, 216 - 100, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 + 200, 216 + 100, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
		
		with(instance_create_depth(384, 216 + 150, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
		
		with(instance_create_depth(384 - 200, 216 + 100, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFalse;
		}
		
		with(instance_create_depth(384 - 200, 216 - 100, depth, obj_SpawnEnemy)) {
			enemObject = obj_HeadFlea;
		}
	} else {
		if !instance_exists(obj_EnemyCounter) {
			doneWave3 = true;
			
			scr_GasterBlaster(384 - 370, 216, depth - 1, 3, 30, 0, 60, 510);
			scr_GasterBlaster(384 + 370, 216, depth - 1, 3, 30, 0, 60, 510);
			scr_GasterBlaster(384, 216 - 220, depth - 1, 40, 3, 0, 60, 510);
			scr_GasterBlaster(384, 216 + 220, depth - 1, 40, 3, 0, 60, 510);
		}
	}
}

if doneWave3 && !doneWave4 {
	if !changeTheme {
		changeTheme = true;
		scr_SetMusPos(81.5);
	}
	
	if blastingTimer > 0 {
		blastingTimer--;
		
		if blastTimer5 > 0 {
			blastTimer5--;
		} else {
			if blastingTimer > 120 {
				if !blast13 {
					scr_GasterBlaster(384, 216, depth - 1, 3, 30, 0, 15, 25);
					blastTimer5 = 15;
					blast13 = true;
				} else {
					if !blast14 {
						scr_GasterBlaster(384, 216, depth - 1, 3, 30, 45, 15, 25);
						blastTimer5 = 15;
						blast14 = true;
					} else {
						if !blast15 {
							scr_GasterBlaster(384, 216, depth - 1, 40, 3, 0, 15, 25);
							blastTimer5 = 15;
							blast15 = true;
						} else {
							scr_GasterBlaster(384, 216, depth - 1, 40, 3, 45, 15, 25);
							blastTimer5 = 15;
							blast13 = false;
							blast14 = false;
							blast15 = false;
						}
					}
				}
			}
		}
	} else {
		doneWave4 = true;
		global.DisableHUD = true;
		global.countUp = false;
		
		with(obj_Player) {
			can_MoveFULL = false;
			yspd = 0;
			drawAngle = 0;
			fakeHurt = false;
			playerHurt = false;
			hurtTimer = 0;
			dontCollide = true;
			image_speed = 2;
			scr_ControlSpeedCreate();
		}
		
		instance_create_depth(384, 700, obj_Player.depth - 2, obj_GOALRingVerti);
	}
}

if doneWave4 {
	if !moveDownPlayer {
		global.PlayerID.x = ease(global.PlayerID.x, 384 + 30, 0.075, Easings.QUAD_IO);
		global.PlayerID.y = ease(global.PlayerID.y, 216 - 30, 0.075, Easings.QUAD_IO);
		
		if obj_GOALRingVerti.y > 260 {
			obj_GOALRingVerti.yspd = -1.5;
		} else {
			obj_GOALRingVerti.yspd = 0;
			obj_GOALRingVerti.y = 260;
			moveDownPlayer = true;
		}
	} else {
		obj_Player.y += 30;
	}
}