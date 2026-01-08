var _plusUltra = 0;

if global.MIND or global.PlayerChar == 0 {
	_plusUltra = 5;
}

sprite_index = sprays[count + _plusUltra];

if global.speedStageData[global.SpeedSelected].jsrSecrets[count] {
	alive = false;
}