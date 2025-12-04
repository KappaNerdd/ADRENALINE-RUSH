function scr_SetPauseTheme(_song, _fadeOutCurrentSong = 0, _fadeIn = 0) {
	//_song = Set to any song (noone = Stop song/no song playing)
	//_fadeOutCurrentSong = Time (in frames) the current song (if playing) will take to fade out
	//_fadeIn = Time (in frames) the target song (if not "noone") will take to fade in
	
	with(obj_PauseThemeManager) {
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
	}
	
}