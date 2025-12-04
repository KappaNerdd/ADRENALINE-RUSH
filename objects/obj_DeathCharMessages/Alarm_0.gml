global.Death = false;
global.DeathCountdown = 90;

if instance_exists(obj_PowerOrb) {
	obj_PowerOrb.active = true;
}

if room == rm_HeadSpeedBoss {
	global.Health = global.MaxHealth;
	
	if !instance_exists(obj_RoomTransParent) {
		instance_create_depth(0, 0, 0, obj_RoomTransitionSEGARestart);
	}
} else {
	obj_Player.vel = 0;
	obj_Player.yspd = 0;
	obj_Player.x = global.RespawnX;
	obj_Player.y = global.RespawnY;
	
	obj_Player.can_Move = true;
	obj_Player.playerHurt = false;
	
	if obj_Player.boostEnergy < 100 {
		obj_Player.boostEnergy = 100;
	}
	
	global.Health = global.MaxHealth;
}

if instance_exists(obj_RedDeath) {
	instance_destroy(obj_RedDeath);
}

gamepad_set_vibration(global.Player1Con, 0, 0);

instance_destroy();