/// @description Set Ambiance

var _finalVol = global.MASTER_VOL * global.AMBIENCE_VOL;

/*#region //MIND
	//MIND Rain Loop
	if mindRainLoop == true && !audio_is_playing(mindRainInst) {
		//Play Sound
		mindRainInst = audio_play_sound(amb_NormalRain, 8, true);
		audio_sound_gain(mindRainInst, _finalVol, 0);
	}

	if mindRainLoop == false && audio_is_playing(mindRainInst) {
		//Stop loop
		audio_stop_sound(mindRainInst);
	}
#endregion


#region //Hometown Intro
	
#endregion

