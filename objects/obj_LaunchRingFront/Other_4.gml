if !rainbow {
	image_speed = 0;
	image_index = 0;
	
	if !global.MIND && global.PlayerChar != 0 {
		sprite_index = spr_LauncherRingNorm;
	}
} else {
	image_speed = 1;
	
	if !global.MIND && global.PlayerChar != 0 {
		sprite_index = spr_LauncherRingRainbow;
	} else {
		sprite_index = spr_HeadLauncherRingRainbow
	}
}