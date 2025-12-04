function set_ambience_ingame(_ambience, _fadeOutCurrentAmbience = 0, _fadeInAmbience = 0) {
	//_ambience = Set to any ambience (noone = Stop ambience/no ambience playing)
	//_fadeOutCurrentAmbience = Time (in frames) the current ambience (if playing) will take to fade out
	//_fadeIn = Time (in frames) the target ambience (if not "noone") will take to fade in
	
	with(obj_AmbienceManager) {
		targetSongAsset = _ambience;
		endFadeOutTime = _fadeOutCurrentAmbience;
		startFadeInTime = _fadeInAmbience;
	}
	
}