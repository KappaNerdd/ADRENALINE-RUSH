if global.ThunderCountdown > 0 {
	global.ThunderCountdown--;
} else {
	global.ThunderCountdown = random_range(60 * 5, 60 * 20);
	instance_create_depth(x, y, depth, obj_HeadThunder);
}