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

