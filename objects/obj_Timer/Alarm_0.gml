if resetCount {
	global.seconds = 00.00;
	global.minutes = 0;
	global.Rings = 0;
	global.GameScore = 0;
	global.ScoreMult = 1;
	global.EnemyCount = 0;
	
	if !global.MIND && global.PlayerChar != 0 {
		image_speed = 0;
	}
}