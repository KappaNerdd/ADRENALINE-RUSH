if spawnCloudTimer > 0 {
	spawnCloudTimer -= 1;
}


if spawnCloudTimer <= 0 {
	spawnCloudTimer = random_range(60 * 20, 60 * 40);
	
	var _cloudY = random_range(-100, 0);
	
	instance_create_depth(640, _cloudY, depth, obj_CutSunriseClouds);
}