var _enemyList = ds_list_create();
var _actualEnemy = instance_place_list(x, y, obj_ActionPlayer, _enemyList, false);

if global.DEBUG {
	visible = true;
} else {
	visible = false;
}

if active {
	depth = hitBoxCreator.depth - 2;
	
	if _actualEnemy > 0 {
		for(var i = 0; i < _actualEnemy; i++) {
			if _enemyList[| i].id != hitBoxCreator {
				if _enemyList[| i].perfectParryTimer <= 0 {
					if _enemyList[| i].invinceFrames <= 0 {
						//Ememies
						_enemyList[| i].hitStun = setStun;
						_enemyList[| i].hitLag = setLag;
						_enemyList[| i].state = setState;
						_enemyList[| i].vel = setVel;
						_enemyList[| i].yspd = setYspd;
						_enemyList[| i].imperfectParryTimer = 0;
						_enemyList[| i].EN += round(setEnergy) / 1.5;
				
						_enemyList[| i].wallBounce = setBounce;
						_enemyList[| i].floorBounce = setBounce;
				
						//Force enemies to look at the person who attacked them
						if !hitBoxCreator.leftFacer {
							if !_enemyList[| i].leftFacer {
								_enemyList[| i].image_xscale = -hitBoxCreator.image_xscale;
							} else {
								if hitBoxCreator.image_xscale == 1 {
									_enemyList[| i].face_Left = true;
								} else {
									_enemyList[| i].face_Left = false;
								}
							}
						} else {
							if !_enemyList[| i].leftFacer {
								if !hitBoxCreator.face_Left {
									_enemyList[| i].image_xscale = -1;
								} else {
									_enemyList[| i].image_xscale = 1;
								}
							} else {
								if !hitBoxCreator.face_Left {
									_enemyList[| i].face_Left = true;
								} else {
									_enemyList[| i].face_Left = false;
								}
							}
						}
				
						//Player
						hitBoxCreator.hitLag = setLag;
						hitBoxCreator.combo++;
						hitBoxCreator.EN += round(setEnergy);
				
						//Set Hitbox to inactive
						active = false;
				
						//Set Cam Shake & Con Rumble
						scr_ScreenShake(shakeScreen * 1.5);
						scr_ControllerRumble(controlRumble);
				
						//Sound Effects
						switch(setType) {
							case "Light":
								obj_SFXManager.lightHit = true;
							break;
					
							case "Medium":
								obj_SFXManager.mediumHit = true;
							break;
					
							case "Heavy":
								obj_SFXManager.heavyHit = true;
							break;
					
							case "HeavyL":
								obj_SFXManager.heavyLauncher = true;
							break;
						}
					}
				} else {
					instance_create_depth(-10000, 0, depth, obj_ParryFlash);
					
					hitBoxCreator.state = "hurtState";
					hitBoxCreator.hitStun = 50;
					hitBoxCreator.vel = 0;
					hitBoxCreator.yspd = -2;
					hitBoxCreator.attacking = false;
					
					_enemyList[| i].state = "freeState";
					_enemyList[| i].invinceFrames = 30;
					_enemyList[| i].perfectParryTimer = 0;
					_enemyList[| i].imperfectParryTimer = 0;
					_enemyList[| i].EN += 30;
					
					instance_destroy();
					obj_StageTrackerAction.hitLag = 200;
				}
			}
		}
	}
	
	ds_list_destroy(_enemyList);
}