global.CollectedLives = 0;

image_xscale = 1;
image_yscale = 1;

if instance_exists(obj_Player) {
	depth = obj_Player.depth + 1;
}

if global.Freeplay {
	with(instance_create_depth(x + 25, y + 25, depth, obj_PowerOrb)) {
		powerUp = 2;
	}
	
	instance_destroy();
}