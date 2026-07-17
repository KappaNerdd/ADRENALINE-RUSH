global.Death = false;
global.DeathCountdown = 90;

if instance_exists(obj_PowerOrb) {
	obj_PowerOrb.active = true;
}

if global.PlayerExtraLives > 0 {
	if !global.FreeFall {
		instance_create_depth(x, y, depth, obj_RoomTransitionSEGACheckpoint);
	} else {
		instance_create_depth(x, y, depth, obj_RoomTransitionSEGARestart);
	}
	
	global.Health = global.MaxHealth;
}

obj_Player.vel = 0;
obj_Player.yspd = 0;
	
obj_Player.can_Move = true;
obj_Player.playerHurt = false;
	
if obj_Player.boostEnergy < 100 {
	obj_Player.boostEnergy = 100;
}

if instance_exists(obj_RedDeath) {
	instance_destroy(obj_RedDeath);
}

instance_destroy();