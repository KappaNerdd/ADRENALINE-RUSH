//If obj_LevelCard doesn't exist, kill yourself NOW
if !instance_exists(obj_LevelCardMinor) {
	instance_destroy();
}

sprite_index = levelNum;

if instance_exists(obj_LevelCardLevelMinor) {
	image_alpha = obj_LevelCardLevelMinor.image_alpha;
}

xChange = lerp(xChange, 20, 0.1);