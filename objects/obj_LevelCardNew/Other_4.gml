if !global.CustomMus {
	if !global.Girly {
		playTrack = global.speedStageData[global.SpeedSelected].musicTrack;
	} else {
		playTrack = global.speedStageData[global.SpeedSelected].musicTrackGirly;
	}
	
	instance_create_depth(-100000, 0, 0, obj_MusicTag);
} else {
	playTrack = global.CustomMusic;
}
	
set_song_ingame(playTrack, 60, 30);