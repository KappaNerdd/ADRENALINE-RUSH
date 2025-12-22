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


