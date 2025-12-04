//If player collects, do some shit
if place_meeting(x, y, obj_Player) {
	with (instance_create_depth(x, y, depth, obj_ExtraLifeSil)) {
		sprite_index = other.sprite_index;
		image_index = other.image_index;
	}
	
	if !global.Freeplay {
		global.PlayerExtraLives += 1;
		global.CollectedLives += 1;
		obj_PlayerExtraLives.lifeScale = 1.5;
		obj_SFXManager.funkinCheckpoint = true;
	
		instance_destroy();
	} else {
		obj_SFXManager.rushModeGain = true;
		obj_Player.rushMode = true;
		obj_Player.boostEnergy = 300;
		obj_Player.rushModeTimer = obj_Player.rushModeFrames;
		
		instance_destroy();
	}
}



///-----Change based on character-----///

scr_GetCharLives();

image_index = global.PlayerCostume;