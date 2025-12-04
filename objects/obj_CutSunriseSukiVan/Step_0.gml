if carShineTimer > 0 {
	carShineTimer -= 1;
}

if carShineTimer <= 0 {
	carShineTimer = random_range(60, 60 * 4);
	sprite_index = carShine;
	image_index = 0;
}
