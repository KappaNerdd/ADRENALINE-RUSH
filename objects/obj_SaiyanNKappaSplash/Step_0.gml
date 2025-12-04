getCharacterControls();

if jump_Key or pause_Key {
	if !instance_exists(obj_RoomTransitionSEGAMenu) {
		var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionSEGAMenu);
		instantiated.target_rm = target_rm;
	}
}

if xspd > 0 {
	xspd -= 0.1;
	
	if silTimer > 0 {
		silTimer -= 1;
	}
	
	if silTimer <= 0 {
		silTimer = 10;
		
		if !global.SimplifyVFX {
			instance_create_depth(x, y, depth, obj_SaiyanNKappaSilSplash);
		}
	}
}

x += xspd;

if xspd <= 0 {
	if !splashCon {
		splashCon = true;
		image_xscale = 0.275;
		image_yscale = 0.275;
		
		obj_SFXManager.funkinFav = true;
	}
	
	if image_xscale > 0.26 {
		image_xscale -= 0.01;
	}
	
	if image_yscale > 0.26 {
		image_yscale -= 0.01;
	}
	
	
	if splashAlpha < 1 {
		splashAlpha += 0.1;
	}
	
	if splashTimer > 0 {
		splashTimer -= 1;
	}
	
	if splashTimer <= 0 {
		if !instance_exists(obj_RoomTransitionSEGAMenu) {
			var instantiated = instance_create_depth(0, 0, -999999, obj_RoomTransitionSEGAMenu);
			instantiated.target_rm = target_rm;
		}
	}
}