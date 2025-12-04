if spawnBirdTimer > 0 {
	spawnBirdTimer -= 1;
}


if spawnBirdTimer <= 0 {
	spawnBirdTimer = random_range(60 * 3, 60 * 8);
	
	var _birdY = random_range(0, 100);
	
	instance_create_depth(670, _birdY, depth, obj_CutSunriseBirds);
}