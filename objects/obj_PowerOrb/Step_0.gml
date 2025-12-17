image_blend = global.fullRGB;

scr_GetCharRushBoostIcon();

if active {
	homingAttackable = true;
	
	if global.SimplifyVFX {
		sprite_index = spr_PowerOrbSimple;
	} else {
		sprite_index = spr_PowerOrb;
	}
} else {
	homingAttackable = false;
	
	sprite_index = spr_PowerOrbInactive;
}

//HitLag
var _time = current_time;  
while current_time - _time < hitLag {  
	
}  

if hitLag > 0 {
	hitLag -= hitLag;
}


if active && (place_meeting(x, y, obj_Player) or place_meeting(x, y, obj_StompVFX) or place_meeting(x, y, obj_IvyBullet) or place_meeting(x, y, obj_IvyBigBullet)) {
	hitLag = 240;
	active = false;
	scr_ControllerRumble();
	
	if global.Particles {
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
		instance_create_depth(x, y, depth, obj_PowerOrbPart);
	}
	
	if !global.SimplifyVFX {
		instance_create_depth(-1000000, 0, 0, obj_ParryFlash);
	}
		
	obj_SFXManager.parry = true;
	obj_SFXManager.itemBreak = true;
	
	if obj_Player.yspd > 0 && !obj_Player.ground && !obj_Player.stomping {
		obj_Player.yspd = -4;
	}
	
	//Powers
	if powerUp == 0 or powerUp == 1 or powerUp == 2 {
		obj_Player.boostEnergy += powers[powerUp][0];
		
		if obj_Player.rushMode {
			obj_Player.rushModeTimer = obj_Player.rushModeFrames;
			obj_SFXManager.rushModeTrick = true;
		}
		
		with (instance_create_depth(-1000000, 0, 0, obj_PowerUpHUD)) {
			powerUp = other.powerUp;
		}
	} else if powerUp == 3 or powerUp == 4 or powerUp == 5 or powerUp == 6 {
		global.Rings += powers[powerUp][0];
		obj_SFXManager.funkinFav = true;
	} else if powerUp == 7 {
		var _randomRing = random(ceil(5));
		
		obj_SFXManager.funkinFav = true;
		global.Rings += powers[powerUp][_randomRing];
	}
}

