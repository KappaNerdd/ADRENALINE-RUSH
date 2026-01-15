rainbow = false;

launchVel = 0;
launchYspd = 0;

launchConfirmed = false;

launchFrames = 0;

launchSprite = 0;
launchxScale = 0;

giveScore = true;

with(instance_create_depth(x, y, depth + 2, obj_LaunchRingBack)) {
	image_angle = other.image_angle;
	image_speed = 0;
	image_index = 1;
	
	if !global.MIND && global.PlayerChar != 0 {
		sprite_index = spr_LauncherRingNorm;
	}
}